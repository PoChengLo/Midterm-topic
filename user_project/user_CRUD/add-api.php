<?php
require __DIR__ . '/parts/admin-required.php';
require __DIR__ . '/db-connect.php';
header('Content-Type: application/json');

$output = [
  'success' => false,
  'bodyData' => $_POST,
  'errors' => []
];

// 檢查必要的欄位是否存在
$required_fields = ['name', 'email', 'mobile', 'birthday', 'address'];
foreach ($required_fields as $field) {
    if (empty($_POST[$field])) {
        $output['errors'][] = "Field $field is required.";
    }
}

// 如果有錯誤，返回錯誤信息
if (!empty($output['errors'])) {
    echo json_encode($output);
    exit;
}

// 驗證和格式化生日
$birthday = $_POST['birthday'];
$ts = strtotime($birthday);
if ($ts === false) {
  $output['errors'][] = "Invalid date format for birthday.";
  $birthday = null;
} else {
  $birthday = date('Y-m-d', $ts);
}

// 如果有錯誤，返回錯誤信息
if (!empty($output['errors'])) {
    echo json_encode($output);
    exit;
}

// 設置 PDO 錯誤模式
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

try {
    $sql = "INSERT INTO `userinfo`( 
      `user_name`, `email`, `mobile`,
      `birthday`, `address`, `create_day`
      ) VALUES (
        ?, ?, ?, 
        ?, ?, NOW()
      )";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([
      $_POST['name'],
      $_POST['email'],
      $_POST['mobile'],
      $birthday,
      $_POST['address'],
    ]);

    $output['success'] = !!$stmt->rowCount();
} catch (Exception $e) {
    $output['errors'][] = $e->getMessage();
}

echo json_encode($output);

