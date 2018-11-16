<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Clean Blog - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS -->
    <!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.css">

    <!-- Custom fonts for this template -->
    <!-- <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <!-- <link href="css/clean-blog.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/clean-blog.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var formObj = $('form[role="form"]');
	
    $(".btn-warning").on("click", function (){
    	self.location="/sboard/list.htm?page=${cri.page}&perPageNum=${cri.perPageNum}";
    });
    
    $(".btn-primary").on("click", function (){
    	formObj.submit();
    });
});
</script>
</head>
<body>
 <form role="form" method="post">
  <input type="hidden" name="page" value="${ cri.page }" />
  <input type="hidden" name="perPageNum" value="${ cri.perPageNum }" />
 
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