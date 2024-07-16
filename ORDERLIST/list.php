<?php
require __DIR__ . '/db-connect-setting.php';

$sql = "SELECT * FROM ORDERLIST";
$stmt = $pdo->query($sql);
$rows = $stmt->fetchAll();

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LIST</title>
</head>
<body>
  <?php echo json_encode($rows, JSON_UNESCAPED_UNICODE)?>
</body>
</html>