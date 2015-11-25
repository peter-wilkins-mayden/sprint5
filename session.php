<?php

$dsn = 'mysql:host=shop.c2g7heuzpzpp.eu-west-1.rds.amazonaws.com;port=3306;dbname=shop';
$user = 'liveShop';
$password = 'AWSLiveShop';

try {
    $pdo = new PDO($dsn, $user, $password);
    echo 'Connected!';
} catch (PDOException $e) {
    echo 'Connection failed: ' . $e->getMessage();
}

$sql = "INSERT INTO user (
                        `username`,
                        `password`,
                        `first_name`,
                        `last_name`,
                        `email`,
                        `mobile`)
                 VALUES (
                        :username,
                        :password,
                        :first_name,
                        :last_name,
                        :email,
                        :mobile)";

$result = $pdo->prepare($sql);
$result->bindParam(':username', $_POST['username'], PDO::PARAM_STR);
$result->bindParam(':password', $_POST['password'], PDO::PARAM_STR);
$result->bindParam(':first_name', $_POST['firstname'], PDO::PARAM_STR);
$result->bindParam(':last_name', $_POST['lastname'], PDO::PARAM_STR);
$result->bindParam(':email', $_POST['email'], PDO::PARAM_STR);
$result->bindParam(':mobile', $_POST['mobile'], PDO::PARAM_INT);
$result->execute();

?>