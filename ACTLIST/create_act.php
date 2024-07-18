<?php
include 'database.php';

// 從 userinfo 資料表獲取會員資料
$user_sql = "SELECT user_id, user_name, email FROM userinfo";
$user_result = $conn->query($user_sql);
?>

<?php include __DIR__ . "/parts/html-head.php"; ?>
<?php include __DIR__ . "/parts/navbar.php"; ?>
<div class="container">
  <h1>新增活動</h1>
  <form method="post" action="create_act_api.php">
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
            <?php echo $user['user_name'] . " (" . $user['email'] . ")"; ?>
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
      <a class="button" href="index_act.php">返回活動列表</a>
    </div>
  </form>
</div>
<?php include __DIR__ . "/parts/scripts.php"; ?>
<?php include __DIR__ . "/parts/html-foot.php"; ?>

<?php $conn->close(); ?>