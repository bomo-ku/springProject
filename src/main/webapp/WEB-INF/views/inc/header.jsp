	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
 <%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>   

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



</head>
<body>

    
		<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="index.html">Start Bootstrap</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="/index.htm">Home</a>
          <!--   </li>
            <li class="nav-item">
              <a class="nav-link" href="about.html">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="post.html">Sample Post</a>
            </li> -->
            <li class="nav-item">
              <a class="nav-link" href="/sboard/list.htm">Board</a>
             </li>
            <li class="nav-item">
              <a class="nav-link" href="/upload/uploadForm.htm">uploadForm</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/upload/uploadAjax.htm">uploadAjax</a>
            </li>
            </ul> 
            <!-- 로그인 한 사용자 정보 얻어올 수 있다. -->	
             <ul class="navbar-nav ml-auto">	
               <li class="nav-item">				
					
						<s:authorize ifNotGranted="ROLE_USER">
						   <a href="${pageContext.request.contextPath }/joinus/login.htm">로그인</a>						
						</s:authorize>
						<s:authorize ifAnyGranted="ROLE_USER, ROLE_ADMIN">
						   <s:authentication property="name" var="loginUser"/>
						   <a href="${pageContext.request.contextPath }/j_spring_security_logout">[${loginUser}]로그아웃</a>					
						</s:authorize>		
				</li>			
					<li class="nav-item">
						<a href="/joinus/join.htm">Join</a>
					</li>
          </ul>   				     
        </div> 
      </div>
    </nav>

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('resources/img/home-bg.jpg')">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-lg-8 col-md-10 mx-auto">
            <div class="site-heading">
              <h1>Clean Blog</h1>
              <span class="subheading">A Blog Theme by Start Bootstrap</span>
            </div>
          </div>
        </div>
      </div>
    </header>
