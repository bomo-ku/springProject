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
    	self.location="/board/listAll";
    });
    
    $(".btn-primary").on("click", function (){
    	formObj.submit();
    });
});
</script>
</head>
<body>
 <form role="form" method="post">
  bno <input type="text" name="bno" value="${ vo.bno }" readonly="readonly" /><br>
  Title  <input type="text" name="title" value="${ vo.title }" /><br>
  Content <br>
  <textarea rows="3" name="content">${ vo.content }</textarea>
  <br>
  Writer  <input type="text" name="writer" value="${ vo.writer }" readonly="readonly"/><br>
  <button type="submit" class="btn-primary">Save</button>
  <button type="submit" class="btn-warning">Cancel</button>
 </form>
</body>
</html>