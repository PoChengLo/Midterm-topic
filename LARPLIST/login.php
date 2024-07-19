<?php

$title = "登入";
$pageName = "login";

require __DIR__ . '/db-connect.php';
?>

<?php include __DIR__ . "/parts/html-head.php"; ?>
<style>
  form .mb-3 .form-text {
    color: red;
  }
</style>

<!-- 登入頁navbar -->
<div class="container-fill mb-5 vw-100 position-fixed z-1 top-0">
  <nav class="navbar navbar-expand-lg  navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="index_larp.php">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        </ul>

        <ul class="navbar-nav mb-2 mb-lg-0">

          <li class="nav-item">
            <a class="nav-link pe-5" href="login.php">登入</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</div>

<div class="container mt-5 pt-5 ">
  <div class="row">
    <div class="col-6">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">登入</h5>
          <form name="form1" onsubmit="sendData(event)" novalidate>
            <div class="mb-3">
              <label for="email" class="form-label">帳號</label>
              <input type="email" class="form-control" id="email" name="email" placeholder="請輸入電子郵件">
              <div class="form-text"></div>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">密碼</label>
              <input type="password" class="form-control" id="password" name="password">
              <div class="form-text"></div>
            </div>
            <button type="submit" class="btn btn-primary">登入</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">登入錯誤</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="alert alert-danger" role="alert">
          帳號或密碼錯誤
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
      </div>
    </div>
  </div>
</div>

<?php include __DIR__ . "/parts/scripts.php"; ?>
<script>
  const emailField = document.form1.email
  const modal = new bootstrap.Modal('#exampleModal')

  function validateEmail(email) {
    const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
  }

  const sendData = e => {
    e.preventDefault();
    emailField.nextElementSibling.innerHTML = '';
    emailField.style.border = '1px solid #CCC';

    let isPass = true;

    if (!validateEmail(email.value)) {
      isPass = false;
      emailField.nextElementSibling.innerHTML = '請輸入正確的電子郵件';
      emailField.style.border = '1px solid red';
    }

    if (isPass) {
      const fd = new FormData(document.form1);

      fetch('login-api.php', {
          method: 'POST',
          body: fd,
        }).then(r => r.json())
        .then(result => {
          console.log(result);
          if (result.success) {
            location.href = 'index_larp.php';
          } else {
            modal.show();
          }
        })
        .catch(ex => console.log(ex))
    }
  };
</script>

<?php include __DIR__ . '/parts/html-foot.php'; ?>