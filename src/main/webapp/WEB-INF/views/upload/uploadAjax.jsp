<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>UploadForm</title>
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
  <h3>Ajax File Upload</h3>
  <div class="fileDrop"></div>
  <div class="uploadedList"></div>
  
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
    	// html5 에서 지원하는 FormData 객체를 이용하면
    	// <form>태그로 만든 데이터의 전송 방식과 동일하게 
    	// 파일 데이터를 전송할 수 있다.
    	var formData = new FormData();
    	formData.append("file", file);
    	
    	// p 541 Ajax 처리하기
    	$.ajax({
    		url:'/upload/uploadAjax.htm'
    		, data:formData
    		, dataType:'text'
    		, processData: false  // 반드시 p 542
    		, contentType: false  // 반드시
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
