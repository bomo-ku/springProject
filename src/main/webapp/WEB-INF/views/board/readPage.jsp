<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var formObj = $('form[role="form"]');
	console.log(formObj);
	
    $(".modifyBtn").on("click", function (){
    	formObj.attr("action","/board/modifyPage");
    	formObj.attr("method","get");
    	formObj.submit();
    });
    
    $(".removeBtn").on("click", function (){
    	formObj.attr("action","/board/removePage"); 
    	formObj.submit();
    });
    /* 
    $(".btn-primary").on("click", function (){
    	self.location="/board/listAll";
    });
     */
    $('.goListBtn').on("click",function (){
    	formObj.attr("method","get");
    	formObj.attr("action","/board/listCri");
    	formObj.submit();
    }); 
});
</script>
</head>
<body>
 <!-- p 294 수정 -->
 <form role="form" method="post" action="modifyPage">
   <input type="hidden" name="bno" value="${ boardVO.bno }" />
   <input type="hidden" name="page" value="${ cri.page }" />
   <input type="hidden" name="perPageNum" value="${ cri.perPageNum }" />
 </form>
 
 
  Title  <input type="text" name="title" value="${ boardVO.title }" readonly="readonly" /><br>
  Content <br>
  <textarea rows="3" name="content" readonly="readonly" >${ boardVO.content }</textarea>
  <br>
  Writer  <input type="text" name="writer" value="${ boardVO.writer }" readonly="readonly" /><br>
  <button type="submit" class="btn-warning modifyBtn">Modify</button>
  <button type="submit" class="btn-danger removeBtn">Remove</button>
  <button type="submit" class="btn-primary goListBtn">GO LIST</button>
  <br>
  
</body>
</html>