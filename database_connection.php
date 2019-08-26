<?php

$host = 'localhost';
$db = 'invsys';
$username = 'postgres';
$password = '42IsTheAnswer';

$connect = new PDO('pgsql:dbname=$db;host=$host', $username, $password);
session_start();

?>
