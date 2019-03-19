package com.book;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import com.vo.BookVO;

import com.vo.YesCate1VO;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

public class BookDao {
	//물리적으로 떨어져 있는 오라클 서버에 연결하기
	Connection con = null;
	//연결된 후에 그 통로를 통해서 DML구문을 가져갈 전령
	PreparedStatement pstmt = null;
	CallableStatement cstmt = null;
	OracleCallableStatement ocstmt = null;
	//select인 경우만 필요한 인터페이스
	//역할:오라클의 커서를 자바 코드로 조작할 수 있도록 메소드를 제공.
	//Front-end(클라이언트측-UI-변심-html,css,js) , Back-end(서버측-돈-java,jsp,spring)
	//VO(Value Object)-디자인패턴 , DTO(Data Transfer Object)
	//DAO(Data Access Object)-디자인패턴
	ResultSet rs = null;
	DBTest dbTest = DBTest.getInstance();
	public int bookDelete(String goods_num) {
		int result = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM yes_goods");
		sql.append(" WHERE goods_num= ?");
		try {
			con = dbTest.getconnection();
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, goods_num);
			//select일 경우 오라클 서버에 요청할 땐 executeQuery()사용
			//insert|update|delete일 경우 오라클 서버에 요청할 때 executeUpdate()사용
			//result 1:삭제성공, 0:삭제 실패
			result = pstmt.executeUpdate();
		} catch (Exception e) {//try..catch사이에 사용한 코드가 예외발생가능성이 있는 코드
			System.out.println(e.toString());//예외가 발생했을 때 힌트를 얻는 문장
		} 
		return result;
	}
	/******************************************************************
	 * 제목:refcursor활용하여 조회결과 꺼내기
	 * 
	 ******************************************************************/
	public List<YesCate1VO> getCategory(){
	//List - Interface - 기능 - 결합도 낮추는 코드, 개발할 기능 명세서
    //       단독으로는 인스턴스화가 불가하다. 반드시 구현체 클래스가 있어야함.
	//       다형성(폴리모피즘)을 누릴 수 있다.	
	//인스턴스화 할 때 선언부와 생성부의 이름이 다를 수 있다.	
		//List<YesCate1VO> cateList = null;
		List<YesCate1VO> cateList = new ArrayList<YesCate1VO>();
		try {
			con = dbTest.getconnection();//인스턴스화-인터페이스라서..
			cstmt = con.prepareCall("{call proc_cate1List(?)}");//인스턴스화
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			//오라클 서버에게 실행 요청하기
			boolean isOK = cstmt.execute();
			ocstmt = (OracleCallableStatement)cstmt;
			ResultSet cursor = ocstmt.getCursor(1);
			YesCate1VO yvo = null;
			while(cursor.next()) {
				//cateList = new ArrayList<YesCate1VO>();
				yvo = new YesCate1VO();
				yvo.setCate_num(cursor.getString("cate_num"));
				yvo.setCate_num(cursor.getString("cate_bunryu"));
				cateList.add(yvo);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return cateList;
	}
	/*****************************************************************8
	 * 도서 목록 전체 조회 구현
	 * @param bvo - 조건 검색일 경우만 사용해요.
	 * @return - BookVO[] - why?:검색된 결과가 n개 로우이니깐.....
	 ******************************************************************/
	public BookVO[] getBookList(BookVO pbvo) {
		BookVO[] bVOS = null;//내(BookVO[]) 안에 너(BookVO)있다.
		BookVO rbVO = null;
		//DB에 저장된 데이터 로우의 갯수를 알아내기 위해서 사용함.
		//SELECT count(*) FROM yes_goods
		//왜 Vector를 사용했나?
		//조회 건수가 n건 일때 n건을 객체배열에 담아야 함. - 이 때 Vector사용하면 자바 API를 사용해서 담음.
		Vector<BookVO> v = new Vector<BookVO>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT                                                     ");
	    sql.append("       goods_num, goods_name, goods_paia                   ");
	    sql.append("      ,goods_ea||'원' goods_ea                             ");
	    sql.append("      ,DECODE(goods_use,'NEW','새책','1','중고서적','없음') goods_use");             
	    sql.append("      ,goods_date, book_maker, goods_memo                   ");
	    sql.append("  FROM yes_goods                                           ");
	    //너 혹시 상세조회를 원해?
	    //NumberFormatException 주의할것.
	    System.out.println("도서번호:"+pbvo.getGoods_num());
	    System.out.println("콤보박스 라벨:"+pbvo.getSearch());
	    if(Integer.parseInt(pbvo.getGoods_num())>0) {
	    	sql.append(" WHERE goods_num = ?");
	    }
	    else if("제목".equals(pbvo.getSearch())) {
	    	sql.append("  WHERE goods_name LIKE ?||'%'");
	    }
	    else if("저자".equals(pbvo.getSearch())) {
	    	sql.append("  WHERE book_maker LIKE ?||'%'");
	    }
	    else if("내용".equals(pbvo.getSearch())) {
	    	sql.append("  WHERE goods_memo LIKE '%'||?||'%'");
	    }
	    sql.append(" order by goods_num");
	    //insert here - 복습할 내용
	    try {
	    	con = dbTest.getconnection();
	    	//
	    	pstmt = con.prepareStatement(sql.toString());
		    if(Integer.parseInt(pbvo.getGoods_num())>0) {
		    	//?자리에 들어갈 값을 초기화 해줌.
		    	pstmt.setString(1, pbvo.getGoods_num());
		    }
		    //사용자가 조건검색기에서 제목 혹은 저자 혹은 내용을 선택했을 때 - 조건검색 서비스
		    else if("제목".equals(pbvo.getSearch())
		    	  ||"저자".equals(pbvo.getSearch()) 
		    	  ||"내용".equals(pbvo.getSearch())) {
		    	pstmt.setString(1, pbvo.getKeyword());
		    }
		    //자바디버깅은 eclipse로 오라클 디버깅은 Toad에서...
		    System.out.println("[[query]]"+sql.toString());
	    	rs = pstmt.executeQuery();
	    	while(rs.next()) {
	    		//insert here - 복습내용
	    		//조회 건수가 n건이므로 1건씩 BookVO에  멤버변수에 담기위해
	    		rbVO = new BookVO(rs.getString("goods_num")
	    				         ,rs.getString("goods_name")
	    				         ,rs.getString("goods_paia")
	    				         ,rs.getString("goods_memo")
	    				         ,rs.getString("goods_ea")
	    				         ,rs.getString("goods_use")
	    		                 ,rs.getString("goods_date")
	    		                 ,rs.getString("book_maker"));//주소번지가 927개가 생겨요
	    		//setter메소드를 통해서 멤버변수에 조회된 결과를 담음.
	    		//이것을 생성자를 통해서도 할 수 있어요.
	    		//파라미터가 없는 디폴트 생성자는 JVM이 없으면 자동지원함.
	    		//파라미터가 있는 경우 개발자마다 생각이 다를 수 있으니깐 제공 불가.
/*	    		rbVO.setGoods_num(rs.getString("goods_num"));
	    		rbVO.setGoods_name(rs.getString("goods_name"));
	    		rbVO.setGoods_paia(rs.getInt("goods_paia"));
	    		rbVO.setGoods_ea(rs.getString("goods_ea"));
	    		rbVO.setGoods_use(rs.getString("goods_use"));*/
	    		v.add(rbVO);//927
	    	}
	    	System.out.println("v.size():"+v.size());
	    	bVOS = new BookVO[v.size()];
	    	v.copyInto(bVOS);
/*	    	System.out.println(bVOS[1].getGoods_name());
	    	System.out.println(bVOS[2].getGoods_name());
	    	System.out.println(bVOS[4].getGoods_name());*/
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return bVOS;
	}
	//입력처리
	//모든 업무에 필요한 sql문 미리 Toad에서 테스틀 합니다.
	//그러면 SQLException을 피할 수 있다.
	//오라클에러는 Toad에 힌트를 얻는게 좋다.- ORA-XXXXXX상수를 출력해주니까
	//테이블의 컬럼명과 BookVO의 전역변수명과 화면의 컴포넌트이름은 통일
	//명명규칙을 정해서 사용해야 할 것 같다.
	public String getGoodsNum() {
		String goods_num = null;
		//한정된 자원(도서관,대중교통)을 여러명이 공유해야할  때
		//문자열을 처리하는 클래스에는 String, StringBuffer(멀티스레드안전-속도 느려요), StringBuilder(싱글스레드안전-속도빨라요)
		//String은 덩어리로 저장-끼워넣기, 원본이 안바뀜(재정의)- 비효율적이다.
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT MAX(goods_num)+1 as goods_num FROM yes_goods");
		sql.append(" ORDER BY goods_num desc               ");
		try {
			con = dbTest.getconnection();
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			rs.next();
			goods_num = rs.getString("goods_num");
		} catch (Exception e) {
			System.out.println(e.toString());//힌트를 출력, 디버깅, 부적합한 식별자,뷰나 테이블이 존재하지 않습니다.
		}
		return goods_num;
	}
	public int bookInsert(BookVO pbVO) {
		StringBuilder sql = new StringBuilder();
		int result = 0;
		sql.append("INSERT INTO yes_goods(goods_num, goods_name, goods_paia");
        sql.append("                     ,goods_ea,goods_date, book_maker");
        sql.append("                     ,cate_num,goods_use, goods_memo)");
        sql.append(" VALUES(?,?,?,?,?,?,?,?,?)");
		try {                                                              
			con = dbTest.getconnection();
			pstmt = con.prepareStatement(sql.toString());
			System.out.println("11");
			int i=1;
			pstmt.setString(i++, pbVO.getGoods_num());
			pstmt.setString(i++, pbVO.getGoods_name());
			pstmt.setInt(i++, Integer.parseInt(pbVO.getGoods_paia()));
			System.out.println("11");
			pstmt.setString(i++, pbVO.getGoods_ea());
			pstmt.setString(i++, pbVO.getGoods_date());
			pstmt.setString(i++, pbVO.getBook_maker());
			pstmt.setString(i++, pbVO.getCate_num());
			pstmt.setString(i++, pbVO.getGoods_use());
			pstmt.setString(i++, pbVO.getGoods_memo());
			System.out.println("11");
			result = pstmt.executeUpdate();
			System.out.println("result:"+result);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;//클래스를 여러개로 나누어 관리할 때 주의할것.
	}
}





