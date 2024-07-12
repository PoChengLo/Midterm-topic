<?php
//每頁有5筆資料
$perPage = 5;

$page = isset($_GET['page']) ? intval($_GET['page']) : 1;

require __DIR__ . '/db-connect-setting.php';
$totalSql = "SELECT COUNT(*) FROM PRODLIST";
$totalRows = $pdo->query($totalSql)->fetch(PDO::FETCH_NUM)[0];

//計算總頁數
$totalPages = ceil($totalRows / $perPage);
//取得該頁資料
$sql = sprintf(
  "SELECT * FROM PRODLIST LIMIT %d OFFSET %d",
  $perPage,
  ($page - 1) * $perPage
);

$rows = $pdo->query($sql)->fetchAll();

?>

<?php include __DIR__ . '/parts/prodhead.php' ?>
<?php include __DIR__ . '/parts/prodnavbar.php' ?>
<div class="container">
  <div class="row">
    <div class="col">
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <?php
          for ($i = 1; $i <= $totalPages; $i++) :
          ?>
            <li class="page-item <?= $i == $page ? 'active' : '' ?>">
              <a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a>
            </li>
          <?php
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
            <th scope="col">商品編號</th>
            <th scope="col">商品名稱</th>
            <th scope="col">商品類別編號</th>
            <th scope="col">商品價格</th>
            <th scope="col">商品庫存</th>
            <th scope="col">商品圖片</th>
            <th scope="col">商品描述</th>
            <th scope="col">商品折扣</th>
            <th scope="col">商品上架日期時間</th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($rows as $r) : ?>
            <tr>
              <td><?= $r['prod_id'] ?></td>
              <td><?= $r['prod_name'] ?></td>
              <td><?= $r['prod_tag_id'] ?></td>
              <td><?= $r['prod_price'] ?></td>
              <td><?= $r['prod_stock'] ?></td>
              <td><?= $r['prod_img'] ?></td>
              <td><?= $r['prod_desc'] ?></td>
              <td><?= $r['prod_disc'] ?></td>
              <td><?= $r['prod_update'] ?></td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  </div>
</div>
<?php include __DIR__ . '/parts/prodscript.php' ?>
<script>
  const data = <?= json_encode($rows); ?>
</script>
<?php include __DIR__ . '/parts/prodfoot.php' ?>