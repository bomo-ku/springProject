<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <!-- 파일업로드 -->
    	<style>
	  .fileDrop{
	    width:100%;
	    height:200px;
	    border:1px dotted blue;	  
	  }
	  small{
	    margin-left: 3px;
	    font-weight: bold;
	    color:gray;
	  }
	</style>
	<script type="text/javascript">
	  function checkImageType(fileName){
		  var pattern=/jpg$|gif$|png$|jpeg$/i;
		  return fileName.match(pattern);
	  }
	  
	  function getImageLink(fileName){
		  if(!checkImageType(fileName)){
			  return;
		  }
		  var front = fileName.substr(0,12);
		  var end = fileName.substr(14);
		  return front + end;
	  }
	</script>
	
</head>
<body>
 <form role="form" method="post">
  Title  <input type="text" name="title"/><br>
  Content <br>
  <textarea rows="3" name="content"></textarea> <br>
 
    <h3>Ajax File Upload</h3>
  <div class="fileDrop"></div>
  <div class="uploadedList"></div><br>
  
  <s:authentication property="name" var="loginUser"/>
  Writer  <input type="text" name="writer" value="${ memberVO.name }"/><br>
  	
  
  <button type="submit">Submit</button>
 </form>
 
 <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <script>
    $(".fileDrop").on("dragenter dragover", function (event){
    	event.preventDefault();
    });
    $(".fileDrop").on("drop", function (event){
    	event.preventDefault();
    	
    	var files = event.originalEvent.dataTransfer.files;
    	var file = files[0];
    	
    	console.log(file);
    	// p 540
    	// html5 ìì ì§ìíë FormData ê°ì²´ë¥¼ ì´ì©íë©´
    	// <form>íê·¸ë¡ ë§ë  ë°ì´í°ì ì ì¡ ë°©ìê³¼ ëì¼íê² 
    	// íì¼ ë°ì´í°ë¥¼ ì ì¡í  ì ìë¤.
    	var formData = new FormData();
    	formData.append("file", file);
    	
    	// p 541 Ajax ì²ë¦¬íê¸°
    	$.ajax({
    		url:'/upload/uploadAjax.htm'
    		, data:formData
    		, dataType:'text'
    		, processData: false  // ë°ëì p 542
    		, contentType: false  // ë°ëì
    		, type:'POST'
    		, success: function(data){
    			//alert(data);
    			var str = "";
    			// p 574
    			console.log(data);
    			console.log(checkImageType(data));
    			if( checkImageType(data)){
    				str = "<div>"
    				+ "<a href='displayFile.htm?fileName="+getImageLink(data)+"'>"
    				+ "<img src='displayFile.htm?fileName="+data+"' />"
    				+ getImageLink(data)+"</a>"
    				+ "<small data-src="+ data +">X</small>"
    				+ "</div>";
    			}else{
    				str = "<div>" 
    				+ "<a href='displayFile.htm?fileName="+data+"'>"
    				+ getOriginalName(data)+"</a>"
    				+ "<small data-src="+ data +">X</small>"
    				+"</div>";
    			}
    			
    			$(".uploadedList").append(str);
    		}
    	,statusCode: {
    	    404: function() {
    	        alert( "page not found" );
    	      }
    	    }
    	});
    });
    
   
    // p 579
    $(".uploadedList").on("click","small", function (event){
    	var that = $(this);
    	$.ajax({
    		url:"/upload/deleteFile.htm"
    		, type: "post"
    		, data: {fileName:$(this).attr("data-src")}
    	    , dataType: "text"
    	    , success:function(result){
    	    	if(result == 'deleted'){
    	    		alert("deleted");
    	    		that.parent("div").remove();
    	    	}
    	    }
    	});
    }); 
  </script>
</body>
</html>