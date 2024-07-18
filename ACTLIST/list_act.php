<?php
include 'database.php';

$search_name = "";
$search_date_start = "";
$search_date_end = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $search_name = $_POST['search_name'];
  $search_date_start = $_POST['search_date_start'];
  $search_date_end = $_POST['search_date_end'];
  $page = 1; // 新搜尋重設頁碼為1
} else {
  if (isset($_GET['search_name'])) {
    $search_name = $_GET['search_name'];
  }
  if (isset($_GET['search_date_start'])) {
    $search_date_start = $_GET['search_date_start'];
  }
  if (isset($_GET['search_date_end'])) {
    $search_date_end = $_GET['search_date_end'];
  }

  // 獲取當前頁碼，默認為1
  $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
}

$records_per_page = 8;
$offset = ($page - 1) * $records_per_page;

// 更新 SQL 查詢語句
$sql = "SELECT actlist.*, userinfo.user_name, userinfo.email 
        FROM actlist 
        JOIN userinfo ON actlist.user_id = userinfo.user_id 
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
              JOIN userinfo ON actlist.user_id = userinfo.user_id 
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

<?php include __DIR__ . "/parts/html-head.php"; ?>
<?php include __DIR__ . "/parts/navbar.php"; ?>
<div class="container">
  <h1>活動列表</h1>
  <form id="search_form" method="post" action="">
    <input class="but002" id="search_name" type="text" name="search_name" placeholder="搜尋活動名稱" value="<?php echo htmlspecialchars($search_name); ?>">
    <input class="but001" id="search_date_start" type="date" name="search_date_start" value="<?php echo htmlspecialchars($search_date_start); ?>">~
    <input class="but001" id="search_date_end" type="date" name="search_date_end" value="<?php echo htmlspecialchars($search_date_end); ?>">
    <input class="button" type="submit" value="搜尋">
    <input class="button" type="button" value="清除" onclick="clearSearch()">
    <a class="button" href="create_act.php">新增活動</a>
  </form>
  <table>
    <tr>
      <th>活動編號</th>
      <th>活動名稱</th>
      <th>活動時間</th>
      <th>活動發起人</th>
      <th>發起人信箱</th>
      <th>活動內容</th>
      <th>修改</th>
      <th>刪除</th>
    </tr>
    <?php while ($row = $result->fetch_assoc()) { ?>
      <tr>
        <td><?php echo $row['act_id']; ?></td>
        <td><?php echo $row['act_name']; ?></td>
        <td><?php echo $row['act_date']; ?></td>
        <td><?php echo $row['user_name']; ?></td>
        <td><?php echo $row['email']; ?></td>
        <td><?php echo mb_substr($row['act_desc'], 0, 20) . (mb_strlen($row['act_desc']) > 25 ? '...' : ''); ?></td>
        <td>
          <a class="button" href="edit_act.php?id=<?php echo $row['act_id']; ?>"><i class="fa-solid fa-pen-to-square"></i></a>
        </td>
        <td>
          <a class="button" href="javascript:void(0);" onclick="confirmDelete(<?php echo $row['act_id']; ?>)"><i class="bi bi-trash-fill"></i></a>
        </td>
      </tr>
    <?php } ?>
  </table>
  <div class="pagination">
    <?php if ($page > 1) { ?>
      <a class="but003" href="index_act.php?page=<?php echo $page - 1; ?>&search_name=<?php echo urlencode($search_name); ?>&search_date_start=<?php echo urlencode($search_date_start); ?>&search_date_end=<?php echo urlencode($search_date_end); ?>">上一頁</a>
    <?php } ?>

    <?php for ($i = 1; $i <= $total_pages; $i++) { ?>
      <a class="but003" href="index_act.php?page=<?php echo $i; ?>&search_name=<?php echo urlencode($search_name); ?>&search_date_start=<?php echo urlencode($search_date_start); ?>&search_date_end=<?php echo urlencode($search_date_end); ?>"><?php echo $i; ?></a>
    <?php } ?>

    <?php if ($page < $total_pages) { ?>
      <a class="but003" href="index_act.php?page=<?php echo $page + 1; ?>&search_name=<?php echo urlencode($search_name); ?>&search_date_start=<?php echo urlencode($search_date_start); ?>&search_date_end=<?php echo urlencode($search_date_end); ?>">下一頁</a>
    <?php } ?>
  </div>
  <br>
</div>

<?php $conn->close(); ?>
<?php include __DIR__ . "/parts/scripts.php"; ?>
<?php include __DIR__ . "/parts/html-foot.php"; ?>