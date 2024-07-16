<?php
require __DIR__ . '/parts/admin-required.php';

require __DIR__ . '/db-connect-setting.php';
header('Content-Type: application/json');

$output = [
  'success' => false,
  'bodyData' => $_POST, #除錯用
];

$sql = "INSERT INTO `ORDERLIST`(
  `ord_id` , `ord_date` , `user_id` , 
  `ord_total` , `ord_pay` , `ship_date` 
  ) VALUES (
  ? , ? , ? ,
  ? , ? , ? 
  )";

//準備 sql 語法，除了 ”值 ” 語法要合法
$stmt = $pdo->prepare($sql);
$stmt->execute([
  $_POST['ord_id'],
  $_POST['ord_date'],
  $_POST['user_id'],
  $_POST['ord_total'],
  $_POST['ord_pay'],
  $_POST['ship_date'],
]);

$output['success'] = !!$stmt->rowCount();
echo json_encode($output);
