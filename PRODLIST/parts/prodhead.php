<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="author" content="Po Cheng Lo" />
  <meta name="robots" content="index,follow" />
  <meta name="rating" content="General" />
  <base target="_self" />
  <meta name="description" content="" />
  <title><?= empty($title) ? 'Prod Page' : "$title - Prod Page" ?></title>
  <style>
    .pagination .page-link {
      background: black;
      color: white;
    }
    i.fa-regular {
      color: red;
    }
    .li1{
      list-style-type: none;
    }
    .li1:hover{
      border: 1px dashed white;
    }
    .offcanvas .li1 a.dropdown-item:hover {
      background-color: black !important;
    }

  </style>
  <!-- CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>

<body>