<?php

session_start();

unset($_SESSION["ADMIN"]);

header('Location: index_.php');