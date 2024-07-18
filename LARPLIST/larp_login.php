<?php

session_start();
if (isset($_SESSION["admin"])) {
  include __DIR__ . '/index_.php';
} else {
  include __DIR__ . '../user_project/user_CRUD/login.php';
}
