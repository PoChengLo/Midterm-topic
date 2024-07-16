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
$ord_id = isset($_POST['ord_id']) ? intval($_POST['ord_id']) : 0;
if (empty($ord_id)) {
  $output['code'] = 400;
  echo json_encode($output);
  exit;
}

// $_name = $_POST['_name'] ?? ''; #如果 ?? 左邊的值為 undefined ，就使用右邊的值
// if($_name == ''){
//   $output['code'] = 405;
//   echo json_encode($output);
//   exit;
// }

$sql = "UPDATE `ORDERLIST` SET
  `ord_date` = ?,
  `user_id` = ?,
  `ord_total` = ?,
  `ord_pay` = ?,
  `ship_date` = ? 
  WHERE  `ord_id` = ?";

//準備 sql 語法，除了 ”值 ” 語法要合法
$stmt = $pdo->prepare($sql);
$stmt->execute([
  $_POST['ord_date'],
  $_POST['user_id'],
  $_POST['ord_total'],
  $_POST['ord_pay'],
  $_POST['ship_date'],
  $_POST['ord_id'],
]);

$output['success'] = !!$stmt->rowCount();
echo json_encode($output);

?>