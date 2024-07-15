<?php
require __DIR__ . '/parts/admin-required.php';

require __DIR__ . '/db-connect-setting.php';
header('Content-Type: application/json');

$output = [
  'success' => false,
  'bodyData' => $_POST, #除錯用
];

$sql = "INSERT INTO `LIST`(
  `_id` , `_name` , `_img` , 
  `_tag_id` , `_desc` , `_price` ,
  `_disc` , `_stock` , `_update`
  ) VALUES (
  ? , ? , ? ,
  ? , ? , ? ,
  ? , ? , NOW()
  )";

//準備 sql 語法，除了 ”值 ” 語法要合法
$stmt = $pdo->prepare($sql);
$stmt->execute([
  $_POST['_id'],
  $_POST['_name'],
  $_POST['_img'],
  $_POST['_tag_id'],
  $_POST['_desc'],
  $_POST['_price'],
  $_POST['_disc'],
  $_POST['_stock'],
]);

$output['success'] = !!$stmt->rowCount();
echo json_encode($output);