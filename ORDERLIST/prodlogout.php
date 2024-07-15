<?php

session_start();

unset($_SESSION["ADMIN"]);

header('Location: prodindex.php');