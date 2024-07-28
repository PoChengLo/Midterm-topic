<?php
require __DIR__ . '/parts/admin-required.php';
$title = "通訊錄列表";
$pageName = "ab_list";

$perPage = 30; # 表示一頁最多有 30 筆
$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
if ($page < 1) {
  header('Location: ./'); # 跳轉頁面
  exit; # 結束程式, die()
}

require __DIR__ . '/db-connect.php';
$t_sql = "SELECT COUNT(1) FROM userinfo ";
# 取得總筆數
$totalRows = $pdo->query($t_sql)->fetch(PDO::FETCH_NUM)[0];
$totalPages = 0;
$rows = [];
if ($totalRows) {
  # 計算總頁數
  $totalPages = ceil($totalRows / $perPage);
  if ($page > $totalPages) {
    header('Location: ?page=' . $totalPages); # 跳轉頁面到最後一頁
    exit; # 結束程式
  }

  # 取得該頁的資料

  // 排序功能
  $sort = isset($_GET['sort']) ? $_GET['sort'] : 'user_id';
  $allowed_sort = ['user_id', 'user_name', 'email', 'birthday', 'mobile'];
  if (!in_array($sort, $allowed_sort)) {
    $sort = 'user_id';
  };
  // 排序功能tbc

  // 搜尋功能
  $search = isset($_GET['search']) ? $_GET['search'] : '';
  $search = htmlspecialchars($search);
  $search_sql = $search ? "WHERE user_name LIKE '%$search%' OR email LIKE '%$search%' OR mobile LIKE '%$search%' OR address LIKE '%$search%'" : '';


  // 搜尋功能tbc


  $sql = "SELECT * FROM userinfo $search_sql ORDER BY $sort LIMIT " . (($page - 1) * $perPage) . "," . ($perPage);
  $rows = $pdo->query($sql)->fetchAll();
};

?>


<?php include __DIR__ . "/parts/html-head.php"; ?>
<?php include __DIR__ . "/parts/navbar.php"; ?>



<div class="container">
  <div class="row">
    <div class="col">


      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <?php for ($i = $page - 5; $i <= $page + 5; $i++) :
            if ($i >= 1 && $i <= $totalPages) :
          ?>
              <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                <a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a>
              </li>
          <?php
            endif;
          endfor; ?>
        </ul>
      </nav>



      <div class="dropdown mt-3 mb-3">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
          排序方式
        </button>

        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">

          <li><a class="dropdown-item" href="?sort=user_id">編號排序</a></li>
          <li><a class="dropdown-item" href="?sort=user_name">姓名排序</a></li>
          <li><a class="dropdown-item" href="?sort=email">Email排序</a></li>
          <li><a class="dropdown-item" href="?sort=mobile">手機排序</a></li>
          <li><a class="dropdown-item" href="?sort=birthday">生日排序</a></li>

        </ul>

      </div>
    </div>
  </div>
  <form class="d-flex" method="GET" action="">
    <div class="container mt-5">
      <div class="input-group mb-3 ">
        <span class="input-group-text" id="addon-wrapping"><i class="fa-solid fa-magnifying-glass"></i></span>
        <input type="search" class="form-control" placeholder="請輸入關鍵字" aria-describedby="button-addon2" name="search" value="<?= isset($_GET['search']) ? htmlspecialchars($_GET['search']) : '' ?>">
        <button class="btn btn-outline-secondary" id="button-addon2" type="submit">搜尋</button>
      </div>

    </div>
  </form>

  <div class="row">
    <div class="col">
      <table class="table table-bordered table-striped">
        <thead class="table-dark">
          <tr>
            <th><i class="fa-solid fa-circle-xmark"></i></th>
            <th>編號</th>
            <th>姓名</th>
            <th>電郵</th>
            <th>手機</th>
            <th>生日</th>
            <th>地址</th>
            <th><i class="fa-solid fa-pen-nib"></i></th>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($rows as $r) : ?>
            <tr>
              <td>
                <!--
                <a href="del.php?user_id=<?= $r['user_id'] ?>" onclick="return confirm(`是否要刪除編號為 <?= $r['user_id'] ?> 的資料?`)">
          -->
                <a href="javascript: deleteOne(<?= $r['user_id'] ?>)">
                  <i class="fa-solid fa-trash"></i>
                </a>
              </td>
              <td><?= $r['user_id'] ?></td>
              <td><?= $r['user_name'] ?></td>
              <td><?= $r['email'] ?></td>
              <td><?= $r['mobile'] ?></td>
              <td><?= $r['birthday'] ?></td>
              <td><?= htmlentities($r['address']) ?></td>
              <td>
                <a href="edit.php?user_id=<?= $r['user_id'] ?>">
                  <i class="fa-solid fa-pen-to-square"></i>
                </a>
              </td>
            </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  </div>
</div>



<?php include __DIR__ . "/parts/scripts.php"; ?>
<script>
  const data = <?= json_encode($rows)  ?>;
  const deleteOne = (user_id) => {
    if (confirm(`是否要刪除編號為 ${user_id} 的資料??`)) {
      location.href = `del.php?user_id=${user_id}`;
    }
  };
</script>

<?php include __DIR__ . "/parts/html-foot.php"; ?>