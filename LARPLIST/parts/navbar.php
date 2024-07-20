<?php
if (!isset($pageName)) {
  $pageName = "";
}

?>
<style>
  nav.navbar ul.navbar-nav a.nav-link.active {
    font-weight: 900;
    border-radius: 6px;
  }

  nav.navbar ul.navbar-nav a.nav-link.active {

    font-weight: 900;
    border-radius: 6px;
  }

  .li1 {
    list-style-type: none;
  }
</style>

<!-- <div class="bg-dark col-2 vh-100 position-fixed top-0 mb-5 z-1">
  <div class="text-white mt-5 pt-5">
    <nav class="nav flex-column ms-3">
      <a class="nav-link text-white" aria-current="page" href="../user_project/user_CRUD/index_.php">會員列表</a>
      <a class="nav-link text-white" aria-current="page" href="../PRODLIST/index_.php">桌遊商品列表</a>
      <a class="nav-link text-white" href="index_larp.php">密室逃脫/劇本殺列表</a>
      <a class="nav-link text-white" href="../ACRLIST/index_act.php">活動列表</a>
      <a class="nav-link text-white" href="#">購物車列表</a>
    </nav>
  </div>
</div> -->

<div class="container-fill mb-5 vw-100 position-fixed z-1 top-0">
  <nav class="navbar navbar-expand-lg  navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="index_.php">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link" href="index_larp.php">密室逃脫/劇本殺列表</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="add.php">新增</a>
          </li>
        </ul>

        <ul class="navbar-nav mb-2 mb-lg-0">

          <li class="nav-item">
            <a class="nav-link pe-5" href="login.php">登出</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</div>
</div>


<a class="col-1 btn btn-primary fixed-bottom bg-dark ml-5" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
  其他列表
</a>

<div class="offcanvas offcanvas-start " tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header ">
    <ul class="mt-5 ms-3">
    <li class="li1"><a class="dropdown-item" href="../user_project/user_CRUD/index_user.php"><i class="fa-solid fa-skull"></i>&ensp;會員列表</a></li>
      <br> <br>
      <li class="li1"><a class="dropdown-item" href="../PRODLIST/list_admin.php"><i class="fa-solid fa-chess-queen"></i> &ensp;桌遊產品列表</a></li>
      <br> <br>
      <li class="li1"><a class="dropdown-item" href="../LARPLIST/index_larp.php"><i class="fa-solid fa-person-running"></i> &ensp;密室逃脫列表</a></li>
      <br> <br>
      <li class="li1"><a class="dropdown-item" href="../ACTLIST/index_act.php"><i class="fa-regular fa-calendar-days"></i> &ensp; 活動列表</a></li>
    </ul>
  </div>
</div>