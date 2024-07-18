<?php
require __DIR__ . '/db-connect.php';


$larp_id = isset($_GET['larp_id']) ? intval($_GET['larp_id']) : 0;
if (!empty($larp_id)) {
  $sql = "DELETE FROM LARPLIST WHERE larp_id=$larp_id";
  $pdo->query($sql);
}

// $come_from = "index_.php";
// # 如果有 referer 的 url, 就使用 referer url
// if (isset($_SERVER['HTTP_REFERER'])) {
//   $come_from = $_SERVER['HTTP_REFERER'];
// }

header('Location: index_.php');
