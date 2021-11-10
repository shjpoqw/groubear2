<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		
		<form id="insertForm" action="insert.lv" method="post">
			<h5>조직도</h5>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>&nbsp;</th>
						<th>이름</th>
		                <th>직위</th>
		                <th>부서</th>
		                <th>사번</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ mList }" var="ml">
						<tr>
							<td><input type="checkbox" name="checkboxName"></td>
							<td>${ ml.empName }</td>
			                <td>${ ml.jobName }</td>
			                <td>${ ml.deptName }</td>
			                <td>${ ml.empNO }</td>
			            </tr>
		            </c:forEach>
				</tbody>
			</table>
			<br>
			
			<h5>상세 입력</h5>
			<table class="table table-bordered">
				<tr>
					<th><label for="count">연차 발생 개수</label></th>
			        <td><input type="text" id="count" class="form-control" name="count" required></td>
				</tr>
			</table>
			<br><br>
		
			<!-- hidden -->
			<input type="hidden" id="empNo" class="form-control" name="empNo">
			
			<div class="btns" align="center">
				<button type="submit" id="writeBtn" class="btn btn-primary">생성하기</button>
		    </div>

		</form>
		
	</div>
			
	<script type="text/javascript">
		$("#insertForm").on("submit", function(){
			var checkbox = $("input[name=checkboxName]:checked");
			 
			var col1 = "";
			var col2 = "";
			var col3 = "";
			var col4 = "";
			 
			checkbox.each(function (i) {
			    var tr = checkbox.parent().parent().eq(i);  // checkbox 태그의 두 단계 상위 태그가 tr이기 때문에
			    var td = tr.children();  // td 태그는 tr 태그의 하위에 있으므로
			 
			    col1 = td.eq(1).text(); // 1번째 column(eq(0))은 체크박스 이므로 eq(1)부터 데이터를 받아줌
			    col2 = td.eq(2).text();
			    col3 = td.eq(3).text();
			    col4 = td.eq(4).text();
			});
			
			//$("#empName").val(col1);
			//$("#deptName").val(col2);
			//$("#jobName").val(col3);
			$("#empNo").val(col4);
			
			$("#insertForm").submit();
			
			$("#modal").hide();
		});
		
		function funcE(){
			var checkbox = $("input[name=checkboxName]:checked");
			 
			var col1 = "";
			var col2 = "";
			var col3 = "";
			var col4 = "";
			 
			checkbox.each(function (i) {
			    var tr = checkbox.parent().parent().eq(i);  // checkbox 태그의 두 단계 상위 태그가 tr이기 때문에
			    var td = tr.children();  // td 태그는 tr 태그의 하위에 있으므로
			 
			    col1 = td.eq(1).text(); // 1번째 column(eq(0))은 체크박스 이므로 eq(1)부터 데이터를 받아줌
			    col2 = td.eq(2).text();
			    col3 = td.eq(3).text();
			    col4 = td.eq(4).text();
			});
			
			$("#empName").val(col1);
			$("#deptName").val(col2);
			$("#jobName").val(col3);
			$("#empNo").val(col4);
			
			$("#insertForm").submit();
			
			$("#modal").hide();
		}
	
	</script>
	 
</body>
</html>