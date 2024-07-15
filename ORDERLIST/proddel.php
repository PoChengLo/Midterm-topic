<?php
require __DIR__ . '/parts/admin-required.php';

require __DIR__ . '/db-connect-setting.php';

$prod_id = isset($_GET['prod_id']) ? intval($_GET['prod_id']) : 0;

//刪除功能
if(!empty($prod_id)){
  $sql = "DELETE FROM PRODLIST WHERE prod_id = $prod_id";
  $pdo->query($sql);
}

$come_from = "prodindex.php";
//如果有 referer 的 url 就用 referer url
if(isset($_SERVER['HTTP_REFERER'])){
  $come_from = $SERVER['HTTP_REFERER'];
}

header('Location: $come_from');