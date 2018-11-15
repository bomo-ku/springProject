<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<ul>
  <li><a href="/uploadForm">/uploadForm</a></li>
  <li><a href="/uploadAjax">/uploadAjax</a></li>
</ul>
<!--
create table tbl_attach
(
  fullName varchar2(150) primary key
  , bno number not null
  , regdate date default(sysdate)
);
--
alter table tbl_attach
add constraint fk_tbl_attach_bno
   foreign key(bno) references tbl_board(bno); 
 --> 
</body>
</html>
