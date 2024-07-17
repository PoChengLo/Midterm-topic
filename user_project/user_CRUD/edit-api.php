<?php
require __DIR__ . '/parts/admin-required.php';
require __DIR__ . '/db-connect.php';
header('Content-Type: application/json');

$output = [
  'success' => false,
  'bodyData' => $_POST, # 除錯用
  'code' => 0, # 除錯用
];


// TODO: 表單欄位的資料檢查
$user_id = isset($_POST['user_id']) ? intval($_POST['user_id']) : 0;
if (empty($user_id)) {
  $output['code'] = 400;
  echo json_encode($output);
  exit;
}
$name = $_POST['user_name'] ?? ''; # ?? 如果 ?? 的左邊為 undefined, 就使用右邊的值
if (mb_strlen($name) < 2) {
  $output['code'] = 405;
  echo json_encode($output);
  exit;
}


$birthday = $_POST['birthday'];
$ts = strtotime($birthday); # 轉換成 timestamp
if ($ts === false) {
  $birthday = null; # 如果不是日期的格式, 就使用 null
} else {
  $birthday = date('Y-m-d', $ts);
}



$sql = "UPDATE `userinfo` SET 
    `user_name`=?,
    `email`=?,
    `mobile`=?,
    `birthday`=?,
    `address`=?
    WHERE `user_id`=? ";

$stmt = $pdo->prepare($sql); # 準備 sql 語法, 除了 "值" 語法要合法
$stmt->execute([
  $name,
  $_POST['email'],
  $_POST['mobile'],
  $birthday,
  $_POST['address'],
  $user_id,
]);

$output['success'] = !!$stmt->rowCount();
echo json_encode($output);
