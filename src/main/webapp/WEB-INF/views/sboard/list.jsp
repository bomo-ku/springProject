	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
     <%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>   


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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	// 65 line 코딩 대체
	var searchType = '${cri.searchType}';
	$('#searchType').val(searchType);
	// 
	
	$('#searchBtn').on("click", function (event){
		self.location = "list?page=1&perPageNum=10&searchType="
				+ $('select option:selected').val()+"&keyword="
				+ encodeURIComponent($('#keywordInput').val()); 
	});
	$("#newBtn").on("click", function (event){
		self.location="register.htm";
	});
});
</script>


<!-- content 부분 -->

    <h2 style="text-align: center">Search Board</h2>
	<table border="1" style="width: 70%;margin: 0 auto; text-align: center;">
	    <tr>
	       <td colspan="5" align="center">
		    <div class="box-body">
		      <%-- 
		      <select name="searchType" id="">		      
		        <option value="n" <c:out value="${cri.searchType == null?'selected':'' }"/>>--</option>
		        <option value="t" <c:out value="${cri.searchType == 't'?'selected':'' }"/>>Title</option>
		        <option value="c" <c:out value="${cri.searchType == 'c'?'selected':'' }"/>>Content</option>
		        <option value="w" <c:out value="${cri.searchType == 'w'?'selected':'' }"/>>Writer</option>
		        <option value="tc" <c:out value="${cri.searchType == 'tc'?'selected':'' }"/>>Title & Content</option>
		        <option value="cw" <c:out value="${cri.searchType == 'cw'?'selected':'' }"/>>Content & Writer</option>
		        <option value="tcw" <c:out value="${cri.searchType == 'tcw'?'selected':'' }"/>>Title & Content & Writer</option>
		      </select>
		       --%>
		      <select name="searchType" id="searchType">		      
		        <option value="n" >--</option>
		        <option value="t" >Title</option>
		        <option value="c" >Content</option>
		        <option value="w" >Writer</option>
		        <option value="tc" >Title & Content</option>
		        <option value="cw" >Content & Writer</option>
		        <option value="tcw" >Title & Content & Writer</option>
		      </select> 
		      
		      <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}" />
		      <button id="searchBtn">Search</button>
		      <button id="newBtn">New Board</button>
		    </div>
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
					<td><a href="/sboard/readPage.htm?bno=${ vo.bno }&page=${pageMaker.cri.page}&searchType=${ cri.searchType }&keyword=${cri.keyword}">${ vo.title }</a></td>
					<td>${ vo.writer }</td>
					<td><fmt:formatDate value="${ vo.regdate }"
							pattern="yyyy-MM-dd HH:mm" /></td>
					<td><span>${ vo.viewcnt }</span></td>
				</tr>
			</c:forEach>
		</c:if>
		
		<tr>
		   <td colspan="5">
		   <div class="pagination" style="text-align: center">
		    <c:if test="${ pageMaker.prev }">
		      <li><a href="list.htm?page=${ pageMaker.startPage -1 }&perPageNum=${cri.perPageNum}&searchType=${ cri.searchType }&keyword=${cri.keyword}">&laquo;</a></li>
		    </c:if>
		    <c:forEach begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" var="i">
		      <li <c:out value="${ pageMaker.cri.page == i? 'class=active' : '' }"></c:out>>
		        <a href="list.htm?page=${ i }&perPageNum=${cri.perPageNum}&searchType=${ cri.searchType }&keyword=${cri.keyword}">${ i }</a>
		      </li>
		    </c:forEach>
		    <c:if test="${ pageMaker.next }">
		      <li><a href="list.htm?page=${ pageMaker.endPage +1 }&perPageNum=${cri.perPageNum}&searchType=${ cri.searchType }&keyword=${cri.keyword}">&raquo;</a></li>
		    </c:if>
		   </div> <!-- div class="pagination"  -->
		  </td>
		</tr>
		
		<tr>
		  <td colspan="5" align="right">
		  <s:authentication property="name" var="loginUser"/>
		    <a href="/sboard/register.htm?userid=${loginUser}">Register</a>
		  </td>
		</tr>
	</table>

</body>
</html>