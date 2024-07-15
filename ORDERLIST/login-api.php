<?php

require __DIR__ . '/db-connect-setting.php';
header('Content-Type: application/json');

$output = [
  'success' => false,
  'bodyData' => $_POST, #除錯用
  'code' => 0, //除錯用
  'error' => '',
];

//表單欄位的檢查
if(!isset($_POST['email'])  or !isset($_POST['password'])){
  $output['error'] = '欄位資料不足';
  $output['code'] = 401;
  echo json_encode($output);
  exit;
}

//去除頭尾空白字元
$email = trim($_POST['email']);
$password = trim($_POST['password']);

//先判斷帳號對不對
$sql = "SELECT * FROM ADMIN_LIST WHERE email = ? ";
$stmt = $pdo->prepare($sql);
$stmt->execute([$email]);
$row = $stmt->fetch();
if(empty($row)){
  $output['error'] = '帳號是錯的';
  $output['code'] = 403;
  echo json_encode($output);
  exit;
}

//判斷密碼對不對
if (password_verify($password, $row['password_hash'])) {
  $output['success'] = true;
  $output['code'] = 200;
  //已登入的狀態記錄在 session 裡
  $_SESSION['ADMIN'] = [
    'email' => $row['email'],
    'name' => $row['name'],
    // 'password' => $row['password_hash'],
  ];
} else {
  $output['error'] = '密碼是錯的';
  $output['code'] = 405;
}

echo json_encode($output, JSON_UNESCAPED_UNICODE);