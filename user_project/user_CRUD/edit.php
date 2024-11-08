<?php
require __DIR__ . '/parts/admin-required.php';
require __DIR__ . '/db-connect.php';

$user_id = isset($_GET['user_id']) ? intval($_GET['user_id']) : 0;
if (empty($user_id)) {
  header('Location: index_user.php');
  exit;
}

$sql = "SELECT * FROM userinfo WHERE user_id=$user_id";
$r = $pdo->query($sql)->fetch();

if (empty($r)) {
  header('Location: index_user.php');
  exit;
}

# header('Content-Type: application/json'); # 告訴瀏覽器內容為 JSON
# echo json_encode($r);
?>

<?php include __DIR__ . "/parts/html-head.php"; ?>
<style>
  form .mb-3 .form-text {
    color: red;
  }
</style>
<?php include __DIR__ . "/parts/navbar.php"; ?>

<div class="container">
  <div class="row">
    <div class="col-6">
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">編輯會員資料</h5>

          <form name="form1" onsubmit="sendData(event)" novalidate>
            <input type="hidden" name="user_id" value="<?= $r['user_id'] ?>">
            <input type="hidden" name="user_img" id="user_img" value="<?= $r['user_img'] ?>">
            
            <div class="mb-3">
              <label for="name" class="form-label">姓名</label>
              <input type="text" class="form-control" name="name" value="<?= htmlentities($r['user_name']) ?>" id="name" required>
              <div class="form-text"></div>
            </div>

            <div class="mb-3">
              <label for="email" class="form-label">email</label>
              <input type="email" class="form-control" name="email" value="<?= $r['email'] ?>" id="email">
              <div class="form-text"></div>
            </div>

            <div class="mb-3">
              <label for="mobile" class="form-label">手機</label>
              <input type="text" class="form-control" name="mobile" value="<?= $r['mobile'] ?>" id="mobile">
              <div class="form-text"></div>
            </div>

            <div class="mb-3">
              <label for="birthday" class="form-label">生日</label>
              <input type="date" class="form-control" name="birthday" value="<?= $r['birthday'] ?>" id="birthday">
            </div>

            <div class="mb-3">
              <label for="address" class="form-label">地址</label>
              <textarea class="form-control" name="address" id="address" rows="3"><?= htmlentities($r['address']) ?></textarea>
            </div>

            <button type="submit" class="btn btn-primary">修改</button>
          </form>
        </div>
      </div>
    </div>

    <div class="card ms-3" style="width: 25rem;">
      <img id="previewImage" src="./img/<?= $r['user_img'] ?>" class="card-img-top mt-3" alt="Preview" style="width:250px;border: 2px solid #333;">
      <div class="card-body">
        <h5 class="card-title">自訂您的使用者頭像</h5>
        <p class="card-text">用我們高度客製化的圖片來展現您的個人丰采吧！相信這裡一定有契合你靈魂的人物！</p>

        <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
          選擇圖片
        </a>

        <div class="collapse" id="collapseExample">
          <div class="card card-body">
            <div class="container">
              <div class="row">
                <img src="./img/image09.jpg" alt="Image 09" class="col-md-4" onclick="updatePreview('./img/image09.jpg', 'image09.jpg')">
                <img src="./img/image02.jpg" alt="Image 02" class="col-md-4" onclick="updatePreview('./img/image02.jpg', 'image02.jpg')">
                <img src="./img/image03.jpg" alt="Image 03" class="col-md-4" onclick="updatePreview('./img/image03.jpg', 'image03.jpg')">
              </div>

              <div class="row mt-3">
                <img src="./img/image04.jpg" alt="Image 04" class="col-md-4" onclick="updatePreview('./img/image04.jpg', 'image04.jpg')">
                <img src="./img/image05.jpg" alt="Image 05" class="col-md-4" onclick="updatePreview('./img/image05.jpg', 'image05.jpg')">
                <img src="./img/image06.jpg" alt="Image 06" class="col-md-4" onclick="updatePreview('./img/image06.jpg', 'image06.jpg')">
              </div>

              <div class="row mt-3">
                <img src="./img/image07.jpg" alt="Image 07" class="col-md-4" onclick="updatePreview('./img/image07.jpg', 'image07.jpg')">
                <img src="./img/image08.jpg" alt="Image 08" class="col-md-4" onclick="updatePreview('./img/image08.jpg', 'image08.jpg')">
              </div>
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
        <h1 class="modal-title fs-5" id="exampleModalLabel">編輯結果</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="alert alert-success" role="alert">
          編輯成功
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
        <a href="index_user.php" class="btn btn-primary">到列表頁</a>
      </div>
    </div>
  </div>
</div>

<?php include __DIR__ . "/parts/scripts.php"; ?>
<script>
  const nameField = document.form1.name;
  const emailField = document.form1.email;
  const modal = new bootstrap.Modal('#exampleModal');
  const modalBody = document.querySelector('#exampleModal .modal-body');

  function validateEmail(email) {
    const re =
      /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
  }

  const sendData = e => {
    e.preventDefault(); // 不要使用傳統的表單送出, 使用 AJAX
    // 重置錯誤訊息
    nameField.nextElementSibling.innerHTML = '';
    nameField.style.border = '1px solid #CCC';
    emailField.nextElementSibling.innerHTML = '';
    emailField.style.border = '1px solid #CCC';

    let isPass = true; // 表單有沒有通過檢查

    // TODO: 表單欄位的資料檢查
    if (nameField.value.length < 2) {
      isPass = false;
      nameField.nextElementSibling.innerHTML = '請填寫正確的姓名';
      nameField.style.border = '1px solid red';
    }
    if (!validateEmail(emailField.value)) {
      isPass = false;
      emailField.nextElementSibling.innerHTML = '請填寫正確的 Email';
      emailField.style.border = '1px solid red';
    }

    if (isPass) {
      // FormData 的個體看成沒有外觀的表單
      const fd = new FormData(document.form1);

      fetch('edit-api.php', {
          method: 'POST',
          body: fd, // enctype: multipart/form-data
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
        .catch(ex => console.log(ex))
    }
  };

  function updatePreview(src, filename) {
    document.getElementById('previewImage').src = src;
    document.getElementById('user_img').value = filename;
  }
</script>
<?php include __DIR__ . "/parts/html-foot.php"; ?>
