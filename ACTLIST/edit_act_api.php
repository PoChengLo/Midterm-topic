<?php
include 'database.php';

$id = $_GET['id'];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $act_name = $_POST['act_name'];
  $act_date = $_POST['act_date'];
  $user_id = $_POST['user_id']; // 從表單中獲取 user_id
  $act_desc = $_POST['act_desc'];

  // Update actlist table, 包括 user_id
  $sql = "UPDATE actlist SET act_name='$act_name', act_date='$act_date', act_desc='$act_desc', user_id='$user_id' WHERE act_id='$id'";

  if ($conn->query($sql) === TRUE) {
    $message = "修改成功";
  } else {
    $message = "錯誤: " . $conn->error;
  }

  // 關閉資料庫連接
  $conn->close();

  // 使用JavaScript顯示通知並返回到主頁
  echo "<script>
            alert('$message');
            window.location.href = 'index_act.php';
          </script>";
  exit;
}

// 如果直接訪問edit_act_api.php而不是通過表單提交，則返回到主頁
header("Location: index_act.php");
exit;
