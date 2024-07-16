<?php
// require __DIR__ . '/parts/admin-required.php';

// require __DIR__ . '/db-connect-setting.php';
// header('Content-Type: application/json');

// $output = [
//   'success' => false,
//   'bodyData' => $_POST, #除錯用
// ];

// $sql = "INSERT INTO `ORDERITEM`(
//   `ord_detail_id` , `ord_id` , `prod_id` , 
//   `item_price` , `item_qty` , `item_total` ,
//   `prod_comm` , `prod_star` , `prod_sales`
//   ) VALUES (
//   ? , ? , ? ,
//   ? , ? , ? ,
//   ? , ? , ?
//   )";

// //準備 sql 語法，除了 ”值 ” 語法要合法
// $stmt = $pdo->prepare($sql);
// $stmt->execute([
//   $_POST['ord_detail_id'],
//   $_POST['ord_id'],
//   $_POST['prod_id'],
//   $_POST['item_price'],
//   $_POST['item_qty'],
//   $_POST['item_total'],
//   $_POST['prod_comm'],
//   $_POST['prod_star'],
//   $_POST['prod_sales'],
// ]);

// $output['success'] = !!$stmt->rowCount();
// echo json_encode($output);

require __DIR__ . '/parts/admin-required.php';
require __DIR__ . '/db-connect-setting.php';
header('Content-Type: application/json');

$output = [
  'success' => false,
  'bodyData' => $_POST, // For debugging purposes
  'errors' => [],
];

// Ensure all expected POST variables are set and not empty
$required_fields = [
  'ord_detail_id',
  'ord_id',
  'prod_id',
  'item_price',
  'item_qty',
  'item_total',
  'prod_comm',
  'prod_star',
  'prod_sales'
];

foreach ($required_fields as $field) {
  if (empty($_POST[$field])) {
    $output['errors'][] = "$field is required";
  }
}

if (!empty($output['errors'])) {
  echo json_encode($output);
  exit;
}

$sql = "INSERT INTO `ORDERITEM`(
  `ord_detail_id`, `ord_id`, `prod_id`, 
  `item_price`, `item_qty`, `item_total`, 
  `prod_comm`, `prod_star`, `prod_sales`
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

try {
  $stmt = $pdo->prepare($sql);
  $stmt->execute([
    $_POST['ord_detail_id'],
    $_POST['ord_id'],
    $_POST['prod_id'],
    $_POST['item_price'],
    $_POST['item_qty'],
    $_POST['item_total'],
    $_POST['prod_comm'],
    $_POST['prod_star'],
    $_POST['prod_sales'],
  ]);

  $output['success'] = !!$stmt->rowCount();
} catch (PDOException $e) {
  $output['errors'][] = $e->getMessage();
}

echo json_encode($output);
?>
