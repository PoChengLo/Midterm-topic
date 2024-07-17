<?php
include 'database.php';

$id = $_GET['id'];

// 查詢特定活動資料
$sql = "SELECT * FROM actlist WHERE act_id='$id'";
$result = $conn->query($sql);
$row = $result->fetch_assoc();

// 查詢所有用戶資料
$user_sql = "SELECT user_id, user_name, email FROM userinfo";
$user_result = $conn->query($user_sql);
?>

<!DOCTYPE html>
<html>

<head>
  <title>修改活動</title>
  <link rel="stylesheet" type="text/css" href="style_act.css">
</head>

<body>
  <div class="container">
    <h1>修改活動</h1>
    <form method="post" action="edit_act_api.php?id=<?php echo $id; ?>">
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
              <?php echo $user['user_name'] . " (" . $user['email'] . ")"; ?>
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
        <a class="button" href="index_act.php">返回活動列表</a>
      </div>
    </form>
  </div>

</body>

</html>

<?php
// 關閉資料庫連接
$conn->close();
?>