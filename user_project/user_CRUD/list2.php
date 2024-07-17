<?php

require __DIR__ . '/db-connect.php';

$sql = "SELECT * FROM userinfo ORDER BY user_id DESC LIMIT 5 ";
$stmt = $pdo->query($sql);

$i = 0;
while ($row = $stmt->fetch()) {
  echo "<div> $i: {$row['name']} </div>";
  $i++;
}
