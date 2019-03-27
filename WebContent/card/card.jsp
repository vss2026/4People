<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
</style>
 <div class="modal-dialog">
    <div class="modal-content" style="width:810px; height:800px;">
      <div class="modal-header" style="background-color:#D9D9D9">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel" >Modal title</h4>
      </div>
      <div class="modal-body" style="width:808px; height:800px; background-color:#D9D9D9">
        <div  class="col-sm-10">
        <!-- 라벨 div -->
         <div id="card_label" style="margin-left:20px; margin-bottom:50px;">
         <h3>라벨</h3>
         </div>
        <!-- 라벨 div -->
        
        <!-- 참여자 div -->
         <div id="card_member" style="margin-left:20px; margin-bottom:50px;">
         <h3>참여자</h3>
         </div>
        <!-- 참여자 div -->
    
        <!-- 요약 div -->
         <div id="card_description" style=" margin-bottom:50px;">
         <h3><img src="../images/description2.png">요약</h3>
          <div>
         <input type="text" style="margin-left:50px; width:500px; height:150px">
         </div>
         <div>
         <input type="button" style="margin-left:50px; margin-top:5px" class="btn btn-success col-sm-2 col-sm-offset-5" value="저장">
         </div>
         </div>
        <!-- 요약 div -->
      
        <!-- 첨부파일 div -->
         <div id="card_c_file" style=" margin-bottom:50px;">
         <h3><img src="../images/c_file2.png">첨부파일</h3>
         </div>
        <!-- 첨부파일 div -->
        
        <!-- 한마디 div -->
         <div id="card_hanmadi" style=" margin-bottom:50px;">
         <h3><img src="../images/hanmadi.png">한마디</h3>
         <div>
         <input type="text" style="margin-left:50px; width:500px; height:150px">
         </div>
         <div>
         <input type="button" style="margin-left:50px; margin-top:5px" class="btn btn-success col-sm-2 col-sm-offset-5" value="저장">
         </div>
         </div>
        <!-- 한마디 div -->
         
         <!-- 댓글 -->
         <div id="coment">
         </div>
         <!-- 댓글 -->
         
        </div>
        <div class="col-sm-2">
        <butuon type="button" class="btn btn-default" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px; margin-top:30px" ><img src="../images/description.png">요약</butuon>
        <butuon type="button" class="btn btn-default" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/member.png">참여자</butuon>
        <butuon type="button" class="btn btn-default" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px" onClick="labelAdd()"><img src="../images/label.png">라벨</butuon>
        <butuon type="button" class="btn btn-default" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/checklist.png">체크리스트</butuon>
        <butuon type="button" class="btn btn-default" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/gihan.png">기한설정</butuon>
        <butuon type="button" class="btn btn-default" style="text-align:left; width:120px; background-color:#CFCFCF; margin-bottom:8px"><img src="../images/c_file.png">첨부파일</butuon>
        </div>
      </div>
    </div>
  </div>