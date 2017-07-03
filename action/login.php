<?php

// header("Content-type: text/html; charset=utf-8");

$res = json_decode(file_get_contents('php://input', 'r'), true);

session_start();
// $username=$_GET['username'];
// $password=$_GET['password'];
// echo $res['username'];
// echo $res['password'];
$con=mysql_connect("127.0.0.1","root","");
mysql_select_db("article",$con);
mysql_query("SET NAMES UTF8");
$user=mysql_query("SELECT * FROM userlist");
while ($result=mysql_fetch_array($user)) {
	if($result['username']==$res['username'] && $result['password']===$res['password']){		
		$_SESSION['username'] = $res['username'];
        $_SESSION['password'] = $res['password'];
        $opt = array('errno' => 0, 'data' => array('username' => $res['username']));
		break;
	}else{
		$opt = array('errno' => 1, 'data'=> "登录失败，用户名或密码错误");
	}
}
 echo json_encode($opt);


//登录成功
// $_SESSION['username'] = $_POST['username'];
// $_SESSION['userid'] = $_POST['password'];
