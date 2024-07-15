<?php

require __DIR__ . '/setting.php';

$dsn = "mysql:host={$db_host};dbname={$db_name};charset=utf8mb4";

$pdo_options = [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
];

// $pdo = new PDO($dsn, $db_user, $db_pass, $pdo_options);

try{
  $pdo = new PDO($dsn, $db_user, $db_pass, $pdo_options);
} catch (PDOException $ex){
  echo 'Connection failed', $ex->getMessage();
}

if(!isset($_SESSION)){
  //如果沒有啟動 session 的功能，就啟動
  session_start();
}
