<?php
require __DIR__ . '/parts/admin-required.php';
require __DIR__ . '/db-connect.php';

$user_id = isset($_GET['user_id']) ? intval($_GET['user_id']) : 0;
if (!empty($user_id)) {
  $sql = "DELETE FROM userinfo WHERE user_id=$user_id";
  $pdo->query($sql);
}
$come_from = "index_.php";
# 如果有 referer 的 url, 就使用 referer url
if (isset($_SERVER['HTTP_REFERER'])) {
  $come_from = $_SERVER['HTTP_REFERER'];
}

header('Location: '. $come_from);
