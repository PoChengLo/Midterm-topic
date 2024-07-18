<!DOCTYPE html>
<html lang="zh">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title><?= empty($title) ? '密室逃脫桌遊活動' : "$title - 密室逃脫桌遊活動" ?></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
  <link rel="stylesheet" type="text/css" href="style_act2.css">
  <script>
    function confirmDelete(act_id) {
      if (confirm("確定要刪除這個活動嗎？")) {
        window.location.href = "delete.php?id=" + act_id;
      }
    }

    function clearSearch() {
      document.getElementById('search_name').value = '';
      document.getElementById('search_date_start').value = '';
      document.getElementById('search_date_end').value = '';
      document.forms['search_form'].submit();
    }
  </script>
</head>

<body>