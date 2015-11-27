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
<title>Insert User</title>

</head>

<body>

<form method="post" action="session.php">
    <div>
        <label>Enter a username:</label>
        <input type="text" name="username">
    </div>
    <div>
        <label>Enter a password:</label>
        <input type="text" name="password"></div>
    <div>
        <label>Enter a first name:</label>
        <input type="text" name="firstname"></div>
    <div>
        <label>Enter a last name:</label>
        <input type="text" name="lastname"></div>
    <div>
        <label>Enter a email:</label>
        <input type="text" name="email"></div>
    <div>
        <label>Enter a mobile:</label>
        <input type="text" name="mobile"></div>
    <div>
        <label>Submit User:</label>
        <input type="submit"></div>
</form>


</body>
</html>
