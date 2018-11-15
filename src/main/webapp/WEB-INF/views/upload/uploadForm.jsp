<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>UploadForm</title>
	<style>
	  iframe{
	    width:0px;
	    height:0px;
	    border:0px;	  
	  }
	</style>
</head>
<body>

<form id="form1" action="uploadForm.htm" 
method="post" enctype="multipart/form-data"
target="zeroFrame">
  <input type="file" name="file" />  <br>
  <input type="submit" />  
</form>
<iframe name="zeroFrame"></iframe>

<script>
  function addFilePath(msg){
	  alert(msg);
	  document.getElementById("form1").reset();
  }
</script>


<!--

create table tbl_message
(
  mno number primary key
  ,targetid varchar2(50) not null
  ,sender varchar2(50) not null
  ,message clob not null
  ,opendate date
  ,senddate date default(sysdate)
);
create sequence seq_tbl_message;


create table tbl_user
(
  id varchar2(50) primary key
  , upw varchar2(50)
  , uname varchar2(100)
  , upoint number default(0)
);

alter table tbl_message 
add constraint fk_tbl_message_id
foreign key (targetid) references tbl_user(id);

alter table tbl_message 
add constraint fk_tbl_message_usersender
foreign key (sender) references tbl_user(id);
 
 -->
</body>
</html>
