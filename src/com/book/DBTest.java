package com.book;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBTest {
	
	public final String _DRIVER = "oracle.jdbc.driver.OracleDriver";
	public final String _URL ="jdbc:oracle:thin:@192.168.0.6:1521:orcl11";
	public final String _USER = "scott";
	public final String _PW = "tiger";
	Connection con = null;
	//객체 주입을 해주는 메소드를 따로 구현해보기.
	//클래스 메소드이니까 인스턴스화 없이 바로 호출가능.
	public static DBTest getInstance() {
		DBTest dbtest = null;
		if(dbtest==null) {
			dbtest = new DBTest();
			
		}
		return dbtest;
	}
    //오라클서버의 드라이버 클래스가 메모리에 정상적으로 로딩 되는지 체크.
    public boolean driverTest() {
     boolean isok= false;
     try {
		Class.forName(_DRIVER);
		isok = true;
	} catch (ClassNotFoundException ce) {
		System.out.println("드라이버 클래스를 찾을수 없습니다.");
		isok = false;
	}
    	return isok;
    }
    //물리적으로 떨어져있는 서버에연결통로 확보 되었는지 체크.
    public boolean connectTest() {
        boolean isok= false;
    	try {
			
			Class.forName(_DRIVER);
			con = DriverManager.getConnection(_URL, _USER, _PW);
			if(con!=null) {
			isok =true;}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
    	return isok;
    }
    public Connection getconnection() {//Connection 을 가져오는 메소드
      
    	try {
			
			Class.forName(_DRIVER);
			con = DriverManager.getConnection(_URL, _USER, _PW);	
		} catch (Exception e) {
			System.out.println(e.toString());
		}
    	return con;
    }
    public static void main(String args[]) {
   	DBTest DB =new DBTest();
   	BookDao bDao = new BookDao();
   	int result = bDao.bookDelete("");
   	System.out.println("처리결과는=="+result);
//    	 boolean isok =DB.driverTest();
//    	 boolean isok2 =DB.connectTest();
//    	 
//    	System.out.println(isok);
//    	System.out.println(isok2);
    	
      }	
}
