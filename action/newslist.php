<?php
$data = array(
	array(
		"id" => 1,
		"title" => "广东原副省长与东莞首富再相见",
		"writer" => "小名1",
		"date" => 1455808822088,
		"content" => "新闻内容1"
	),
	array(
		"id" => 2,
		"title" => "北方草原遇今年首场强沙尘暴",
		"writer" => "小名2",
		"date" => 1455808822088,
		"content" => "新闻内容2"
	),
	array(
		"id" => 3,
		"title" => "中国亿万富豪加拿大被杀",
		"writer" => "小名3",
		"date" => 1455808822088,
		"content" => "新闻内容3"
	),
	array(
		"id" => 4,
		"title" => "广东原副省长与东莞首富再相见",
		"writer" => "小名4",
		"date" => 1455808822088,
		"content" => "新闻内容4"
	),
	array(
		"id" => 5,
		"title" => "中国亿万富豪加拿大被杀",
		"writer" => "小名5",
		"date" => 1455808822088,
		"content" => "新闻内容5"
	)
);
$result = array(
	"errno" => 0,
	"data" => $data
);
echo json_encode($result);