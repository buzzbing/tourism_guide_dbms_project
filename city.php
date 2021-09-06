<?php

include('server.php');

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/frontend.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap"
      rel="stylesheet"/>
      <script src="createDiv.js"></script>
    

    <title>Cities</title>
</head>
<body>
<?php include('nav.html'); ?>
<?php 
  // $q = "select * from city;";
  // $q_result= mysqli_query($conn,$q);
  // $length=mysqli_num_rows($q_result);
  //   for($i=1;$i<=$length;$i++):
  //   ?>
    <div class="cityContainer" id="cityContainer" >

    <?php
                       $sql="SELECT photos FROM city where id='1';";
                       $result= mysqli_query($conn,$sql);
                       $resultCheck=mysqli_num_rows($result); 
                       if($resultCheck>0){
                         while($row=mysqli_fetch_assoc($result)){ ?>
            <div class="city" id="skb" style="background: rgba(0, 0, 0, 0.5) url( <?php echo $row['photos'];  ?>);  background-blend-mode: darken;
            background-size: cover;" ><?php }} ?>
                <p > <a href="kathmandu.php" style="color: antiquewhite; text-decoration: none;">
                   <?php
                       $sql="SELECT Name FROM city where id='1';";
                       $result= mysqli_query($conn,$sql);
                       $resultCheck=mysqli_num_rows($result); 
                       if($resultCheck>0){
                         while($row=mysqli_fetch_assoc($result)){
                           echo $row['Name'];
                         }
                       }
     
                    ?></a>
                   </p>
               
            </div>
         
    
            <?php
                       $sql="SELECT photos FROM city where id='2';";
                       $result= mysqli_query($conn,$sql);
                       $resultCheck=mysqli_num_rows($result); 
                       if($resultCheck>0){
                         while($row=mysqli_fetch_assoc($result)){ ?>
            <div class="city" id="skb" style="background: rgba(0, 0, 0, 0.5) url( <?php echo $row['photos'];  ?>);  background-blend-mode: darken;
            background-size: cover;" ><?php }} ?>
                <p > <a href="pokhara.php" style="color: antiquewhite; text-decoration: none;">
                   <?php
                       $sql="SELECT Name FROM city where id='2';";
                       $result= mysqli_query($conn,$sql);
                       $resultCheck=mysqli_num_rows($result); 
                       if($resultCheck>0){
                         while($row=mysqli_fetch_assoc($result)){
                           echo $row['Name'];
                         }
                       }
     
                    ?></a>
                   </p>
               
            </div>
         
    
            
            <?php
                       $sql="SELECT photos FROM city where id='3';";
                       $result= mysqli_query($conn,$sql);
                       $resultCheck=mysqli_num_rows($result); 
                       if($resultCheck>0){
                         while($row=mysqli_fetch_assoc($result)){ ?>
            <div class=" city" id="skb" style="background: rgba(0, 0, 0, 0.5) url( <?php echo $row['photos'];  ?>);  background-blend-mode: darken;
            background-size: cover;" ><?php }} ?>
                <p > <a href="solukhumbu.php" style="color: antiquewhite; text-decoration: none;">
                   <?php
                       $sql="SELECT Name FROM city where id='3';";
                       $result= mysqli_query($conn,$sql);
                       $resultCheck=mysqli_num_rows($result); 
                       if($resultCheck>0){
                         while($row=mysqli_fetch_assoc($result)){
                           echo $row['Name'];
                         }
                       }
     
                    ?></a>
                   </p>
               
            </div>
         
    
            
          
          </div>
          <footer> For more queries : <a style="text-decoration: none;color: cornsilk;"  href="#mail"> tourismassistant@tams.com.np</a> &nbsp;&nbsp;&nbsp;&nbsp;Contact: 01-410398&nbsp;&nbsp;&nbsp;&nbsp;Kathmandu,Nepal <br>
            Copyright &copy; 2021 - All Rights Reserved </footer>
          
        
 
  
</body>
</html>