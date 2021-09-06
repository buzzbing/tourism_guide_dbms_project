<?php

//ini_set code is to ignore display of warnings on webpage
//Tell PHP to log errors
ini_set('log_errors', 'On');
//Tell PHP to not display errors
ini_set('display_errors', 'Off');
//Set error_reporting to E_ALL
ini_set('error_reporting', E_ALL );


session_start();

//initializing variables
$username="";
$address="";
$contact="";
$email="";
$tourist_id="";
$errors = array(); 

//connecting database server
$conn = mysqli_connect("localhost","root","","tourism_project");

//checking connection
if(!$conn){

    die("connection failed: ".mysqli_connect_error());

}

//if user clicked on register button of registration page

if(isset($_POST['register'])){

    //variables hold data input by the user
    $name = mysqli_real_escape_string($conn,$_POST['name']);
    $address = mysqli_real_escape_string($conn,$_POST['address']);
    $contact = mysqli_real_escape_string($conn,$_POST['contact']);
    $email = mysqli_real_escape_string($conn,$_POST['email']);
    $password1 = mysqli_real_escape_string($conn,$_POST['password_in']);
    $password2 = mysqli_real_escape_string($conn,$_POST['password_confirm']);
    

//if both passwords do not match
    if($password1!==$password2){ 
        array_push($errors,"Passwords do not match.");
        echo "Passwords do not match.";
       
    }

    //check database for existing email

    $user_check_query = "select * from user where email = '$email';";

    $result = mysqli_query($conn,$user_check_query);
    //user stores fetched data in key-value array
    $user = mysqli_fetch_assoc($result);

    if($user){
        if($user['email']===$email){
            echo("User already exists with this email.");
            array_push($errors,"User with this email already exists.");
        }

    }
 //   mysqli_free_result($result);
    //register the user if no error

    if(count($errors)==0){
    
        $query = "insert into user(name,address,contact,email,password) values
         ('$name','$address','$contact','$email','$password1');";

        mysqli_query($conn,$query); 

        $_SESSION["email"] = $email;
        $_SESSION["success"]="User registered.";

        header('location: login.php');

    }

}


//if user clicked login button from login.php
if(isset($_POST['login'])){
$login_email="";
    
    $login_email = mysqli_real_escape_string($conn,$_POST['login_email']);
    $login_password = mysqli_real_escape_string($conn,$_POST['login_password']);
//    echo count($errors);
   if(count($errors)==0){
       
        $query = "select * from user where email='$login_email' and password='$login_password';";
        
        $result = mysqli_query($conn,$query);
        $regd_user = mysqli_fetch_assoc($result);
        $row_count= mysqli_num_rows($result);
        
        
        
        if($row_count===1){

            $_SESSION["login_email"]=$login_email; 
            $_SESSION["success"]="You are now logged in.";
           
            if($regd_user['userType']==='Admin'){
                header('location:report.php');} 
           else{      
             header('location:preference.php');
           } 
        }
            
          
    }
    //mysqli_free_result($result);
       else{
        
            array_push($errors,"Invalid Email or Password. Try Again.");
            include('error.php');
            session_destroy();
    }
    }

    
if(isset($_POST['prefer_submit'])){
 
 
  
    $city_preferred = mysqli_real_escape_string($conn,$_POST['city_pref']);

    $current_location = mysqli_real_escape_string($conn,$_POST['source']);
    
    $activities_preferred = mysqli_real_escape_string($conn,$_POST['activities']);
    
    $duration_of_trip = mysqli_real_escape_string($conn,$_POST['days']);
    
    $no_of_tourists = mysqli_real_escape_string($conn,$_POST['num_tourist']);
    
    $transport_budget = mysqli_real_escape_string($conn,$_POST['transport_budget']);
    
    $lodging_budget = mysqli_real_escape_string($conn,$_POST['lodging_budget']);

    $fooding_budget = mysqli_real_escape_string($conn,$_POST['fooding_budget']);
    
    $siteseeing_budget = mysqli_real_escape_string($conn,$_POST['sight_budget']);
    
    
    $check_email=$_SESSION["login_email"];
    
    $query1="Select id from user where email='$check_email';";
    $result1=mysqli_query($conn,$query1);
    $select_id = mysqli_fetch_assoc($result1);
    
    $tid=$select_id['id'];

    $_SESSION['tidd']=$tid;
    
    $query2 = "INSERT INTO preference(tourist_id, city_preferred, duration_of_trip, no_of_tourist, lodging_budget, foodingBudget, siteseeing_budget, transport_budget, current_location,activities) 
    VALUES ('$tid','$city_preferred','$duration_of_trip' ,'$no_of_tourists', '$lodging_budget','$fooding_budget', '$siteseeing_budget', '$transport_budget', '$current_location','$activities_preferred');";
    mysqli_query($conn,$query2);
//    if(!mysqli_query($conn,$query2))
//     {echo "Error:".mysqli_error($conn);}
    header('location:pref_result.php');
}


?>
