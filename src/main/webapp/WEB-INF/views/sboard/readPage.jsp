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
	console.log(formObj);
	
    $(".modifyBtn").on("click", function (){
    	formObj.attr("action","/sboard/modifyPage.htm");
    	formObj.attr("method","get");
    	formObj.submit();
    });
    
    $(".removeBtn").on("click", function (){
    	formObj.attr("action","/sboard/removePage.htm"); 
    	formObj.submit();
    });	
    /* 
    $(".btn-primary").on("click", function (){
    	self.location="/board/listAll";
    });
     */
    $('.goListBtn').on("click",function (){
    	formObj.attr("method","get");
    	formObj.attr("action","/sboard/list.htm");
    	formObj.submit();
    }); 
});
</script>
</head>
<body>
 <!-- p 294 수정 -->
 <form role="form" method="post" action="modifyPage.htm">
   <input type="hidden" name="bno" value="${ boardVO.bno }" />
   <input type="hidden" name="page" value="${ cri.page }" />
   <input type="hidden" name="perPageNum" value="${ cri.perPageNum }" />
   
   <input type="hidden" name="searchType" value="${ cri.searchType }" />
   <input type="hidden" name="keyword" value="${ cri.keyword }" />
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