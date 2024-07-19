<?php
require __DIR__ . '/parts/admin-required.php';

require __DIR__ . '/db-connect-setting.php';

$ord_id = isset($_GET['ord_id']) ? intval($_GET['ord_id']) : 0;
if (empty($ord_id)) {
  header('Location: index_.php');
  exit;
}

$sql = "SELECT * FROM ORDERLIST WHERE ord_id=$ord_id";

$r = $pdo->query($sql)->fetch();
if (empty($r)) {
  header('Location: index_.php');
  exit;
}
?>
<!-- 1234 -->
<?php
include __DIR__ . '/parts/head.php';
?>
<style>
  form .mb-3 .form-text {
    color: red;
  }
</style>
<?php include __DIR__ . '/parts/navbar.php'; ?>
<div class="container">
  <div class="row">
    <div class="col-6  mx-auto mt-3">
      <h4>編輯訂單資料</h4>
      <form name="form1" onsubmit="sendData(event)" novalidate>
          <div class="mb-3">
            <label for="ord_id" class="form-label">訂單編號</label>
            <input type="number" class="form-control" id="ord_id" name="ord_id" value="<?= $r['ord_id'] ?>" required>
            <div class="form-text"></div>
          </div>
          <div class="mb-3">
            <label for="ord_date" class="form-label">訂單日期</label>
            <input type="text" class="form-control" id="ord_date" name="ord_date" value="<?= htmlentities($r['ord_date']) ?>" required>
            <div class="form-text"></div>
          </div>
          <div class="mb-3">
            <label for="user_id" class="form-label">會員編號</label>
            <input type="number" class="form-control" id="user_id" name="user_id" value="<?= $r['user_id'] ?>" required>
            <div class="form-text"></div>
          </div>
          <div class="mb-3">
            <label for="ord_total" class="form-label">訂單總額</label>
            <input type="number" class="form-control" id="ord_total" name="ord_total" value="<?= $r['ord_total'] ?>" required>
            <div class="form-text"></div>
          </div>
          <div class="mb-3">
            <label for="ord_pay" class="form-label">訂單付款狀態</label>
            <input type="number" class="form-control" id="ord_pay" name="ord_pay" value="<?= $r['ord_pay'] ?>" required>
            <div class="form-text"></div>
          </div>
          <div class="mb-3">
            <label for="ship_date" class="form-label">出貨日期</label>
            <input type="text" class="form-control" id="ship_date" name="ship_date" value="<?= htmlentities($r['ship_date']) ?>" required>
            <div class="form-text"></div>
          </div>
          <button type="submit" class="btn btn-primary">修改</button>
        </form>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title fs-5" id="exampleModalLabel">編輯結果</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="alert alert-success" role="alert">
          編輯成功
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
        <a href="./index_.php" class="btn btn-primary">到列表頁</a>
      </div>
    </div>
  </div>
</div>
<?php
include __DIR__ . '/parts/script.php';
?>
<script>
  //設定空字串
  const list_form1 = [];
  let isPass = [];
  let allPass = false;
  const modal = new bootstrap.Modal('#exampleModal');
  const modalBody = document.querySelector('#exampleModal .modal-body');

  //AJAX
  const sendData = function(event) {
    event.preventDefault();

    //表單有沒有通過檢查
    for (let i = 0; i < document.form1.length - 1; i++) {
      list_form1[i] = document.form1[i];
      isPass[i] = true;

      //重置錯誤訊息
      list_form1[i].nextElementSibling.innerHTML = '';
      list_form1[i].style.border = '1px solid #ccc';

      //判斷是否輸入資料
      if (list_form1[i].value == '') {
        isPass[i] = false;
        list_form1[i].nextElementSibling.innerHTML = '請填入正確的資料';
        list_form1[i].style.border = '1px solid red';
      }

      if (isPass[i] == true) {
        allPass = true;
      }
    }

    if (allPass) {
      //FormData 的個體看成沒有外觀的表單
      const fd = new FormData(document.form1);

      fetch('edit-api.php', {
          method: 'POST',
          body: fd, //enctype: multipart/form-data
        }).then(r => r.json())
        .then(result => {
          console.log(result);
          if (result.success) {
            modalBody.innerHTML = `
            <div class="alert alert-success" role="alert">
              編輯成功
            </div>`;
          } else {
            modalBody.innerHTML = `
            <div class="alert alert-danger" role="alert">
              沒有修改
            </div>`;
          }
          modal.show();
        })
        .catch(error => {
          console.error('Error:', error);
          modalBody.innerHTML = '<div class="alert alert-danger" role="alert">系統錯誤，請稍後再試</div>';
          modal.show();
        });
    }
  };
</script>
<?php
include __DIR__ . '/parts/foot.php';
?>