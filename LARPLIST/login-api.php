<?php

require __DIR__ . "/db-connect.php";
header('Content-Type: application/json');

$output = [
  'success' => false,
  'bodyData' => $_POST, # 除錯用
  'code' => 0,  # 除錯用
  'error' => '',
];

if (!isset($_POST['email']) or !isset($_POST['password'])) {
  $output['error'] = '欄位資料不足';
  $output['code'] = 401;
  echo json_encode($output);
  exit;
}

#去除頭尾空白字元
$email = trim($_POST['email']);
$password = trim($_POST['password']);

#先判斷帳號對不對
$sql = "SELECT * FROM USERINFO WHERE email=?";
$stmt = $pdo->prepare($sql);
$stmt->execute([$email]);
$row = $stmt->fetch();
if (empty($row)) {
  $output["error"] = "帳號是錯的";
  $output["code"] = 403;
  echo json_encode($output);
  exit;
}

#判斷密碼對不對
if (password_verify($password, $row["password"])) {
  $output["success"] = true;
  $output["code"] = 200;
  $_SESSION['admin'] = [
    'id' => $row['user_id'],
    'email' => $row['email'],
    'password' => $row['password'],
    'nick_name' => $row['nick_name'],
  ];
} else {
  $output['error'] = '密碼是錯的';
  $output['code'] = 405;
}

echo json_encode($output, JSON_UNESCAPED_UNICODE);
