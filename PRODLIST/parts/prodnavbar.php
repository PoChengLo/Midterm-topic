<?php
if (!isset($pageName)) {
  $pageName = "";
}
?>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="./prodindex.php"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link <?= $pageName == 'prod_list' ? 'active' : '' ?>" aria-current="page" href="../PRODLIST/prodindex.php">商品列表</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <?= $pageName == 'prod_add' ? 'active' : '' ?>" aria-current="page" href="../PRODLIST/prodadd.php">新增商品</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-dark text-white" type="submit">Search</button>
      </form>
      <button class="btn btn-outline-dark text-white" type="submit">Clear</button>

      <ul class="navbar-nav">
        <?php if (isset($_SESSION['admin'])) : ?>
          <li class="nav-item">
            <a class="nav-link"><?= $_SESSION['admin']['nick_name'] ?></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="prodlogout.php">登出</a>
          </li>
        <?php else : ?>
          <li class="nav-item">
            <a class="nav-link <?= $pageName == 'login' ? 'actice' : '' ?>" href="prodlogin.php">登入</a>
          </li>
        <?php endif; ?>
      </ul>
    </div>
  </div>
</nav>



<a class="col-1 btn btn-primary fixed-bottom bg-dark ml-5" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
  其他列表
</a>


<div class="offcanvas offcanvas-start " tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header ">
    <ul>
    <li class="li1"><a class="dropdown-item" href="../user_project/user_CRUD/index_user.php"><i class="fa-solid fa-skull"></i>&ensp;會員列表</a></li>
      <br> <br>
      <li class="li1"><a class="dropdown-item" href="../PRODLIST/list_admin.php"><i class="fa-solid fa-chess-queen"></i> &ensp;桌遊產品列表</a></li>
      <br> <br>
      <li class="li1"><a class="dropdown-item" href="index_larp.php"><i class="fa-solid fa-person-running"></i> &ensp;密室逃脫列表</a></li>
      <br> <br>
      <li class="li1"><a class="dropdown-item" href="../ACTLIST/index_act.php"><i class="fa-regular fa-calendar-days"></i> &ensp; 活動列表</a></li>
    </ul>
  </div>
</div>
<!-- <div class="container">

</div> -->