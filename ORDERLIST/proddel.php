<?php
require __DIR__ . '/parts/admin-required.php';

require __DIR__ . '/db-connect-setting.php';

$_id = isset($_GET['_id']) ? intval($_GET['_id']) : 0;

//刪除功能
if(!empty($_id)){
  $sql = "DELETE FROM LIST WHERE _id = $_id";
  $pdo->query($sql);
}

$come_from = "index.php";
//如果有 referer 的 url 就用 referer url
if(isset($_SERVER['HTTP_REFERER'])){
  $come_from = $SERVER['HTTP_REFERER'];
}

header('Location: $come_from');