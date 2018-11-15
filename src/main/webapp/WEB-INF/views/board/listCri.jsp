<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.pagination a {
    color: black;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
}

.pagination li.active a{
    background-color: dodgerblue;
    color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.pagination li{
    list-style: none;
}
</style>

<script type="text/javascript">
  var result = '${msg}';
  if(result == 'success'){
	  alert("처리가 완료되었습니다.");
  }
</script>
</head>
<body>
	<table border="1" style="width: 70%;margin: 0 auto;">
	    <tr>
		  <td colspan="5" align="right">
		    <a href="/board/register">Register</a>
		  </td>
		</tr>
		<tr>
			<th style="width: 10px">BNO</th>
			<th style="width: 40%">TITLE</th>
			<th>WRITER</th>
			<th>REGDATE</th>
			<th style="width: 40px;">VIEWCNT</th>
		</tr>
		
		<c:if test="${ empty list }">
			<tr>
				<td colspan="5" style="height: 100px;text-align: center;">게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${ not empty list }">
			<c:forEach items="${list }" var="vo">
				<tr>
					<td>${ vo.bno }</td>
					<td><a href="/board/readPage?bno=${ vo.bno }&page=${pageMaker.cri.page}">${ vo.title }</a></td>
					<td>${ vo.writer }</td>
					<td><fmt:formatDate value="${ vo.regdate }"
							pattern="yyyy-MM-dd HH:mm" /></td>
					<td><span>${ vo.viewcnt }</span></td>
				</tr>
			</c:forEach>
		</c:if>
		
		<tr>
		   <td colspan="5" >
		   <div class="pagination" style="text-align: center">
		    <c:if test="${ pageMaker.prev }">
		      <li><a href="listCri?page=${ pageMaker.startPage -1 }">&laquo;</a></li>
		    </c:if>
		    <c:forEach begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" var="i">
		      <li <c:out value="${ pageMaker.cri.page == i? 'class=active' : '' }"></c:out>>
		        <a href="listCri?page=${ i }">${ i }</a>
		      </li>
		    </c:forEach>
		    <c:if test="${ pageMaker.next }">
		      <li><a href="listCri?page=${ pageMaker.endPage +1 }">&raquo;</a></li>
		    </c:if>
		   </div> <!-- div class="pagination"  -->
		  </td>
		</tr>
		
		<tr>
		  <td colspan="5" align="right">
		    <a href="/board/register">Register</a>
		  </td>
		</tr>



	</table>
</body>
</html>