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
    width: 300px;
    background-color: #212529;
    color: white;
    text-align: center;
    line-height: 100px;
    border-radius: 15px;
  }
</style>


<nav class="navbar navbar-expand-lg  navbar-dark bg-dark mb-5">
  <div class="container-fluid">
    <a class="navbar-brand" href="index_act.php">LOGO</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link">活動列表</a>
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


<a class="col-1 btn btn-primary fixed-bottom bg-dark ml-5" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
  其他列表
</a>


<div class="offcanvas offcanvas-start " tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header ">
    <ul>
      <li class="li1"><a class="dropdown-item" href="index_act.php">會員資料</a></li>
      <br> <br>
      <li class="li1"><a class="dropdown-item" href="index_act.php">桌遊產品列表</a></li>
      <br> <br>
      <li class="li1"><a class="dropdown-item" href="index_act.php">密室逃脫列表</a></li>
      <br> <br>
      <li class="li1"><a class="dropdown-item" href="index_act.php">活動列表</a></li>
    </ul>
  </div>
</div>
