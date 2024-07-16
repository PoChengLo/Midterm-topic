<?php
require __DIR__ . '/parts/admin-required.php';

require __DIR__ . '/db-connect-setting.php';

$ord_detail_id = isset($_GET['ord_detail_id']) ? intval($_GET['ord_detail_id']) : 0;

//刪除功能
if(!empty($ord_detail_id)){
  $sql = "DELETE FROM ORDERITEM WHERE ord_detail_id = $ord_detail_id";
  $pdo->query($sql);
}

$come_from = "index_.php";
//如果有 referer 的 url 就用 referer url
if(isset($_SERVER['HTTP_REFERER'])){
  $come_from = $_SERVER['HTTP_REFERER'];
}

header('Location: ' . $come_from);