<?php
session_start();

//检测是否登录
if(!isset($_SESSION['username'])){
	$res = array(
		"data" => null,
		"errno" => 1,
		"msg" => "please login"
	);
	echo json_encode($res);
    exit();
}

$title = $_GET['title'];
$writer = $_GET['writer'];
$content = $_GET['content'];
$con = mysql_connect("127.0.0.1","root","");
mysql_select_db("article",$con);
mysql_query("SET NAMES UTF8");
$result = mysql_query("INSERT INTO newslist(title,writer,content)VALUES('$title','$writer','$content')");
if($result){
$res = array(
	"data" => array(),
	"errno" => 0
);
echo json_encode($res);
};

?>