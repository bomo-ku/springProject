<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><tiles:getAsString name="title" /></title>
<link href="/joinus/<tiles:getAsString name="css" />" type="text/css" rel="stylesheet" />

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
		   $(document).ready(function(){
			   $("#day").blur(function(){				   
				   var birth = $("#year").val() +  $("#month").val() +  $("#day").val();				   
				   $("#birth").val(birth);				   
				   
			   });			   
		   });				
		</script>
</head>
<body>

	<!--header -->
	<tiles:insertAttribute name="header" />
	<!--visual -->
	<tiles:insertAttribute name="visual" />

	<div id="main">
		<div class="top-wrapper clear">

            <!--navi 부분  -->
			<tiles:insertAttribute name="aside" />
			<!--content 부분  -->
			<tiles:insertAttribute name="content" />
			

		</div>
	</div>
	<!--footer 부분  -->
	<tiles:insertAttribute name="footer" />

</body>
</html>
