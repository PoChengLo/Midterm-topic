<?php
require __DIR__ . '/db-connect.php';

$larp_id = isset($_GET['larp_id']) ? intval($_GET['larp_id']) : 0;

if (empty($larp_id)) {
  header('Location: index_larp.php');
  exit;
}

$sql = "SELECT * FROM LARPLIST WHERE larp_id=$larp_id";
$r = $pdo->query($sql)->fetch();

if (empty($r)) {
  header('Location: index_larp.php');
  exit;
}
// echo json_encode($r);

?>


<?php include __DIR__ . '/parts/html-head.php' ?>
<style>
  form .mb-3 .form-text {
    color: red;
    font-size: 14px;
  }
</style>
<?php include __DIR__ . '/parts/navbar.php' ?>

<div class="container mt-5 pt-5 offset-3 mb-5">
  <div class="card col-md-8">
    <div class="card-body">
      <h5 class="card-title mb-3 ">編輯列表</h5>
      <form name="form1" onsubmit="sendData(event)" method="post" enctype="multipart/form-data" novalidate>
        <input type="hidden" name="larp_id" value="<?= $r['larp_id'] ?>">
        <div class="mb-3 ">
          <label for="larp_name" class="form-label">名稱</label>
          <input type="text" class="form-control" id="larp_name" name="larp_name" required value="<?= htmlentities($r['larp_name']) ?>" id="name">
          <div class=" form-text">
          </div>
        </div>
        <div class="mb-3 col-md-6">
          <label for="larp_img" class="form-label">圖片</label>
          <input class="form-control" type="text" id="larp_img" name="larp_img" value="<?= $r['larp_img'] ?>">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="larp_info" class="form-label">簡介</label>
          <input type="text" class="form-control" id="larp_info" name="larp_info" value="<?= htmlentities($r['larp_info']) ?>">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="larp_desc" class="form-label">故事敘述</label>
          <textarea class="form-control" id="larp_desc" name="larp_desc" rows="5"><?= htmlentities($r['larp_desc']) ?></textarea>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="larp_people" class="form-label col-6">遊玩人數</label>
          <select class="form-select" id="larp_people" name="larp_people">
            <option disabled>請選擇人數</option>
            <option value="3" <?php ($r['larp_people'] . 'value' == 3) ? 'selected' : '' ?>>1至3人</option>
            <option value="6" <?php ($r['larp_people'] . 'value' == 6) ? 'selected' : '' ?>>4至6人</option>
            <option value="9" <?php ($r['larp_people'] . 'value' == 9) ? 'selected' : '' ?>>7至9人</option>
            <option value="10" <?php ($r['larp_people'] . 'value' == 10) ? 'selected' : '' ?>>10人以上</option>
          </select>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="larp_tag_id" class="form-label col-6">類別</label>
          <select class="form-select" id="larp_tag_id" name="larp_tag_id">
            <option disabled>請選擇類別</option>
            <option value="1" <?php ($r['larp_tag_id'] . 'value' == 1) ? 'selected' : '' ?>>益智</option>
            <option value="2" <?php ($r['larp_tag_id'] . 'value' == 2) ? 'selected' : '' ?>>親子</option>
            <option value="3" <?php ($r['larp_tag_id'] . 'value' == 3) ? 'selected' : '' ?>>策略</option>
            <option value="4" <?php ($r['larp_tag_id'] . 'value' == 4) ? 'selected' : '' ?>>派對</option>
            <option value="5" <?php ($r['larp_tag_id'] . 'value' == 5) ? 'selected' : '' ?>>卡牌</option>
            <option value="6" <?php ($r['larp_tag_id'] . 'value' == 6) ? 'selected' : '' ?>>桌上角色扮演</option>
            <option value="7" <?php ($r['larp_tag_id'] . 'value' == 7) ? 'selected' : '' ?>>合作</option>
            <option value="8" <?php ($r['larp_tag_id'] . 'value' == 8) ? 'selected' : '' ?>>競速</option>
            <option value="9" <?php ($r['larp_tag_id'] . 'value' == 9) ? 'selected' : '' ?>>冒險</option>
            <option value="10" <?php ($r['larp_tag_id'] . 'value' == 10) ? 'selected' : '' ?>>推理</option>
            <option value="11" <?php ($r['larp_tag_id'] . 'value' == 11) ? 'selected' : '' ?>>戰爭</option>
            <option value="12" <?php ($r['larp_tag_id'] . 'value' == 12) ? 'selected' : '' ?>>建設</option>
            <option value="13" <?php ($r['larp_tag_id'] . 'value' == 13) ? 'selected' : '' ?>>經營</option>
            <option value="14" <?php ($r['larp_tag_id'] . 'value' == 14) ? 'selected' : '' ?>>歷史</option>
            <option value="15" <?php ($r['larp_tag_id'] . 'value' == 15) ? 'selected' : '' ?>>科幻</option>
            <option value="16" <?php ($r['larp_tag_id'] . 'value' == 16) ? 'selected' : '' ?>>奇幻</option>
            <option value="17" <?php ($r['larp_tag_id'] . 'value' == 17) ? 'selected' : '' ?>>運動</option>
            <option value="18" <?php ($r['larp_tag_id'] . 'value' == 18) ? 'selected' : '' ?>>音樂</option>
            <option value="19" <?php ($r['larp_tag_id'] . 'value' == 19) ? 'selected' : '' ?>>教育</option>
            <option value="20" <?php ($r['larp_tag_id'] . 'value' == 20) ? 'selected' : '' ?>>恐怖</option>
            <option value="21" <?php ($r['larp_tag_id'] . 'value' == 21) ? 'selected' : '' ?>>經典</option>
            <option value="22" <?php ($r['larp_tag_id'] . 'value' == 22) ? 'selected' : '' ?>>動物</option>
            <option value="23" <?php ($r['larp_tag_id'] . 'value' == 23) ? 'selected' : '' ?>>自然</option>
            <option value="24" <?php ($r['larp_tag_id'] . 'value' == 24) ? 'selected' : '' ?>>歷險</option>
            <option value="25" <?php ($r['larp_tag_id'] . 'value' == 25) ? 'selected' : '' ?>>拼圖</option>
            <option value="26" <?php ($r['larp_tag_id'] . 'value' == 26) ? 'selected' : '' ?>>旅行</option>
            <option value="27" <?php ($r['larp_tag_id'] . 'value' == 27) ? 'selected' : '' ?>>社交</option>
            <option value="28" <?php ($r['larp_tag_id'] . 'value' == 28) ? 'selected' : '' ?>>競技</option>
            <option value="29" <?php ($r['larp_tag_id'] . 'value' == 29) ? 'selected' : '' ?>>創意</option>
            <option value="30" <?php ($r['larp_tag_id'] . 'value' == 30) ? 'selected' : '' ?>>傳統</option>
          </select>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="larp_date" class="form-label">時間</label>
          <input type="text" id="larp_date" name="larp_date" class="form-control" value="<?= ($r['larp_date']) ?>">
          <div class=" form-text">
          </div>
        </div>
        <div class="mb-3">
          <label for="larp_loc" class="form-label">地點</label>
          <input type="text" class="form-control" id="larp_loc" name="larp_loc" value="<?= ($r['larp_loc']) ?>">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="larp_price" class="form-label">價格</label>
          <input type="number" class="form-control" id="larp_price" name="larp_price" value="<?= ($r['larp_price']) ?>">
          <div class="form-text"></div>
        </div>
        <button type="submit" class="btn btn-primary">修改</button>
        <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
          新增
        </button> -->
      </form>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">編輯結果</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        修改成功<br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
        <a class="btn btn-primary" href="index_larp.php">到列表頁</a>
      </div>
    </div>
  </div>
</div>


<?php include __DIR__ . '/parts/scripts.php' ?>
<script>
  //設定datepicker
  $(function() {
    $("#larp_date").datepicker({
      dateFormat: "yy-mm-dd",
      minDate: new Date(),
      maxDate: "+6m",
      monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
      dayNamesMin: ["日", "一", "二", "三", "四", "五", "六"]
    });
  });

  const nameField = document.form1.larp_name;
  const imgField = document.form1.larp_img;
  const infoField = document.form1.larp_info;
  const descField = document.form1.larp_desc;
  const peopleField = document.form1.larp_people;
  const tagField = document.form1.larp_tag_id;
  const dateField = document.form1.larp_date;
  const locField = document.form1.larp_loc;
  const priceField = document.form1.larp_price;
  const modal = new bootstrap.Modal('#exampleModal');
  const modalBody = document.querySelector('#exampleModal .modal-body');

  //檢查欄位格式是否錯誤
  const sendData = e => {
    e.preventDefault();
    nameField.nextElementSibling.innerHTML = '';
    imgField.nextElementSibling.innerHTML = '';
    infoField.nextElementSibling.innerHTML = '';
    descField.nextElementSibling.innerHTML = '';
    peopleField.nextElementSibling.innerHTML = '';
    tagField.nextElementSibling.innerHTML = '';
    dateField.nextElementSibling.innerHTML = '';
    locField.nextElementSibling.innerHTML = '';
    priceField.nextElementSibling.innerHTML = '';


    let isPass = true;

    if (nameField.value.length < 2) {
      isPass = false;
      nameField.nextElementSibling.innerHTML = '請輸入正確的名稱';
    }
    if (!imgField.value) {
      isPass = false;
      imgField.nextElementSibling.innerHTML = '請選擇圖片';
    }
    if (infoField.value.length < 9) {
      isPass = false;
      infoField.nextElementSibling.innerHTML = '請輸入至少10個字的簡介';
    }
    if (descField.value.length < 99) {
      isPass = false;
      descField.nextElementSibling.innerHTML = '請輸入至少100個字的故事敘述';
    }
    if (peopleField.value == "請選擇人數") {
      isPass = false;
      peopleField.nextElementSibling.innerHTML = '請選擇遊玩人數';
    }
    if (tagField.value == "請選擇類別") {
      isPass = false;
      tagField.nextElementSibling.innerHTML = '請選擇LARP所屬類別';
    }
    if (!dateField.value) {
      isPass = false;
      dateField.nextElementSibling.innerHTML = '請選擇時間';
    }
    if (locField.value < 9) {
      isPass = false;
      locField.nextElementSibling.innerHTML = '請輸入完整地址，須包含縣市、路段、門號';
    }
    if (!priceField.value) {
      isPass = false;
      priceField.nextElementSibling.innerHTML = '請輸入價格';
    }

    //欄位格式無誤回傳值至larp-edit-api
    if (isPass) {
      const fd = new FormData(document.form1);

      fetch('larp-edit-api.php', {
          method: "POST",
          body: fd,
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
              尚未編輯
            </div>`;
          }
          modal.show();
        })
        .catch(ex => console.log(ex));
    }
  };
</script>

<?php include __DIR__ . '/parts/html-foot.php' ?>