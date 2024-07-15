<?php
$title = "登入";
$pageName = 'prodlogin';

require __DIR__ . '/db-connect-setting.php';
?>
<?php
include __DIR__ . "/parts/prodhead.php";
?>
<style>
  form .mb-3 .form-text {
    color: red;
  }
</style>
<?php include __DIR__ . '/parts/prodnavbar.php'; ?>
<div class="container">
  <div class="row">
    <div class="col-6">
      <div class="card">
        <div class="card-body">
          <h4 class="card-title">登入</h4>
          <form name="form1" onsubmit="sendData(event)" novalidate>
            <div class="mb-3">
              <label for="email" class="form-label">帳號</label>
              <input type="email" class="form-control" id="email" name="email" required>
              <div class="form-text"></div>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">密碼</label>
              <input type="password" class="form-control" id="password" name="password" required>
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
        <h5 class="modal-title fs-5" id="exampleModalLabel">登入錯誤</h5>
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
<?php
include __DIR__ . '/parts/prodscript.php';
?>
<script>
  const emailField = document.form1.email;
  const modal = new bootstrap.Modal('#exampleModal');

  function validateEmail(email) {
    const re =
      /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
  }

  const sendData = function(event) {
    event.preventDefault();

    //重置錯誤訊息
    emailField.nextElementSibling.innerHTML = '';
    emailField.style.border = '1px solid #ccc';

    let isPass = true; //表單有沒有通過檢查

    // TODO:表單欄位的資料檢查

    if (!validateEmail(emailField.value)) {
      isPass = false;
      emailField.nextElementSibling.innerHTML = '請填入正確的 Email';
      emailField.style.border = '1px solid red';
    }

    if (isPass) {
      // FormData 的個體看成沒有外觀的表單
      const fd = new FormData(document.form1);

      fetch('login-api.php', {
          method: 'POST',
          body: fd, //enctype:multipart/form-data
        })
        .then(r => r.json())
        .then(result => {
          console.log(result);
          if (result.success) {
            location.href = "prodindex.php";
          } else {
            modal.show();
          }
        })
        .catch(ex => console.log(ex))
    }
  };
</script>
<?php
include __DIR__ . '/parts/prodfoot.php';
?>