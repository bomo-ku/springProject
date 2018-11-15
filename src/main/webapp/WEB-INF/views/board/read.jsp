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
	
    $(".btn-warning").on("click", function (){
    	formObj.attr("action","/board/modify");
    	formObj.attr("method","get");
    	formObj.submit();
    });
    
    $(".btn-danger").on("click", function (){
    	formObj.attr("action","/board/remove");
    	formObj.attr("method","post");
    	formObj.submit();
    });
    
    $(".btn-primary").on("click", function (){
    	self.location="/board/listAll";
    });
});
</script>
</head>
<body>
 <form role="form" method="post">
   <input type="hidden" name="bno" value="${ boardVO.bno }" readonly="readonly" />
 </form>
  Title  <input type="text" name="title" value="${ boardVO.title }" readonly="readonly" /><br>
  Content <br>
  <textarea rows="3" name="content" readonly="readonly" >${ boardVO.content }</textarea>
  <br>
  Writer  <input type="text" name="writer" value="${ boardVO.writer }" readonly="readonly" /><br>
  <button type="submit" class="btn-warning">Modify</button>
  <button type="submit" class="btn-danger">Remove</button>
  <button type="submit" class="btn-primary">List ALL</button>
 
</body>
</html>