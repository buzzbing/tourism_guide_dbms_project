<?php

include('server.php');

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Pokhara</title>
	
  <link rel="stylesheet" href="css/frontend.css">
  <link rel="stylesheet" href="css/touristspot.css">
</head>
<body>
  <?php include('nav.html');?>
<?php
$sql ="SELECT name, description,photos FROM touristspot where city = 'Pokhara'";
$result = mysqli_query($conn,$sql);
?>
<?php
while($rows = mysqli_fetch_assoc($result)) {
  ?>
  <h1><?php echo $rows['name'];?></h1>
<div class='descript'>
  
  <img src="<?php echo $rows['photos']; ?>" style='align=left;' width=40% height=inherit>

  <p class=p_descript><?php echo $rows['description'];?></p>
</div>

<?php
}
?>
<p style="color:white;">Top Restaurants in Pokhara</p> 
<table class ="content">
<tr>
<th>Name</th>
<th>Contact No.</th>
<th>Email</th>
<th>Link</th>
</tr>
<?php
$sql ="SELECT name, description, contact, email, redirect FROM restaurants where city = 'Pokhara'";
$result = mysqli_query($conn,$sql);
?>
<?php
while($rows =mysqli_fetch_assoc($result)) {
  ?>
  <tr>
  <td><?php echo $rows['name'];?></td>
  <td><?php echo $rows['contact'];?></td>
  <td><?php echo $rows['email'];?></td>
  <td><a href="<?php echo $rows['redirect'];?>">Visit Site</a></td>
</tr>
<?php
}
?>
</table>
<p style="color:white;">Top Hotels in Pokhara</p>
<table class = "content">
<tr>
<th>Name</th>
<th>Contact No.</th>
<th>Email</th>
<th>Link</th>
</tr>
<?php
$sql ="SELECT name, contact, email, redirect FROM hotels where city = 'Pokhara'";
$result = mysqli_query($conn,$sql);
?>
<?php
while($rows = mysqli_fetch_assoc($result)) {
  ?>
  <tr>
  <td><?php echo $rows['name'];?></td>
  <td><?php echo $rows['contact'];?></td>
  <td><?php echo $rows['email'];?></td>
  
  <td><a href="<?php echo $rows['redirect'];?>">Visit Site</a></td>
</tr>
<?php
}
?>
</table>
<script>
  alert("Please Login to get Recommendations according to your Preference and Budget");
  </script>
</body>
</html>