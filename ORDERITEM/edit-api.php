<?php
require __DIR__ . '/parts/admin-required.php';

require __DIR__ . '/db-connect-setting.php';
header('Content-Type: application/json');

$output = [
  'success' => false,
  'bodyData' => $_POST, #除錯用
  'code' => 0, //除錯用
];

//表單欄位的檢查
$_id = isset($_POST['_id']) ? intval($_POST['_id']) : 0;
if (empty($_id)){
  $output['code'] = 400;
  echo json_encode($output);
  exit;
}

$_name = $_POST['_name'] ?? ''; #如果 ?? 左邊的值為 undefined ，就使用右邊的值
if($_name == ''){
  $output['code'] = 405;
  echo json_encode($output);
  exit;
}

$sql = "UPDATE `list` SET
  `_name` = ?,
  `_img` = ?,
  `_tag_id` = ?,
  `_desc` = ?,
  `_price` = ?,
  `_disc` = ?,
  `_stock` = ?,
  `_update` = ?
  WHERE  `_id` = ?";

//準備 sql 語法，除了 ”值 ” 語法要合法
$stmt = $pdo->prepare($sql);
$stmt->execute([
  $_POST['_name'],
  $_POST['_img'],
  $_POST['_tag_id'],
  $_POST['_desc'],
  $_POST['_price'],
  $_POST['_disc'],
  $_POST['_stock'],
  $_POST['_update'],
  $_POST['_id'],
]);

$output['success'] = !!$stmt->rowCount();
echo json_encode($output);