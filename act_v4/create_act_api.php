<?php
include 'database.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $act_name = $_POST['act_name'];
  $act_date = $_POST['act_date'];
  $user_id = $_POST['user_id']; // 從表單中獲取 user_id
  $act_desc = $_POST['act_desc'];

  // 獲取當前的日期時間
  $act_create = date('Y-m-d H:i:s');

  // 創建 SQL 插入語句，包括 $act_create 變量
  $sql = "INSERT INTO actlist (act_name, act_date, act_desc, user_id, act_type, act_create)
        VALUES ('$act_name', '$act_date', '$act_desc', '$user_id', 'default_value_for_act_type', '$act_create')";

  if ($conn->query($sql) === TRUE) {
    $message = "新增成功";
  } else {
    $message = "錯誤: " . $sql . "<br>" . $conn->error;
  }

  // 關閉資料庫連接
  $conn->close();

  // 使用 JavaScript 顯示通知並返回到主頁
  echo "<script>
          alert('$message');
          window.location.href = 'index_act.php';
        </script>";
}
