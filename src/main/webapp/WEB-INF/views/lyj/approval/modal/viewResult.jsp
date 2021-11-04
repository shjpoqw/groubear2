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
	</div>
	
	<div class="btns" align="center">
		<button type="button" class="btn btn-default" onclick="funcM()">중간 결재자</button>
        <button type="button" class="btn btn-default" onclick="funcF()">최종 결재자</button>
    </div>
	
	<script type="text/javascript">
		function funcM(){
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
			
			$("#mName").val(col1);
			$("#mDept").val(col2);
			$("#mJob").val(col3);
			$("#mNo").val(col4);
			
			$("#modal").hide();
		}
		
		function funcF(){
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
			
			$("#fName").val(col1);
			$("#fDept").val(col2);
			$("#fJob").val(col3);
			$("#fNo").val(col4);
			
			$("#modal").hide();
		}
	
	</script>
	 
</body>
</html>