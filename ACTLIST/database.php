<?php
// $servername = "localhost";
// $username = "root"; // 默認的XAMPP使用者名稱
// $password = "a00580308"; // 默認的XAMPP密碼為空
// $dbname = "activities"; // 你的資料庫名稱

$servername = "127.0.0.1";
$username = "root"; // 默認的XAMPP使用者名稱
$password = ""; // 默認的XAMPP密碼為空
$dbname = "new_db_0718"; // 你的資料庫名稱


// 建立連接
$conn = new mysqli($servername, $username, $password, $dbname);

// 檢查連接
if ($conn->connect_error) {
  die("連接失敗: " . $conn->connect_error);
}
