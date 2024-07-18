<?php

require __DIR__ .'/db-connect.php';

header('Content-Type: application/json');

$output = [
  'success' => false,
  'bodyData' => $_POST,
  'code' => 0,
];


//表單欄位的資料檢查
$larp_id = isset($_POST['larp_id']) ? intval($_POST['larp_id']) : 0;
if (empty($larp_id)) {
  $output['code'] = 400;
  echo json_encode($output);
  exit;
}
$larp_name = $_POST['larp_name'] ?? '';
if (mb_strlen($larp_name) < 2) {
  $output['code'] = 405;
  echo json_encode($output);
  exit;
}



$sql = "UPDATE `LARPLIST` SET
`larp_name`=?,
`larp_img`=?,
`larp_info`=?,
`larp_desc`=?,
`larp_people`=?,
`larp_tag_id`=?,
`larp_date`=?,
`larp_loc`=?,
`larp_price`=?
WHERE `larp_id`=? ";

$stmt=$pdo->prepare($sql);
$stmt->execute([
  $larp_name,
  $_POST['larp_img'],
  $_POST['larp_info'],
  $_POST['larp_desc'],
  $_POST['larp_people'],
  $_POST['larp_tag_id'],
  $_POST['larp_date'],
  $_POST['larp_loc'],
  $_POST['larp_price'],
  $larp_id,
]);

$output['success'] = !!$stmt->rowCount();
echo json_encode($output);