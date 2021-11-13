<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
html, body { height: 100%;}

/* So that the modal is displayed in the preview.. You can probably remove this and the above rule */
.img-modal {
  display: block;
}

.img-modal .modal-dialog {
    /* An arbitrary minimum height. Feel free to modify this one as well */
    min-height: 350px;
    height: 80%;
    width:100%;
}

.img-modal .modal-content, .img-modal .modal-body, .img-modal .row, .img-modal .modal-image {
    height: 100%;
    
}

.modal-content {
    border-radius: 0;
}

.modal-body {
    padding-top: 0;
    padding-bottom: 0;
}

.modal-image {
    background: #000;
    padding :0;
}

.modal-image img {
    margin: 0 auto;
    max-height: 100%;
    max-width: 100%;
    
    position: relative;
    top: 50%;
    -webkit-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    transform: translateY(-50%);
}

.img-modal .img-modal-btn {
    display: block;
    position: absolute;
    top: 0;
    bottom: 0;
    background: black;
    opacity: 0;
    font-size: 1.5em;
    width: 45px;
    color: #fff;
    transition: opacity .2s ease-in;
}

.img-modal .modal-image:hover .img-modal-btn {
    opacity: 0.4;  
}

.img-modal .modal-image:hover .img-modal-btn:hover {
   opacity: 0.75;   
}

.img-modal .img-modal-btn.right {
    right: 0;
}

.img-modal .img-modal-btn i {
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
    text-align: center;
    margin-top: -.75em;
}

.img-modal .modal-meta {
    position: relative;   
    height: 100%;
}

.img-modal .modal-meta-top {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 45px;
    padding: 5px 10px;
    overflow-y: auto;
}

.img-modal .modal-meta-top .img-poster img {
    height: 70px;
    width: 70px;
    float: left;
    margin-right: 15px;
}

.img-modal .modal-meta-top .img-poster strong {
    display: block; 
    padding-top: 15px;
}

.img-modal .modal-meta-top .img-poster span {
    display: block;   
    color: #aaa;
    font-size:.9em;
}

.img-modal .modal-meta-bottom {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 5px;
    border-top: solid 1px #ccc;
}

.img-modal .img-comment-list {
    list-style: none;  
    padding: 0;
}
.img-modal .img-comment-list li {
    margin:0;
    margin-top:10px;
}

.img-modal .img-comment-list li > div {
    display:table-cell;
}

.img-modal .img-comment-list img {
    border-radius:50%;
    width: 42px;
    height: 42px;
    margin-right: 10px;
    margin-top: 20px;
}

.img-modal .img-comment-list p {
    margin: 0;
}

.img-modal .img-comment-list span {
    font-size: .8em; 
    color: #aaa;
}

@media only screen and (max-width : 992px) {
    .modal-content {
        border-radius: 0;
        max-height: 100%;
        overflow-y: auto;
    }
    
    .img-modal .modal-image {
        height: calc(100% - 100px);
    }
    
    .img-modal .modal-meta {
        height: auto;
    }
    
    .img-modal .modal-meta-top {
        position: static;
        padding-top: 15px;
    }
    
    .img-modal .modal-meta-bottom {
        position: static;
        margin: 0 -15px;
    }
}
</style>
</head>
<body>
	<div class="modal img-modal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="width:100%; margin-top:-30px">
      <div class="modal-body">
        <div class="row">
          <div class="col-md-8 modal-image">
            <img class="img-responsive " src="${ pageContext.servletContext.contextPath }/resources/upload_files/${a.changeFile}">
            

            <a href="" class="img-modal-btn left"><i class="glyphicon glyphicon-chevron-left"></i></a>
            <a href="" class="img-modal-btn right"><i class="glyphicon glyphicon-chevron-right"></i></a>
          </div>
          <div class="col-md-4 modal-meta">
            <div class="modal-meta-top">
              <button type="button" class="close" onclick="close();"><span aria-hidden="true">×</span></button>
             
		
              <div class="img-poster clearfix">
                <form id="postForm" action="" method="post">
					<input type="hidden" name="sno" value="${ s.snsNo }">
					<input type="hidden" name="fileName" value="${ a.changeFile }"> 
				</form>
				
				<c:if test="${  loginUser.empNO == s.empNo }">
                <button type="button" onclick="deleteSns();" >게시글 삭제</button>
                
                
                <script>
                	function deleteSns(){
                		var data = $("#postForm").serialize();
                
                		
                		$.ajax({
                			type : 'post',
                			url : "delete.sns",
                			data : data,
                			dataType : 'json',
                			
                			success : function(data){
                				
                				opener.parent.location.reload();
               					window.close();
                			}
                		});
                	};
                </script>
                
                
                
                 </c:if>
              </div>

              <ul class="img-comment-list"><table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                    	<c:if test="${ !empty loginUser }">
	                        <th colspan="2" style="width:75%">
	                            <textarea class="form-control" id="replyContent" rows="2" style="resize:none; width:100%"></textarea>
	                        </th>
	                        <th style="vertical-align: middle"><button class="btn btn-secondary" id="addReply" type="button">등록하기</button></th>
                        </c:if>
                        <c:if test="${ empty loginUser }">
                        	<th colspan="2" style="width:75%">
	                            <textarea class="form-control" readonly rows="2" style="resize:none; width:100%">로그인한 사용자만 사용가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
	                        </th>
	                        <th style="vertical-align: middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
                        </c:if>
                    </tr>
                    
                </thead>
                <tbody>
                
                </tbody>
            </table>
        </div>
        <br><br>
    </div>
     <script>

 	$(function(){
		selectReplyList();
		
		$("#addReply").click(function(){
    		var sno = ${s.snsNo};

			if($("#replyContent").val().trim().length != 0){
				
				$.ajax({
					url:"rinsert.sns",
					type:"post",
					data:{replyContent:$("#replyContent").val(),
						  SnsNo:sno,
						  replyWriter:"${loginUser.empName}"},
					success:function(result){
						
						if(result > 0){
							$("#replyContent").val("");
							selectReplyList();
							
						}else{
							alert("댓글등록실패");
						}
					},error:function(){
						console.log("댓글 작성 ajax 통신 실패");
					}
				});
				
			}else{
				alert("댓글등록하셈");
			}
			
		});
	});
	
	function selectReplyList(){
		var sno = ${s.snsNo};
		$.ajax({
			url:"rlist.sns",
			data:{sno:sno},
			type:"get",
			success:function(list){
				
				
				
				var value="";
				$.each(list, function(i, obj){
					
					if("${loginUser.empName}" == obj.replyWriter){
						value += "<tr style='background:#EAFAF1'>";
					}else{
						value += "<tr>";
					}
					
					value += "<th>" + obj.ReplyWriter + "</th>" + 
								 "<td>" + obj.ReplyContent + "</td>" + 
								 "<td>" + obj.ReplyDate + "</td>" +
						 "</tr>";
						 
						 
				});
				$("#replyArea tbody").html(value);
			},error:function(){
				console.log("댓글 리스트조회용 ajax 통신 실패");
			}
		});
	}
	
	
    </script>
                
                
                
              </ul>
            </div>
            
          </div>
        </div>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>
<script>
	function close(){
		window.close();
	}
</script>


</body>
</html>