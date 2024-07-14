<?php
include 'database.php';

$search_name = "";
$search_date_start = "";
$search_date_end = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $search_name = $_POST['search_name'];
  $search_date_start = $_POST['search_date_start'];
  $search_date_end = $_POST['search_date_end'];
}

// 獲取當前頁碼，默認為1
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$records_per_page = 8;
$offset = ($page - 1) * $records_per_page;

// 更新 SQL 查詢語句
$sql = "SELECT actlist.*, users.user_name, users.user_email 
        FROM actlist 
        JOIN users ON actlist.user_id = users.user_id 
        WHERE 1=1";

if (!empty($search_name)) {
  $sql .= " AND act_name LIKE '%$search_name%'";
}

if (!empty($search_date_start) && !empty($search_date_end)) {
  $sql .= " AND DATE(act_date) BETWEEN '$search_date_start' AND '$search_date_end'";
}

$sql .= " ORDER BY act_date DESC"; // 按照活動時間降冪排序
$sql .= " LIMIT $offset, $records_per_page";
$result = $conn->query($sql);

// 獲取總記錄數以計算總頁數
$count_sql = "SELECT COUNT(*) AS total 
              FROM actlist 
              JOIN users ON actlist.user_id = users.user_id 
              WHERE 1=1";

if (!empty($search_name)) {
  $count_sql .= " AND act_name LIKE '%$search_name%'";
}

if (!empty($search_date_start) && !empty($search_date_end)) {
  $count_sql .= " AND DATE(act_date) BETWEEN '$search_date_start' AND '$search_date_end'";
}

$count_result = $conn->query($count_sql);
$count_row = $count_result->fetch_assoc();
$total_pages = ceil($count_row['total'] / $records_per_page);
?>

<!DOCTYPE html>
<html>

<head>
  <title>活動管理系統</title>
  <link rel="stylesheet" type="text/css" href="style.css">
  <script>
    function confirmDelete(act_id) {
      if (confirm("確定要刪除這個活動嗎？")) {
        window.location.href = "delete.php?id=" + act_id;
      }
    }
  </script>
</head>

<body>
  <div class="container">
    <h1>活動列表</h1>
    <form method="post" action="">
      <input class="but002" type="text" name="search_name" placeholder="搜尋活動名稱" value="<?php echo htmlspecialchars($search_name); ?>">
      <input class="but001" type="date" name="search_date_start" value="<?php echo htmlspecialchars($search_date_start); ?>">~
      <input class="but001" type="date" name="search_date_end" value="<?php echo htmlspecialchars($search_date_end); ?>">
      <input class="button" type="submit" value="搜尋">
      <a class="button" href="create.php">新增活動</a>
    </form>
    <table>
      <tr>
        <th>活動編號</th>
        <th>活動名稱</th>
        <th>活動時間</th>
        <th>發起人姓名</th>
        <th>發起人信箱</th>
        <th>活動內容</th>
        <th>操作</th>
      </tr>
      <?php while ($row = $result->fetch_assoc()) { ?>
        <tr>
          <td><?php echo $row['act_id']; ?></td>
          <td><?php echo $row['act_name']; ?></td>
          <td><?php echo $row['act_date']; ?></td>
          <td><?php echo $row['user_name']; ?></td>
          <td><?php echo $row['user_email']; ?></td>
          <td><?php echo $row['act_desc']; ?></td>
          <td>
            <a class="button" href="edit.php?id=<?php echo $row['act_id']; ?>">修改</a>
            <a class="button" href="javascript:void(0);" onclick="confirmDelete(<?php echo $row['act_id']; ?>)">刪除</a>
          </td>
        </tr>
      <?php } ?>
    </table>
    <div class="pagination">
      <?php if ($page > 1) { ?>
        <a class="but003" href="index.php?page=<?php echo $page - 1; ?>">上一頁</a>
      <?php } ?>

      <?php for ($i = 1; $i <= $total_pages; $i++) { ?>
        <a class="but003" href="index.php?page=<?php echo $i; ?>"><?php echo $i; ?></a>
      <?php } ?>

      <?php if ($page < $total_pages) { ?>
        <a class="but003" href="index.php?page=<?php echo $page + 1; ?>">下一頁</a>
      <?php } ?>
    </div>
    <br>
  </div>
</body>

</html>
<?php $conn->close(); ?>