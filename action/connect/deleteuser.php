<?php
  $id = $_GET['id'];
  $con= mysql_connect("127.0.0.1","root","");
  mysql_select_db("article",$con);
  mysql_query("SET NAMES UTF8");
  $result=mysql_query("DELETE FROM userlist WHERE id = {$id}");
  if($result){
  	$res=array(
          "data"=>array(),
          "errno"=>0
  		);
  	echo json_encode($res);
  }
 
?>