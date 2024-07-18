<?php
require __DIR__ . '/parts/admin-required.php';

require __DIR__ . '/db-connect-setting.php';

$prod_id = isset($_GET['prod_id']) ? intval($_GET['prod_id']) : 0;
if (empty($prod_id)) {
  header('Location: prodindex.php');
  exit;
}

$sql = "SELECT * FROM prodlist WHERE prod_id=$prod_id";

$r = $pdo->query($sql)->fetch();
if (empty($r)) {
  header('Location: prodindex.php');
  exit;
}
?>

<?php
include __DIR__ . '/parts/prodhead.php';
?>
<style>
  form .mb-3 .form-text {
    color: red;
  }
</style>
<?php include __DIR__ . '/parts/prodnavbar.php'; ?>
<div class="container">
  <div class="row">
    <div class="col-6  mx-auto mt-3">
      <h4>編輯商品資料</h4>
      <form name="form1" onsubmit="sendData(event)" novalidate>
        <div class="mb-3">
          <label for="prod_id" class="form-label">商品編號</label>
          <input type="number" class="form-control" id="prod_id" name="prod_id" value="<?= $r['prod_id'] ?>" required>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_name" class="form-label">商品名稱</label>
          <input type="text" class="form-control" id="prod_name" name="prod_name" value="<?= htmlentities($r['prod_name']) ?>" required>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_img" class="form-label">商品圖片</label>
          <input type="file" name="img_insert" id="img_insert" accept="image/*" />
          <input type="text" class="form-control" id="prod_img" name="prod_img" value="<?= $r['prod_img'] ?>" required>
          <img class="mt-3" src="" alt="" id="in_img">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_tag_id" class="form-label">商品標籤編號</label>
          <!-- <input type="number" class="form-control" id="prod_tag_id" name="prod_tag_id" value="<?= $r['prod_tag_id'] ?>" required> -->
          <select class="form-select" id="prod_tag_id" name="prod_tag_id">
            <option selected disabled>請選擇類別</option>
            <option value="1">益智</option>
            <option value="2">親子</option>
            <option value="3">策略</option>
            <option value="4">派對</option>
            <option value="5">卡牌</option>
            <option value="6">桌上角色扮演</option>
            <option value="7">合作</option>
            <option value="8">競速</option>
            <option value="9">冒險</option>
            <option value="10">推理</option>
            <option value="11">戰爭</option>
            <option value="12">建設</option>
            <option value="13">經營</option>
            <option value="14">歷史</option>
            <option value="15">科幻</option>
            <option value="16">奇幻</option>
            <option value="17">運動</option>
            <option value="18">音樂</option>
            <option value="19">教育</option>
            <option value="20">恐怖</option>
            <option value="21">經典</option>
            <option value="22">動物</option>
            <option value="23">自然</option>
            <option value="24">歷險</option>
            <option value="25">拼圖</option>
            <option value="26">旅行</option>
            <option value="27">社交</option>
            <option value="28">競技</option>
            <option value="29">創意</option>
            <option value="30">傳統</option>
          </select>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_desc">商品介紹</label>
          <textarea class="form-control" name="prod_desc" id="prod_desc" required><?= htmlentities($r['prod_desc']) ?></textarea>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_price" class="form-label">商品價格</label>
          <input type="number" class="form-control" id="prod_price" name="prod_price" value="<?= $r['prod_price'] ?>" required>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_disc" class="form-label">商品折扣</label>
          <input type="number" class="form-control" id="prod_disc" name="prod_disc" value="<?= $r['prod_disc'] ?>" required>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_stock" class="form-label">商品庫存</label>
          <input type="number" class="form-control" id="prod_stock" name="prod_stock" value="<?= $r['prod_stock'] ?>" required>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="prod_update" class="form-label">商品上架日期</label>
          <input type="datetime-local" class="form-control" id="prod_update" name="prod_update" value="<?= $r['prod_update'] ?>" required>
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
        <a href="./prodindex.php" class="btn btn-primary">到列表頁</a>
      </div>
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
  const modal = new bootstrap.Modal('#exampleModal');
  const modalBody = document.querySelector('#exampleModal .modal-body');
  const img_insert = document.querySelector('#img_insert');
  const img_name = document.querySelector('#prod_img');
  const in_img = document.querySelector('#in_img');
  in_img.src = `./imgs/<?= $r['prod_img'] ?>`;
  //圖片新增後，圖片名稱放置於下方輸入格
  img_insert.addEventListener("change", function(e) {
    img_name.value = img_insert.files[0].name;
    in_img.src = `./imgs/${img_insert.files[0].name}`;
  })





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

      fetch('prodedit-api.php', {
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
include __DIR__ . '/parts/prodfoot.php';
?>