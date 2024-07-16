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
$ord_detail_id = isset($_POST['ord_detail_id']) ? intval($_POST['ord_detail_id']) : 0;
if (empty($ord_detail_id)) {
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

$sql = "UPDATE `ORDERITEM` SET
  `ord_id` = ?,
  `prod_id` = ?,
  `item_price` = ?,
  `item_qty` = ?,
  `item_total` = ?,
  `prod_comm` = ?,
  `prod_star` = ?,
  `prod_sales` = ?
  WHERE  `ord_detail_id` = ?";

//準備 sql 語法，除了 ”值 ” 語法要合法
$stmt = $pdo->prepare($sql);
$stmt->execute([
  $_POST['ord_id'],
  $_POST['prod_id'],
  $_POST['item_price'],
  $_POST['item_qty'],
  $_POST['item_total'],
  $_POST['prod_comm'],
  $_POST['prod_star'],
  $_POST['prod_sales'],
  $_POST['ord_detail_id'],
]);

$output['success'] = !!$stmt->rowCount();
echo json_encode($output);