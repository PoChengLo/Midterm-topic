  <?php
  require __DIR__ . '/db-connect.php';
  // require __DIR__ .'/larp_login.php';

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
  <div class="container position-relative offset-3 z-0">
    <div class="row">
      <div class="col">
        <nav aria-label="Page navigation example">
          <ul class="pagination mt-5 pt-5">
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
    <!-- <a href="add.php" class="btn btn-primary position-absolute top-0 end-0">新增</a> -->
  </div>

  <!-- 表格主體 -->
  <div class="container offset-3 mb-5">
    <div class="row">
      <div class="col">
        <table class="table table-border table-striped">
          <thead>
            <tr>
              <th scope="col">
                <svg width="28px" height="28px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="#000000" stroke-width="1.1">
                  <path d="M20 9L18.005 20.3463C17.8369 21.3026 17.0062 22 16.0353 22H7.96474C6.99379 22 6.1631 21.3026 5.99496 20.3463L4 9" fill="#000000"></path>
                  <path d="M20 9L18.005 20.3463C17.8369 21.3026 17.0062 22 16.0353 22H7.96474C6.99379 22 6.1631 21.3026 5.99496 20.3463L4 9H20Z" stroke="#000000" stroke-width="1.1" stroke-linecap="round" stroke-linejoin="round"></path>
                  <path d="M21 6H15.375M3 6H8.625M8.625 6V4C8.625 2.89543 9.52043 2 10.625 2H13.375C14.4796 2 15.375 2.89543 15.375 4V6M8.625 6H15.375" stroke="#000000" stroke-width="1.1" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
              </th>
              <th scope="col">
                <svg width="28px" height="28px" viewBox="0 0 24 24" stroke-width="1.1" fill="none" xmlns="http://www.w3.org/2000/svg" color="#000000">
                  <path d="M14.3632 5.65156L15.8431 4.17157C16.6242 3.39052 17.8905 3.39052 18.6716 4.17157L20.0858 5.58579C20.8668 6.36683 20.8668 7.63316 20.0858 8.41421L18.6058 9.8942M14.3632 5.65156L4.74749 15.2672C4.41542 15.5993 4.21079 16.0376 4.16947 16.5054L3.92738 19.2459C3.87261 19.8659 4.39148 20.3848 5.0115 20.33L7.75191 20.0879C8.21972 20.0466 8.65806 19.8419 8.99013 19.5099L18.6058 9.8942M14.3632 5.65156L18.6058 9.8942" stroke="#000000" stroke-width="1.1" stroke-linecap="round" stroke-linejoin="round"></path>
                </svg>
              </th>
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
                <td>
                  <a href="javascript: deleteOne(<?= $r['larp_id'] ?>)">
                    <svg width="28px" height="28px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" color="#6672c7" stroke-width="1.1">
                      <path d="M20 9L18.005 20.3463C17.8369 21.3026 17.0062 22 16.0353 22H7.96474C6.99379 22 6.1631 21.3026 5.99496 20.3463L4 9" fill="#6672c7"></path>
                      <path d="M20 9L18.005 20.3463C17.8369 21.3026 17.0062 22 16.0353 22H7.96474C6.99379 22 6.1631 21.3026 5.99496 20.3463L4 9H20Z" stroke="#6672c7" stroke-width="1.1" stroke-linecap="round" stroke-linejoin="round"></path>
                      <path d="M21 6H15.375M3 6H8.625M8.625 6V4C8.625 2.89543 9.52043 2 10.625 2H13.375C14.4796 2 15.375 2.89543 15.375 4V6M8.625 6H15.375" stroke="#6672c7" stroke-width="1.1" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
                </td>
                <td>
                  <a href="larp-edit.php?larp_id=<?= $r['larp_id'] ?>">
                    <svg width="28px" height="28px" viewBox="0 0 24 24" stroke-width="1.1" fill="none" xmlns="http://www.w3.org/2000/svg" color="#6672c7">
                      <path d="M14.3632 5.65156L15.8431 4.17157C16.6242 3.39052 17.8905 3.39052 18.6716 4.17157L20.0858 5.58579C20.8668 6.36683 20.8668 7.63316 20.0858 8.41421L18.6058 9.8942M14.3632 5.65156L4.74749 15.2672C4.41542 15.5993 4.21079 16.0376 4.16947 16.5054L3.92738 19.2459C3.87261 19.8659 4.39148 20.3848 5.0115 20.33L7.75191 20.0879C8.21972 20.0466 8.65806 19.8419 8.99013 19.5099L18.6058 9.8942M14.3632 5.65156L18.6058 9.8942" stroke="#6672c7" stroke-width="1.1" stroke-linecap="round" stroke-linejoin="round"></path>
                    </svg>
                  </a>
                </td>
                <td><?= $r['larp_id'] ?></td>
                <td><?= $r['larp_img'] ?></td>
                <td><?= htmlentities($r['larp_name']) ?></td>
                <td><?= htmlentities($r['larp_info']) ?></td>
                <td class="col-3"><?= htmlentities($r['larp_desc']) ?></td>
                <td><?= $r['larp_people'] ?></td>
                <td><?= $r['larp_tag_id'] ?></td>
                <td><?= $r['larp_date'] ?></td>
                <td><?= htmlentities($r['larp_loc']) ?></td>
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
    const data = <?= json_encode($rows) ?>;
    const deleteOne = (larp_id) => {
      if (confirm(`是否要刪除編號為 ${larp_id} 的資料??`)) {
        location.href = `larp-delete.php?larp_id=${larp_id}`;
      }
    };
  </script>

  <?php include __DIR__ . '/parts/html-foot.php';
