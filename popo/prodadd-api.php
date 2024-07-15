<?php
require __DIR__ . '/parts/admin-required.php';

require __DIR__ . '/db-connect-setting.php';
header('Content-Type: application/json');

$output = [
  'success' => false,
  'bodyData' => $_POST, #除錯用
];

$sql = "INSERT INTO `PRODLIST`(
  `prod_id` , `prod_name` , `prod_img` , 
  `prod_tag_id` , `prod_desc` , `prod_price` ,
  `prod_disc` , `prod_stock` , `prod_update`
  ) VALUES (
  ? , ? , ? ,
  ? , ? , ? ,
  ? , ? , NOW()
  )";

//準備 sql 語法，除了 ”值 ” 語法要合法
$stmt = $pdo->prepare($sql);
$stmt->execute([
  $_POST['prod_id'],
  $_POST['prod_name'],
  $_POST['prod_img'],
  $_POST['prod_tag_id'],
  $_POST['prod_desc'],
  $_POST['prod_price'],
  $_POST['prod_disc'],
  $_POST['prod_stock'],
]);

$output['success'] = !!$stmt->rowCount();
echo json_encode($output);