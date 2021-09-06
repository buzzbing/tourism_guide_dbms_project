<?php include('server.php') ?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="css/frontend.css"> 
        <link rel="stylesheet" href="css/login.css">
              
    </head>
    <body>
    <?php include('nav.html'); ?>
        
            
        <div class="container form_div">
        <h2>Register</h2>
        <form action="registration.php" method ="post">
        
        
            <div>
                <label for ="name"></label>
                <input type ="text" name ="name" placeholder = "Enter Name: " required>
            </div>
            <div>
                <label for ="address"></label>
                <input type ="text" name ="address" placeholder = "Enter Address: " required>
            </div>
        
            <div>
                <label for ="contact"></label>
                <input type ="tel" name ="contact" placeholder = "Enter Contact: " required>
            </div>
        
            <div>
                <label for ="email"></label>
                <input type ="email" name ="email" placeholder = "Enter Email: " required>
                <?php// include('error.php') ?>
            </div>
        
            <div>
                <label for ="password_in"></label>
                <input type ="password" name ="password_in" placeholder="Enter Password: " required>
            </div>
            <div>
                <label for ="password_confirm"></label>
                <input type ="password" name ="password_confirm" placeholder="Confirm Password: " required>
                 <?php// include('error.php') ?>  
            </div>
            <button type="submit" name ="register">Register</button>
            Already a user? <a href='login.php'>Log In</a>

        </form>
    </div>
    
</body>
</html>