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

  .li1 {
    list-style-type: none;
  }

  .li1:hover:not(:first-child) {
    border: 1px dashed white;
  }
</style>
<div class=" mb-5 ">
  <nav class="navbar navbar-expand-lg  navbar-dark bg-dark " style="padding: 0px 2em 0 1em;">
    <div class="container-fluid ">
      <a class="navbar-brand" href="index_user.php"><img src="./img/Group 1.svg" alt="Navbar" width="150px" height="62px"> </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link <?= $pageName == 'ab_list' ? 'active' : '' ?>" href="index_user.php">列表</a>
          </li>
          <li class="nav-item">
            <a class="nav-link <?= $pageName == 'ab_add' ? 'active' : '' ?>" href="add.php">新增會員資料</a>
          </li>
        </ul>

        <ul class="navbar-nav mb-2 mb-lg-0">
          <?php if (isset($_SESSION["admin"])) : ?>
            <li class="nav-item">
              <a class="nav-link"><?= $_SESSION["admin"]['nick_name'] ?></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logout.php">登出</a>
            </li>
          <?php else : ?>
            <li class="nav-item">
              <a class="nav-link <?= $pageName == 'login' ? 'active' : '' ?>" href="login.php">登入</a>
            </li>
          <?php endif; ?>
        </ul>
      </div>
    </div>
  </nav>
</div>




<a class="col-1 btn btn-dark fixed-bottom ml-5" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
  其他列表
</a>

<div class="offcanvas offcanvas-start " tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel" style="background-color: black;">
  <div class="offcanvas-header ">
    <ul>
      <li class="li1"><img src="./img/dragon-and-dice.png" alt="" style="width:300px; height:150px"></li>
      <br><br>
      <li class="li1" hover=""><a class="dropdown-item" href="#" style="color:white"><i class="fa-solid fa-skull" style="color:white"></i> &ensp;會員列表</a></li>
      <br> <br>
      <li class="li1"><a class="dropdown-item" href="../../PRODLIST/prodindex.php" style="color:white"><i class="fa-solid fa-chess-queen" style="color:white"></i> &ensp;桌遊產品列表</a></li>
      <br> <br>
      <li class="li1"><a class="dropdown-item" href="../../LARPLIST/index_larp.php" style="color:white"><i class="fa-solid fa-person-running" style="color:white"></i> &ensp;密室逃脫列表</a></li>
      <br> <br>
      <li class="li1"><a class="dropdown-item" href="../../ACTLIST/index_act.php" style="color:white"><i class="fa-regular fa-calendar-days" style="color:white"></i> &ensp; 活動列表</a></li>
    </ul>
  </div>
</div>