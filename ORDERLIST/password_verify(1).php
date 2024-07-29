<?php

$hash = '$2y$10$5Y6sYgWL3aDlyC48I3e9oe3P6w.8wUqcJpi09s8ceasV.uTdbMzbS';

$pass = '1234';

var_dump(password_verify($pass, $hash));