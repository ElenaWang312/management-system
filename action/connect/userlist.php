<?php
  $con = mysql_connect("127.0.0.1","root","");
  mysql_select_db("article",$con);
  mysql_query("SET NAMES UTF8");
  $result=mysql_query("SELECT * FROM userlist");
  while ($row = mysql_fetch_array($result)) {
  	$arr[]=$row;
  };
  $data=array(
     "errno"=>0,
     "data"=>$arr
  	);
  echo json_encode($data);
?>