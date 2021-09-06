<?php include('server.php') ?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Preference</title>
  <link rel="stylesheet" href="css/frontend.css">
	<link rel="stylesheet" href="css/login.css">
</head>
<body>
<?php include('nav.html'); ?>





<form action="preference.php" method="POST">

<div class="form_div">
  <h2>Find your perfect travel destination</h2>

  <div class="form_field">
    <input type="text" list="citypref" placeholder="Choose a destination" name="city_pref">
    <datalist id="citypref">
      <option><?php
                   $sql="SELECT Name FROM city where id=1;";
                   $result= mysqli_query($conn,$sql);
                   $resultCheck=mysqli_num_rows($result); 
                   if($resultCheck>0){
                     while($row=mysqli_fetch_assoc($result)){
                       echo $row['Name'];
                     }
                   }
 
                ?></option>
      <option><?php
                   $sql="SELECT Name FROM city where id=2;";
                   $result= mysqli_query($conn,$sql);
                   $resultCheck=mysqli_num_rows($result); 
                   if($resultCheck>0){
                     while($row=mysqli_fetch_assoc($result)){
                       echo $row['Name'];
                     }
                   }
 
                ?></option>
      <option><?php
                   $sql="SELECT Name FROM city where id=3;";
                   $result= mysqli_query($conn,$sql);
                   $resultCheck=mysqli_num_rows($result); 
                   if($resultCheck>0){
                     while($row=mysqli_fetch_assoc($result)){
                       echo $row['Name'];
                     }
                   }
 
                ?></option>
    </datalist>
  </div>








<div class="form_field">
    <input type="text" list="source" placeholder="Your location: " name="source" required>
<datalist id="source">
  <option>Kathmandu</option>
  <option>Solukhumbu</option>
  <option>Pokhara</option>
  <option>Nepalgunj</option>
  <option>Bhairahwa</option>
  <option>Biratnagar</option>
</datalist>
</div>
<div class="form_field">
<input type="text" list="activity" placeholder="Activity you prefer: " name="activities">
<datalist id="activity">
  <option>Cultural Tours</option>
  <option>Cable Car Ride</option>
  <option>Hiking</option>
  <option>Boating</option>
  <option>Mountaineering</option>
  <option>Trekking</option>
  <option>Paragliding</option>
</datalist>
</div>
<div class="form_field"> <input type="number" id="days" name="days" placeholder="Enter Duration of trip (days)" min="1" max="100" step="1" name="days"></div>
<div class="form_field"><input type="number" name = "num_tourist" placeholder="Enter Total Number of Tourists" min="1" max="100" name="num_tourist"></div>                    
<div class="form_field"><input type="numbers" placeholder="Enter Transport Budget" name="transport_budget"></div>
<div class="form_field"><input type="numbers" placeholder="Enter Lodging Budget" name="lodging_budget"></div>
<div class="form_field"><input type="numbers" placeholder="Enter Fooding Budget" name="fooding_budget"></div>
<!-- <div class="form_field"><input type="numbers" placeholder="Enter Sightseeing Budget" name="sight_budget"></div> -->
<div class="form_field"><button type="submit" value="Submit" name="prefer_submit">Submit</button></div>

</form>
</div>