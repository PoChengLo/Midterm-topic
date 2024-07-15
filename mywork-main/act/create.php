<?php
include 'database.php';

// 如果需要，從 users 資料表獲取會員資料
$user_sql = "SELECT user_id, user_name, user_email FROM users";
$user_result = $conn->query($user_sql);


if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $act_name = $_POST['act_name'];
  $act_date = $_POST['act_date'];
  $user_id = $_POST['user_id']; // 從表單中獲取 user_id
  $act_desc = $_POST['act_desc'];

  $sql = "INSERT INTO actlist (act_name, act_date, act_desc, user_id, act_type, act_create)
  VALUES ('$act_name', '$act_date', '$act_desc', '$user_id', 'default_value_for_act_type', 'default_value_for_act_create')";


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
          window.location.href = 'index.php';
        </script>";
}
?>

<!DOCTYPE html>
<html>

<head>
  <title>新增活動</title>
  <link rel="stylesheet" type="text/css" href="style_act.css">
</head>

<body>
  <div class="container">
    <h1>新增活動</h1>
    <form method="post" action="">
      <div class="form-group">
        <label>活動名稱:</label>
        <input type="text" name="act_name" required>
      </div>
      <div class="form-group">
        <label>活動時間:</label>
        <input type="datetime-local" name="act_date" required>
      </div>
      <div class="form-group">
        <label>活動發起人:</label>
        <select name="user_id" required>
          <?php while ($user = $user_result->fetch_assoc()) { ?>
            <option value="<?php echo $user['user_id']; ?>">
              <?php echo $user['user_name'] . " (" . $user['user_email'] . ")"; ?>
            </option>
          <?php } ?>
        </select>
      </div>
      <br>
      <div class="form-group">
        <label>活動內容:</label>
        <textarea name="act_desc" required></textarea>
      </div>
      <br>
      <div class="form-group">
        <input class="button" type="submit" value="新增">
        <a class="button" href="index.php">返回活動列表</a>
      </div>
    </form>
  </div>
</body>

</html>

<?php $conn->close(); ?>