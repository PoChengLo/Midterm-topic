<?php
include 'database.php';

$id = $_GET['id'];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $act_name = $_POST['act_name'];
  $act_date = $_POST['act_date'];
  $user_id = $_POST['user_id']; // 改為抓取 user_id
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
            window.location.href = 'index.php';
          </script>";
  exit;
}

$sql = "SELECT * FROM actlist WHERE act_id='$id'";
$result = $conn->query($sql);
$row = $result->fetch_assoc();

// 查詢所有用戶資料
$user_sql = "SELECT user_id, user_name, user_email FROM users";
$user_result = $conn->query($user_sql);
?>

<!DOCTYPE html>
<html>

<head>
  <title>修改活動</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
  <div class="container">
    <h1>修改活動</h1>
    <form method="post" action="">
      <div class="form-group">
        <label>活動名稱:</label>
        <input type="text" name="act_name" value="<?php echo $row['act_name']; ?>" required>
      </div>
      <div class="form-group">
        <label>活動時間:</label>
        <input type="datetime-local" name="act_date" value="<?php echo date('Y-m-d\TH:i', strtotime($row['act_date'])); ?>" required>
      </div>
      <div class="form-group">
        <label>活動發起人:</label>
        <select name="user_id" required>
          <?php while ($user = $user_result->fetch_assoc()) { ?>
            <option value="<?php echo $user['user_id']; ?>" <?php if ($user['user_id'] == $row['user_id']) echo 'selected'; ?>>
              <?php echo $user['user_name'] . " (" . $user['user_email'] . ")"; ?>
            </option>
          <?php } ?>
        </select>
      </div>
      <br>
      <div class="form-group">
        <label>活動內容:</label>
        <textarea class="form-control" name="act_desc" id="act_desc" rows="5"><?= htmlentities($row['act_desc']) ?></textarea>
      </div>
      <br>
      <div class="form-group">
        <input class="button" type="submit" value="修改">
        <a class="button" href="index.php">返回活動列表</a>
      </div>
    </form>
  </div>

</body>

</html>

<?php
// 關閉資料庫連接
$conn->close();
?>