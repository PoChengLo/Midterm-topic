
 <?php
require __DIR__ . '/parts/admin-required.php';
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
    // "SELECT p.prod_id , p.prod_name , p.prod_img , t.tag_name , p.prod_desc , p.prod_price , p.prod_disc , p.prod_stock , p.prod_stock , p.prod_update , t.tag_name FROM PRODLIST p JOIN PRODTAG pt ON p.prod_id = pt.prod_id JOIN TAGLIST t ON pt.tag_id = t.tag_id LIMIT %d OFFSET %d",
    "SELECT * FROM PRODLIST LIMIT %d OFFSET %d",
    $perPage,
    ($page - 1) * $perPage
  );
  $rows = $pdo->query($sql)->fetchAll();
}


?> 


<?php include __DIR__ . '/parts/prodhead.php' ?>
<?php include __DIR__ . '/parts/prodnavbar.php' ?>
<!-- <div class="container-fluid my-3 "> -->
<div class="container my-3 ">
  <div class="row d-flex align-items-center">
    <!-- <div class="col-2 ">
      <div class="list-group ">
        <a href="../user_project/user_CRUD/index_user.php" class="list-group-item list-group-item-action">A second link item</a>
        <a href="../PRODLIST/list_admin.php" class="list-group-item list-group-item-action active list-group-item-dark" aria-current="true">
          商品列表
        </a>
        <a href="../LARPLIST/index_larp.php" class="list-group-item list-group-item-action">A third link item</a>
        <a href="../ACTLIST/index_act.php" class="list-group-item list-group-item-action">A third link item</a>
      </div>
    </div> -->
    <div class="col">
      <div class="row">
        <div class="col">
          <nav aria-label="Page navigation example">
            <ul class="pagination">
              <?php
              for ($i = $page - 5; $i <= $page + 5; $i++) :
                if ($i >= 1 && $i <= $totalPages) :
              ?>
                  <li class="page-item <?= $i == $page ? 'pagination-lg' : '' ?> ">
                    <a class="page-link" href="?page=<?= $i ?> "><?= $i ?></a>
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
          <table class="table  table-striped height:100px">
            <thead>
              <tr>
                <th class="align-middle"><i class="fa-regular fa-trash-can fs-4"></i></th>
                <th class="align-middle " scope="col" style="width:50px">商品編號</th>
                <th class="align-middle" scope="col">商品名稱</th>
                <th class="align-middle " scope="col">商品圖片</th>
                <th class="align-middle" scope="col" style="width:80px">商品類別編號</th>
                <th class="align-middle" scope="col">商品介紹</th>
                <th class="align-middle" scope="col">商品價格</th>
                <th class="align-middle" scope="col">商品折扣</th>
                <th class="align-middle" scope="col" style="width:50px">商品庫存</th>
                <th class="align-middle" scope="col">商品上架日期時間</th>
                <th class="align-middle"><i class="fa-regular fa-pen-to-square fs-4"></i></th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($rows as $r) : ?>
                <tr>
                  <!-- 刪除前詢問 -->
                  <td class="align-middle ">
                    <!-- <a href="proddel.php?prod_id=<?= $r['prod_id'] ?>" onclick="return confirm(`是否要刪除編號為<?= $r['prod_id'] ?>的資料`)">
                      </a> -->
                    <a href="javascript: deleteOne(<?= $r['prod_id'] ?>)">
                      <i class="fa-regular fa-trash-can fs-4"></i></a>
                  </td>
                  <td class="align-middle "><?= $r['prod_id'] ?></td>
                  <td class="align-middle "><?= htmlentities($r['prod_name']) ?></td>
                  <td class="align-middle "><img src="./imgs/<?= $r['prod_img'] ?>" alt=""></td>
                  <td class="align-middle "><?= $r['prod_tag_id'] ?></td>
                  <td class="align-middle "><?= htmlentities($r['prod_desc']) ?></td>
                  <td class="align-middle "><?= $r['prod_price'] ?></td>
                  <td class="align-middle "><?= $r['prod_disc'] ?></td>
                  <td class="align-middle "><?= $r['prod_stock'] ?></td>
                  <td class="align-middle "><?= $r['prod_update'] ?></td>
                  <td class="align-middle "><a href="prodedit.php?prod_id=<?= $r['prod_id'] ?>"><i class="fa-regular fa-pen-to-square fs-4"></i></a></td>
                </tr>
              <?php endforeach; ?>
            </tbody>
          </table>
        </div>
      </div>
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