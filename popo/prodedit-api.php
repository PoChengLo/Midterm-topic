<?php

require __DIR__ . '/db-connect-setting.php';
header('Content-Type: application/json');

$output = [
  'success' => false,
  'bodyData' => $_POST, #除錯用
  'code' => 0, //除錯用
];

//表單欄位的檢查
$prod_id = isset($_POST['prod_id']) ? intval($_POST['prod_id']) : 0;
if (empty($prod_id)){
  $output['code'] = 400;
  echo json_encode($output);
  exit;
}

$prod_name = $_POST['prod_name'] ?? ''; #如果 ?? 左邊的值為 undefined ，就使用右邊的值
if($prod_name == ''){
  $output['code'] = 405;
  echo json_encode($output);
  exit;
}

$sql = "UPDATE `prodlist` SET
  `prod_name` = ?,
  `prod_img` = ?,
  `prod_tag_id` = ?,
  `prod_desc` = ?,
  `prod_price` = ?,
  `prod_disc` = ?,
  `prod_stock` = ?,
  `prod_update` = ?
  WHERE  `prod_id` = ?";

//準備 sql 語法，除了 ”值 ” 語法要合法
$stmt = $pdo->prepare($sql);
$stmt->execute([
  $_POST['prod_name'],
  $_POST['prod_img'],
  $_POST['prod_tag_id'],
  $_POST['prod_desc'],
  $_POST['prod_price'],
  $_POST['prod_disc'],
  $_POST['prod_stock'],
  $_POST['prod_update'],
  $_POST['prod_id'],
]);

$output['success'] = !!$stmt->rowCount();
echo json_encode($output);