<?php
$title = "新增商品";
$pageName = 'prod_add';

require __DIR__ . '/db-connect-setting.php';
?>
<?php
include __DIR__ . '/parts/prodhead.php';
?>
<?php
include __DIR__ . '/parts/prodnavbar.php';
?>
<div class="container">
  <div class="row">
    <div class="col-6  mx-auto mt-3">
      <form action="prodadd-api.php" method="post">
        <div class="mb-3">
          <label for="prod_id" class="form-label">商品編號</label>
          <input type="number" class="form-control" id="prod_id" name="prod_id">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_name" class="form-label">商品名稱</label>
          <input type="text" class="form-control" id="prod_name" name="prod_name">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_img" class="form-label">商品圖片</label>
          <input type="text" class="form-control" id="prod_img" name="prod_img">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_tag_id" class="form-label">商品標籤編號</label>
          <input type="number" class="form-control" id="prod_tag_id" name="prod_tag_id">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_desc" class="form-label">商品簡介</label>
          <input type="text" class="form-control" id="prod_desc" name="prod_desc">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_price" class="form-label">商品價格</label>
          <input type="number" class="form-control" id="prod_price" name="prod_price">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_disc" class="form-label">商品折扣</label>
          <input type="number" class="form-control" id="prod_disc" name="prod_disc">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_stock" class="form-label">商品庫存</label>
          <input type="number" class="form-control" id="prod_stock" name="prod_stock">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_update" class="form-label">商品上架日期</label>
          <input type="number" class="form-control" id="prod_update" name="prod_update">
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
<?php
include __DIR__ . '/parts/prodfoot.php';
?>