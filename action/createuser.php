<?php
$name=$_POST['username'];
$password=$_POST['password'];
$sex=$_POST['sex'];
$telephone=$_POST['telephone'];
$info=$_POST['info'];
$con=mysql_connect("127.0.0.1","root","");
mysql_select_db("article",$con);
mysql_query("SET NAMES UTF8");
$result=mysql_query("INSERT INTO userlist(username,telephone,password,sex,info) VALUES('$name','$telephone','$password','$sex','$info')");
if($result){
	$res=array(
       "data"=>array(),
       "errno"=>0
    );
	echo json_encode($res);
	// echo $res;写法错误返回报错
};
?>