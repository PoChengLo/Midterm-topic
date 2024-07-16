<?php
if(!isset($pageName)){
  $pageName = "";
}
?>


<div class="container">
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="./index_.php">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link <?= $pageName == 'orditem_list' ? 'active' : '' ?>" aria-current="page" href="./index_.php">訂單項目列表</a>
          </li>
          <li class="nav-item">
            <a class="nav-link <?= $pageName == 'orditem_add' ? 'active' : '' ?>" aria-current="page"  href="./add.php">新增訂單項目</a>
          </li>
        </ul>
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
        <ul class="navbar-nav">
          <?php if(isset($_SESSION['ADMIN'])) :?>
            <li class="nav-item">
              <a class="nav-link"><?= $_SESSION["ADMIN"]['name'] ?></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logout.php">登出</a>
            </li>
            <?php else : ?>
              <li class="nav-item">
              <a class="nav-link <?= $pageName == 'login' ? 'actice' : '' ?>" href="./login.php">登入</a>
            </li>
            <?php endif; ?>
        </ul>
      </div>
    </div>
  </nav>

</div>