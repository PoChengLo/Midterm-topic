<?php
$title = "新增列表";
$pageName = "larp_add";
require __DIR__ . '/db-connect.php';

?>

<?php include __DIR__ . '/parts/html-head.php' ?>
<style>
  form .mb-3 .form-text {
    color: red;
    font-size: 14px;
  }
</style>
<?php include __DIR__ . '/parts/navbar.php' ?>

<div class="container offset-3 mt-5 pt-5">
  <div class="card col-8">
    <div class="card-body">
      <h5 class="card-title mb-3 p-3 ">新增密室逃脫/狼人殺</h5>
      <form name="form1" onsubmit="sendData(event)" method="post" enctype="multipart/form-data" novalidate>
        <div class="mb-3 col-md-8">
          <label for="larp_name" class="form-label">名稱</label>
          <input type="text" class="form-control" id="larp_name" name="larp_name" required>
          <div class="form-text"></div>
        </div>
        <div class="mb-3 col-md-6">
          <label for="larp_img" class="form-label">圖片</label>
          <input class="form-control" type="text" id="larp_img" name="larp_img">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="larp_info" class="form-label">簡介</label>
          <input type="text" class="form-control" id="larp_info" name="larp_info">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="larp_desc" class="form-label">故事敘述</label>
          <textarea class="form-control" id="larp_desc" name="larp_desc" rows="5"></textarea>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="larp_people" class="form-label col-6">遊玩人數</label>
          <select class="form-select" id="larp_people" name="larp_people">
            <option selected disabled>請選擇人數</option>
            <option value="3">1至3人</option>
            <option value="6">4至6人</option>
            <option value="9">7至9人</option>
            <option value="10">10人以上</option>
          </select>
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="larp_tag_id" class="form-label col-6">類別</label>
          <select class="form-select" id="larp_tag_id" name="larp_tag_id">
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
          <label for="larp_date" class="form-label">時間</label>
          <input type="text" id="larp_date" name="larp_date" class="form-control">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="larp_loc" class="form-label">地點</label>
          <input type="text" class="form-control" id="larp_loc" name="larp_loc">
          <div class="form-text"></div>
        </div>
        <div class="mb-3">
          <label for="larp_price" class="form-label">價格</label>
          <input type="number" class="form-control" id="larp_price" name="larp_price">
          <div class="form-text"></div>
        </div>
        <button type="submit" class="btn btn-primary">新增</button>
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
        <h1 class="modal-title fs-5" id="exampleModalLabel">新增結果</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        新增成功<br>
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
    if (descField.value.length < 9) {
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

    //欄位格式無誤回傳值至add-api
    if (isPass) {
      const fd = new FormData(document.form1);

      fetch('add-api.php', {
          method: "POST",
          body: fd,
        }).then(r => r.json())
        .then(result => {
          console.log(result);
          if (result.success) {
            modalBody.innerHTML = `
            <div class="alert alert-success" role="alert">
              新增成功
            </div>`;
          } else {
            modalBody.innerHTML = `
            <div class="alert alert-danger" role="alert">
              沒有新增
            </div>`;
          }
          modal.show();
        })
        .catch(ex => console.log(ex));
    }
  };
</script>

<?php include __DIR__ . '/parts/html-foot.php' ?>