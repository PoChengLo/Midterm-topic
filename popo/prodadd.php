<?php
$title = "新增商品";
$pageName = 'prod_add';

require __DIR__ . '/db-connect-setting.php';
?>
<?php
include __DIR__ . '/parts/prodhead.php';
?>
<style>
  form .mb-3 .form-text {
    color: red;
  }
</style>
<?php
include __DIR__ . '/parts/prodnavbar.php';
?>
<div class="container">
  <div class="row">
    <div class="col-6  mx-auto mt-3">
      <form name="form1" onsubmit="sendData(event)" novalidate>
        <div class="mb-3">
          <label for="prod_id" class="form-label">商品編號</label>
          <input type="number" class="form-control" id="prod_id" name="prod_id" required>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_name" class="form-label">商品名稱</label>
          <input type="text" class="form-control" id="prod_name" name="prod_name" required>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_img" class="form-label">商品圖片</label>
          <input type="text" class="form-control" id="prod_img" name="prod_img" required>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_tag_id" class="form-label">商品標籤編號</label>
          <input type="number" class="form-control" id="prod_tag_id" name="prod_tag_id" required>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_desc">商品介紹</label>
          <textarea class="form-control" name="prod_desc" id="prod_desc" required></textarea>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_price" class="form-label">商品價格</label>
          <input type="number" class="form-control" id="prod_price" name="prod_price" required>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_disc" class="form-label">商品折扣</label>
          <input type="number" class="form-control" id="prod_disc" name="prod_disc" required>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_stock" class="form-label">商品庫存</label>
          <input type="number" class="form-control" id="prod_stock" name="prod_stock" required>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_update" class="form-label">商品上架日期</label>
          <input type="date" class="form-control" id="prod_update" name="prod_update" required>
          <div class="form-text"></div>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </div>
  </div>
</div>
<?php
include __DIR__ . '/parts/prodscript.php';
?>
<script>
  //設定空字串
  const prodlist_form1 = [];
  let isPass = [];
  let allPass = false;

  //AJAX
  const sendData = function(event) {
    event.preventDefault();

    //表單有沒有通過檢查
    for (let i = 0; i < document.form1.length - 1; i++) {
      prodlist_form1[i] = document.form1[i];
      isPass[i] = true;

      //重置錯誤訊息
      prodlist_form1[i].nextElementSibling.innerHTML = '';
      prodlist_form1[i].style.border = '1px solid #ccc';

      //判斷是否輸入資料
      if (prodlist_form1[i].value == '') {
        isPass[i] = false;
        prodlist_form1[i].nextElementSibling.innerHTML = '請填入正確的資料';
        prodlist_form1[i].style.border = '1px solid red';
      }

      if (isPass[i] == true) {
        allPass = true;
      }
    }

    if (allPass) {
      //FormData 的個體看成沒有外觀的表單
      const fd = new FormData(document.form1);

      fetch('prodadd-api.php', {
          method: 'POST',
          body: fd, //enctype: multipart/form-data
        }).then(r => r.json())
        .then(result => {
          console.log(result);
        })
        .catch(ex => console.log(ex))
    }
  };
</script>
<?php
include __DIR__ . '/parts/prodfoot.php';
?>