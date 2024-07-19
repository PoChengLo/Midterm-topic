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

  /* .bg-dark ul .web-title {
    color: white;
    list-style: none;
    text-decoration: none;
  } */
</style>

<div class="bg-dark col-2 vh-100 position-fixed top-0 mb-5">
  <div class="text-white mt-5 pt-5">
    <nav class="nav flex-column ms-3">
      <a class="nav-link text-white" aria-current="page" href="#">會員列表</a>
      <a class="nav-link text-white" aria-current="page" href="#">桌遊商品列表</a>
      <a class="nav-link text-white" href="#">密室逃脫/劇本殺列表</a>
      <a class="nav-link text-white" href="#">訂單列表</a>
      <a class="nav-link text-white" href="#">購物車列表</a>
    </nav>
  </div>
</div>

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
            <a class="nav-link" href="index_.php">密室逃脫/劇本殺列表</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="add.php">新增</a>
          </li>
        </ul>

        <ul class="navbar-nav mb-2 mb-lg-0">

          <li class="nav-item">
            <a class="nav-link pe-5" href="">登出</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</div>
</div>