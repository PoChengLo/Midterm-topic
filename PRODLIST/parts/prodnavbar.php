<?php
if(!isset($pageName)){
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
          <a class="nav-link <?= $pageName == 'prod_add' ? 'active' : '' ?>" aria-current="page"  href="../PRODLIST/prodadd.php">新增商品</a>
        </li>
      </ul>
      <!-- <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->
      <ul class="navbar-nav">
        <?php if(isset($_SESSION['ADMIN'])) :?>
          <li class="nav-item">
            <a class="nav-link"><?= $_SESSION["ADMIN"]['name'] ?></a>
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

<!-- <div class="container">

</div> -->