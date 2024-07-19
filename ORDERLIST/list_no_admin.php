<?php
$title = "商品列表";
$pageName = 'ord_list';

//每頁有5筆資料
$perPage = 5;

$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
//跳轉頁面
if ($page < 1) {
  header('Location: ./index_.php');
  exit; //結束程式碼 
}

require __DIR__ . '/db-connect-setting.php';
$totalSql = "SELECT COUNT(*) FROM ORDERLIST";
$totalRows = $pdo->query($totalSql)->fetch(PDO::FETCH_NUM)[0];

//跳轉到最後一頁
$totalPages = 0;
$rows = [];
if ($totalRows) {
  //如果頁數大於總頁數，結束程式碼
  $totalPages = ceil($totalRows / $perPage);
  if ($page > $totalPages) {
    header('Location: ?page=' . $totalPages);
    exit;
  }
  //取得該頁資料
  $sql = sprintf(
    "SELECT * FROM ORDERLIST LIMIT %d OFFSET %d",
    $perPage,
    ($page - 1) * $perPage
  );
  $rows = $pdo->query($sql)->fetchAll();
}
?>

<?php include __DIR__ . '/parts/head.php' ?>
<?php include __DIR__ . '/parts/navbar.php' ?>
<div class="container">
  <div class="row">
    <div class="col">
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <?php
          for ($i = $page - 5; $i <= $page + 5; $i++) :
            if ($i >= 1 && $i <= $totalPages) :
          ?>
              <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                <a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a>
              </li>
          <?php
            endif;
          endfor;
          ?>
        </ul>
      </nav>
    </div>
  </div>
  <div class="row">
    <div class="col">
      <table class="table table-dark table-striped">
        <thead>
          <tr>
          <th scope="col">訂單編號</th>
            <!-- <th scope="col">訂單日期</th> -->
            <!-- <th scope="col">會員編號</th>
            <th scope="col">訂單總額</th>
            <th scope="col">付款狀態</th>
            <th scope="col">出貨日期</th> -->
          </tr>
        </thead>
        <tbody>
          <?php foreach ($rows as $r) : ?>
            <tr>
            <td><?= $r['ord_id'] ?></td>
              <td><?= htmlentities($r['ord_date']) ?></td>
              <td><?= $r['user_id'] ?></td>
              <td><?= $r['ord_total'] ?></td>
              <td><?= $r['ord_pay'] ?></td>
              <td><?= htmlentities($r['ship_date']) ?></td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  </div>
</div>
<?php include __DIR__ . '/parts/script.php' ?>
<script>
  const data = <?= json_encode($rows) ?>;
  const deleteOne = function(ord_id) {
    if (confirm(`是否刪除編號為${ord_id}的資料`)) {
      location.href = `del.php?_id=${ord_id}`;
    }
  };
</script>
<?php include __DIR__ . '/parts/foot.php' ?>