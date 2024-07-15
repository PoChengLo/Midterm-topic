<?php
$title = "商品列表";
$pageName = 'prod_list';

//每頁有5筆資料
$perPage = 5;

$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
//跳轉頁面
if ($page < 1) {
  header('Location: ./prodindex.php');
  exit; //結束程式碼 
}

require __DIR__ . '/db-connect-setting.php';
$totalSql = "SELECT COUNT(*) FROM PRODLIST";
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
    "SELECT * FROM PRODLIST LIMIT %d OFFSET %d",
    $perPage,
    ($page - 1) * $perPage
  );
  $rows = $pdo->query($sql)->fetchAll();
}
?>

<?php include __DIR__ . '/parts/prodhead.php' ?>
<?php include __DIR__ . '/parts/prodnavbar.php' ?>
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
            <th><i class="fa-regular fa-trash-can"></i></th>
            <th scope="col">商品編號</th>
            <th scope="col">商品名稱</th>
            <th scope="col">商品圖片</th>
            <th scope="col">商品類別編號</th>
            <th scope="col">商品介紹</th>
            <th scope="col">商品價格</th>
            <th scope="col">商品折扣</th>
            <th scope="col">商品庫存</th>
            <th scope="col">商品上架日期時間</th>
            <th><i class="fa-regular fa-pen-to-square"></i></th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($rows as $r) : ?>
            <tr>
              <!-- 刪除前詢問 -->
              <td>
                <!-- <a href="proddel.php?prod_id=<?= $r['prod_id'] ?>" onclick="return confirm(`是否要刪除編號為<?= $r['prod_id'] ?>的資料`)">
                  </a> -->
                <a href="javascript: deleteOne(<?= $r['prod_id'] ?>)">
                  <i class="fa-regular fa-trash-can"></i></a>
              </td>
              <td><?= $r['prod_id'] ?></td>
              <td><?= htmlentities($r['prod_name']) ?></td>
              <td><img src="./imgs/<?= $r['prod_img'] ?>" alt=""></td>
              <td><?= $r['prod_tag_id'] ?></td>
              <td><?= htmlentities($r['prod_desc']) ?></td>
              <td><?= $r['prod_price'] ?></td>
              <td><?= $r['prod_disc'] ?></td>
              <td><?= $r['prod_stock'] ?></td>
              <td><?= $r['prod_update'] ?></td>
              <td><a href="prodedit.php?prod_id=<?= $r['prod_id'] ?>"><i class="fa-regular fa-pen-to-square"></i></a></td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  </div>
</div>
<?php include __DIR__ . '/parts/prodscript.php' ?>
<script>
  const data = <?= json_encode($rows) ?>;
  const deleteOne = function(prod_id) {
    if (confirm(`是否刪除編號為${prod_id}的資料`)) {
      location.href = `proddel.php?prod_id=${prod_id}`;
    }
  };
</script>
<?php include __DIR__ . '/parts/prodfoot.php' ?>