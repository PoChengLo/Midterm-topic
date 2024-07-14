<?php
include 'database.php';

if (isset($_GET['id'])) {
  $id = $_GET['id'];

  // 刪除 actbook 表中的相關條目
  $sql_actbook = "DELETE FROM actbook WHERE act_id='$id'";
  if ($conn->query($sql_actbook) === TRUE) {
    // 刪除 actlist 表中的活動
    $sql_actlist = "DELETE FROM actlist WHERE act_id='$id'";
    if ($conn->query($sql_actlist) === TRUE) {
      $message = "刪除成功";
    } else {
      $message = "錯誤: " . $conn->error;
    }
  } else {
    $message = "錯誤: " . $conn->error;
  }

  // 關閉資料庫連接
  $conn->close();

  // 使用JavaScript顯示通知並返回到主頁
  echo "<script>
            alert('$message');
            window.location.href = 'index.php';
          </script>";
}
