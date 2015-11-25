<?php

/*Create new user
INSERT INTO user (`username`, `salt`, `password`, `first_name`,
    `last_name`,
    `email`,
    `telephone`,
    `mobile`)
VALUES (:username, :salt, :password, :first_name,
        :last_name,
        :email,
        :telephone,
        :mobile);
//Create new supplier

//Create new product
*/
?>

<html>

<head>


</head>

<body>

<form method="post" action="session.php">
    Enter a username:
    <input type="text" name="username">
    <br>
    Enter a password:
    <input type="text" name="password">
    Enter a first name:
    <input type="text" name="firstname">
    Enter a last name:
    <input type="text" name="lastname">
    Enter a email:
    <input type="text" name="email">
    Enter a mobile:
    <input type="text" name="mobile">
    Submit User:
    <input type="submit">
</form>


</body>
</html>
