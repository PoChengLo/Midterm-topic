<?php
$title = "登入";
$pageName = "login";

require __DIR__ . '/db-connect.php';

?>
<?php include __DIR__ . "/parts/html-head.php"; ?>
<style>
  * {

    max-width: 100%;
  }

  .full-height {
    height: 100vh;
  }

  .bg-image {
    display: flex;
    align-items: center;
    justify-content: start;
  }

  .bg-image img {
    width: auto;
    height: 100%;
    object-fit: cover;
  }

  form .mb-3 .form-text {
    color: red;
  }

  .card {
    width: 25rem;
    border-color: #F7E6C4;
    color: #FFF4F4;
  }

  .btn {
    border-color: #999;

  }

  .bgc {
    background-color: #606C5D;
  }
</style>

<div class="bgc">
  <div class="row no-gutters full-height">
    <!-- Left side full-height image -->
    <div class="col-md-6 bg-image">
      <img src="./img/7IOV.gif" alt="Background Image" style="box-shadow: rgba(0, 0, 0, 1) 0px 0px 50px;">
    </div>
    <!-- Right side content -->
    <div class="col-md-4 d-flex align-items-center justify-content-center ">
      <div>
        <div class="card ">
          <img src="./img/bg.png" class="card-img" alt="">
          <div class="card-img-overlay">
            <div class="card-body ">
              <h5 class="card-title">登入</h5>

              <form name="form1" onsubmit="sendData(event)" novalidate>
                <div class="mb-3">
                  <label for="email" class="form-label">帳號 (Email)</label>
                  <input type="email" class="form-control" name="email" id="email">
                  <div class="form-text"></div>
                </div>
                <div class="mb-3">
                  <label for="password" class="form-label">密碼</label>
                  <input type="password" class="form-control" name="password" id="password">
                  <div class="form-text"></div>
                </div>
                <button type="submit" class="btn btn-secondary">登入</button>
              </form>
            </div>
          </div>
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
  const emailField = document.form1.email;
  const modal = new bootstrap.Modal('#exampleModal');

  function validateEmail(email) {
    const re =
      /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
  }

  const sendData = e => {
    e.preventDefault(); // 不要使用傳統的表單送出, 使用 AJAX
    // 重置錯誤訊息
    emailField.nextElementSibling.innerHTML = '';
    emailField.style.border = '1px solid #CCC';

    let isPass = true; // 表單有沒有通過檢查

    // TODO: 表單欄位的資料檢查

    if (!validateEmail(emailField.value)) {
      isPass = false;
      emailField.nextElementSibling.innerHTML = '請填寫正確的 Email';
      emailField.style.border = '1px solid red';
    }

    if (isPass) {
      // FormData 的個體看成沒有外觀的表單
      const fd = new FormData(document.form1);

      fetch('login-api.php', {
          method: 'POST',
          body: fd, // enctype: multipart/form-data
        }).then(r => r.json())
        .then(result => {
          console.log(result);
          if (result.success) {
            location.href = "index_user.php";
          } else {
            modal.show();
          }

        })
        .catch(ex => console.log(ex))
    }
  };
</script>
<?php include __DIR__ . "/parts/html-foot.php"; ?>