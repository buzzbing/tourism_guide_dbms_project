<?php include('server.php') ?>

<!DOCTYPE html>
<html>
    <head>
        <title>Log In</title>
        <link rel="stylesheet" href="css/frontend.css">
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
    <?php include('nav.html'); ?>
        <div class="container">
            <div class="form_div">

                <h2>Log In</h2>
        
                <form action="login.php" method ="post">
                <div class="form_field">
                    <input type ="email" name ="login_email" placeholder="Enter email: " required>
                    <?php include('error.php') ?>
             <br>
                    <input type ="password" name ="login_password" placeholder="Enter password: "required>
               <br>
                    <button type = "submit" name = "login">Log In</button>
                </div>
                    Not a User? <a href='registration.php'>Register Here!</a><br>
                    Forgot Password? <a href='about.php'>Contact Us</a>

                </form>
            </div>
        </div>
    
    </body>
</html>