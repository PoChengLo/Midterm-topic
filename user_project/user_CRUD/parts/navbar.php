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
</style>
<div class="container mb-5">
  <nav class="navbar navbar-expand-lg  navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="index_.php">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link <?= $pageName == 'ab_list' ? 'active' : '' ?>" href="index_.php">列表</a>
          </li>
          <li class="nav-item">
            <a class="nav-link <?= $pageName == 'ab_add' ? 'active' : '' ?>" href="add.php">新增通訊錄</a>
          </li>
        </ul>
        
        <ul class="navbar-nav mb-2 mb-lg-0">
          <?php if (isset($_SESSION["admin"])) : ?>
            <li class="nav-item">
              <a class="nav-link"><?= $_SESSION["admin"]['nickname'] ?></a>
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


<a class="col-2 btn btn-primary fixed-bottom bg-dark ml-5" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">
  立即登入
</a>


<div class="offcanvas offcanvas-start " tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header ">
    <h5 class="offcanvas-title" id="offcanvasExampleLabel">Offcanvas</h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <div>
      Some text as placeholder. In real life you can have the elements you have chosen. Like, text, images, lists, etc.
    </div>
    <div class="dropdown mt-3">
      <button class="btn btn-secondary dropdown-toggle " type="button" id="dropdownMenuButton" data-bs-toggle="dropdown">
        Dropdown button
      </button>
      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <li><a class="dropdown-item" href="#">Action</a></li>
        <li><a class="dropdown-item" href="#">Another action</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
      </ul>
    </div>
  </div>
</div>