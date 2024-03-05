<?php
$servername = "localhost";
$username = "shorn@gmail.com";
$password = "admin";
$database = "agritrack";


$conn = new mysqli($servername, $username, $password, $database);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
