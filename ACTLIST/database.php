<?php

$db_host = 'localhost';
$db_user = 'root';
$db_pass = 'a00580308';
$db_name = 'activities';
$db_port = 3306;

// 建立連接
$conn = new mysqli($db_host, $db_user, $db_pass, $db_name);

// 檢查連接
if ($conn->connect_error) {
  die("連接失敗: " . $conn->connect_error);
}
