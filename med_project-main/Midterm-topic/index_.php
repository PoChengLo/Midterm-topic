  <?php
  require __DIR__ . '/db-connect.php';

  $title = '密室逃脫/劇本殺';
  $pageName = 'LARPLIST';
  $perPage = 10;
  $page = isset($_GET['page']) ? intval($_GET['page']) : 1;

  if ($page <= 0) {
    header('Location: ./');
    exit;
  }


  $larp_sql = "SELECT COUNT(1) FROM larplist";
  $totalRows = $pdo->query($larp_sql)->fetch(PDO::FETCH_NUM)[0];

  $totalPages = 0;
  #先判斷totalRows有沒有抓到資料，有的話再往下執行
  if ($totalRows) {
    # 計算總頁數
    $totalPages = ceil($totalRows / $perPage);
    if ($page > $totalPages) {
      header('Location: ?page=' . $totalPages);
      exit;
    };

    #取得該頁的資料
    $sql = sprintf(
      "SELECT * 
    FROM LARPLIST ORDER BY larp_id DESC LIMIT %s,%s",
      ($page - 1) * $perPage,
      $perPage
    );

    $rows = $pdo->query($sql)->fetchAll();
  };

  ?>
  <?php include __DIR__ . "/parts/html-head.php"; ?>
  <?php include __DIR__ . "/parts/navbar.php"; ?>

  <!-- 頁籤 -->
  <div class="container">
    <div class="row">
      <div class="clo">
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <!-- 上一頁 -->
            <!-- 判斷頁碼有沒有低於1頁，若低於1頁就讓上一頁的按鈕失效 -->
            <li class="page-item <?= ($page < 2) ? "disabled" : "" ?>">
              <a class="page-link" href="
              ?page=<?= ($page <= 1) ? 1 : ($page - 1) ?>">
                <i class="fa-solid fa-angles-left"></i>
              </a>
            </li>
            <!-- 頁碼 -->
            <?php for ($i = $page - 5; $i <= $page + 5; $i++) : if ($i >= 1 && $i <= $totalPages) : ?>
                <li class="page-item <?= $i === $page ? "active" : "" ?>">
                  <a class="page-link" href="?page=<?= $i ?>"><?= $i ?></a>
                </li>
            <?php endif;
            endfor; ?>
            <!-- 下一頁 -->
            <li class="page-item <?= ($page < $totalPages) ? "" : "disabled" ?>">
              <a class="page-link" href="?page=<?= ($page < $totalPages) ? ($page + 1) : $totalPages ?>">
                <i class="fa-solid fa-angles-right"></i>
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>

  <!-- 表格主體 -->
  <div class="container">
    <div class="row">
      <div class="col">
        <table class="table table-border table-striped">
          <thead>
            <tr>
              <th scope="col">編號</th>
              <th scope="col" class="col-1">圖片</th>
              <th scope="col" class="col-1">名稱</th>
              <th scope="col" class="col-1">簡介</th>
              <th scope="col" class="col-2">故事描述</th>
              <th scope="col" class="col-1">人數限制</th>
              <th scope="col" class="col">類別</th>
              <th scope="col" class="col-1">時間</th>
              <th scope="col" class="col-1">地點</th>
              <th scope="col" class="col">價格</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($rows as $r) : ?>
              <tr>
                <td>&ensp;<?= $r['larp_id'] ?></td>
                <td><?= $r['larp_img'] ?></td>
                <td><?= $r['larp_name'] ?></td>
                <td><?= $r['larp_info'] ?></td>
                <td class="col-3"><?= $r['larp_desc'] ?></td>
                <td><?= $r['larp_people'] ?></td>
                <td><?= $r['larp_tag_id'] ?></td>
                <td><?= $r['larp_date'] ?></td>
                <td><?= $r['larp_loc'] ?></td>
                <td><?= $r['larp_price'] ?></td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <?php include __DIR__ . '/parts/scripts.php'; ?>
  <script>
    const data = <?= json_encode($rows) ?>
  </script>

  <?php include __DIR__ . '/parts/html-foot.php';
