<?php include('server.php');?> 
<?php 

// // session_start();
// // if(isset($_SESSION['username'])){
// //     $_SESSION['msg']="You must log in to view this page.";

// //     header("location: login.php");

// // }
// // if(isset($_GET['logout'])){

// //     session_destroy();
// //     unset($_SESSION['username']);
// //     header('location: login.php');
// }


?> 

<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="css/frontend.css">
    <head>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap"
      rel="stylesheet" />
   
        <title>Preference Result</title>
        <style>
            div{padding: 1%;margin-left:10px;font-family:arial;
            }
            </style>
    </head>
    <body>
      <?php include('nav.html') ?>
      <div>
      <?php
      
      $check_tid = $_SESSION['tidd'];

    $pid_query="SELECT preference.id from preference join user on user.id where user.id=$check_tid order by preference.id desc limit 1;";
    $presult=mysqli_query($conn,$pid_query);
    $pidres=mysqli_fetch_assoc($presult);
    $pid= $pidres['id'];


//For tourist Spots
    
    
    
    $tspot_query="SELECT city,name,touristspot.activities,entryPrice from touristspot join preference
     where touristspot.activities=preference.activities && city=city_preferred && preference.id=$pid;";
     $tresult=mysqli_query($conn,$tspot_query);
     
    
     $tspot_query2="SELECT city from touristspot join preference
         where  city=city_preferred && preference.id=$pid limit 1;";
         $tresult2=mysqli_query($conn,$tspot_query2);
         $tspot2=mysqli_fetch_assoc($tresult2);
         
         $tspot_query3="SELECT touristspot.activities as activities from touristspot join preference
         where  touristspot.activities=preference.activities && preference.id=$pid;";
         $tresult3=mysqli_query($conn,$tspot_query3);
         $tspot3=mysqli_fetch_assoc($tresult3);

         /* $tspot_query4="SELECT name from touristspot join preference
         where  activities=activity_pref && pid=$pid && city=city_pref;";
         $tresult4=mysqli_query($conn,$tspot_query4);
         
           $tspot4=mysqli_fetch_assoc($tresult4);*/
         
       
     
           
        
        
        //....contd Touristspot

        $resultCheck=mysqli_num_rows($tresult); 
     
     if($resultCheck>0){
         echo "<h3><u>"."Our Tourist Spot recommendation for you"."</u></h3><br><br>";
         while( $tspot=mysqli_fetch_assoc($tresult)){
             echo "Tourist Spot:   ". $tspot['name']."<br>";
             echo "Entry Price:    ".$tspot['entryPrice']."<br>";
            
             echo "City:   ". $tspot['city']."<br>";
             echo "Activity:    ". $tspot['activities']."<br><br>";
            
           
          
           
            }
            echo "<br><br>";
        }
        
            else{
            
         echo "Oopsss!!!....  ".   $tspot3['activities']." is not available in ". $tspot2['city']." currently"."<br> <br>"."Here are some spots  where ".  $tspot3['activities']." is available . "."<br> <br>";

         $tspot_query1="SELECT city,name,touristspot.activities as activities,entryPrice from touristspot join preference  where  touristspot.activities=preference.activities && preference.id=$pid /*&& siteseeing_budget+50>=entryPrice*num_of_tourists*/;";
         $tresult1=mysqli_query($conn,$tspot_query1);
         
         while($tspot1=mysqli_fetch_assoc($tresult1)){
         echo  "Tourist Spot:   ".$tspot1['name']."<br>";
        echo "Entry Price:    ".$tspot1['entryPrice']."<br>";
         echo "City:   ".$tspot1['city']."<br>";
         echo "Activity:    ".$tspot1['activities']."<br><br>";
         
    
       }
         echo "<br><br>";

     }


     //For SiteSeeing
         
     /*
     
          $eprice_query="SELECT entryPrice,name from touristspot join preference where pid=$pid && entryPrice*num_of_tourists<=siteseeing_budget+100 && city=city_pref && name=$name ;";
          $epresult=mysqli_query($conn,$eprice_query);
          
          
          $resultCheck=mysqli_num_rows($epresult); 
          if($resultCheck>0){
              
            while( $eprice_fetch=mysqli_fetch_assoc($epresult)){
               if(  $eprice_fetch['entryPrice']==0){
                   echo "Entry to ".$tspot4['name']." is FREE!!<br><br>";
               }
               else {
                   echo "Entry Price (Rs.) :  ".$eprice_fetch['entryPrice']."<br><br>";
               }
              
              }}
     
              else{"Less sitebudget ";}
    
         
*/
         
 

     //For Hotels

    
    $hotels_query="SELECT name,city,maxCost,minCost,lodging_budget,redirect from hotels join preference where preference.id=$pid && city=city_preferred && (lodging_budget+1000>=maxCost*no_of_tourist*duration_of_trip || (lodging_budget+500>=minCost*no_of_tourist*duration_of_trip && lodging_budget+1000<=maxCost*no_of_tourist*duration_of_trip));";
    $hresult=mysqli_query($conn,$hotels_query);
     
    
     $resultCheck=mysqli_num_rows($hresult); 
     
     if($resultCheck>0){

         echo "<h3><u>"."Our Hotels recommendation for you"."</u></h3><br><br>";
         while( $hotels=mysqli_fetch_assoc($hresult)){
             echo "Hotel Name:   ". $hotels['name']."<br>";
             echo "City:   ". $hotels['city']."<br>";
             echo "Minimum Cost Per Room (Rs.):    ". $hotels['minCost']."<br>";
             echo "Maximum Cost Per Room (Rs.):    ". $hotels['maxCost']."<br>";?>
             <a href="<?php echo $hotels['redirect'];?>">Visit Site</a><br><br>
            <?php
            }
            echo "<br><br>";
        }

        else{
            echo "Oopss!!!.... There are no Hotels available in  ".$tspot2['city']. " within your lodging budget. <br><br>";
        }



 //For Restaurants

   $restquery="SELECT name,city,maxCost,minCost,foodingBudget,redirect from restaurants join preference where preference.id=$pid && city=city_preferred && (foodingBudget+500>=maxCost*no_of_tourist*duration_of_trip || (foodingBudget+500>=minCost*no_of_tourist*duration_of_trip && foodingBudget+500<=maxCost*no_of_tourist*duration_of_trip));";
   $rresult=mysqli_query($conn,$restquery);
     
    
     $resultCheck=mysqli_num_rows($rresult); 
     
     if($resultCheck>0){

         echo "<h3><u>"."Our Restaurants recommendation for you"."</u></h3><br><br>";
         while( $restaurants=mysqli_fetch_assoc($rresult)){
             echo "Restaurant Name:   ". $restaurants['name']."<br>";
             echo "City:   ". $restaurants['city']."<br>";
             echo "Minimum Cost Per Plate (Rs.):    ". $restaurants['minCost']."<br>";
             echo "Maximum Cost Per Plate (Rs.):    ". $restaurants['maxCost']."<br>";?>
            <a href="<?php echo $restaurants['redirect'];?>">Visit Site</a><br><br>
            <?php
            }
            echo "<br><br>";
        }

        else{
            echo "Oopss!!!.... There are no Restaurants available in  ".$tspot2['city']. " within your fooding budget. <br><br>";
        }




         //For Transportation
         
         
         
         $sourcee_query="SELECT Source from transport join preference where preference.id=$pid && Source=current_location && Destination=city_preferred limit 1;";
         $sourcee_result=mysqli_query($conn,$sourcee_query);
         $sourcee_fetch=mysqli_fetch_assoc($sourcee_result);
       
     
     
           
         $trans_query="SELECT Means, maxCost,minCost,Source,Destination,transport_budget,redirect from transport join preference where preference.id=$pid && Destination=city_preferred && Source=current_location && Means!='Car' && (transport_budget+1000>=maxCost*no_of_tourist || (transport_budget+1000>=minCost*no_of_tourist && transport_budget+1000<=maxCost*no_of_tourist));";
     $trans_result=mysqli_query($conn,$trans_query);
     
    
     $resultCheck=mysqli_num_rows($trans_result); 
     
     if($resultCheck>0){

         echo "<h3><u>"."Our Travel recommendation for you"."</u></h3><br><br>";
         while( $transport=mysqli_fetch_assoc($trans_result)){
            
             echo "Means:   ". $transport['Means']."<br>";
             echo "From:   ". $transport['Source']."<br>";
             echo "To:   ". $transport['Destination']."<br>";
             echo "Minimum Cost Per Seat (Rs.):    ". $transport['minCost']."<br>";
             echo "Maximum Cost Per Seat (Rs.):    ". $transport['maxCost']."<br>";?>
             <a href="<?php echo $transport['redirect'];?>">Visit Site</a><br><br>
             <?php
          
            
            }
        }
        else{
            echo "Oopss!!!.... There is no travel service to ".$tspot2['city']." from ".$sourcee_fetch['Source']." currrently under your travel budget.<br><br> ";
        }
         
         
            $trans_query1="SELECT Means, redirect,maxCost,minCost,Source,Destination,transport_budget from transport 
            join preference where preference.id=$pid && Destination=city_preferred
             && Source=current_location && Means='Car' && (transport_budget+1000>=maxCost
              || (transport_budget+1000>=minCost && transport_budget+1000<=maxCost));";
          $trans_result1=mysqli_query($conn,$trans_query1);
     
    
          $resultCheck1=mysqli_num_rows($trans_result1); 
          if($resultCheck1>0){

           
            while( $transport=mysqli_fetch_assoc($trans_result1)){
                echo "Means:   ". $transport['Means']."<br>";
                echo "From:   ". $transport['Source']."<br>";
                echo "To:   ". $transport['Destination']."<br>";
                echo "Minimum Cost Per Seat (Rs.):    ". $transport['minCost']."<br>";
                echo "Maximum Cost Per Seat (Rs.):    ". $transport['maxCost']."<br>";?>
                <a href="<?php echo $transport['redirect'];?>">Visit Site</a><br><br>
                <?php             
               
               }
           }
  
            ?>
</div> 
    </body>
</html>

