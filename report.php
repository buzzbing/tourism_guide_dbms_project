<?php include('server.php')?>
<!DOCTYPE html>
<html>
    <head>
        <title>Report</title>
        <link rel="stylesheet" href="css/frontend.css" />
      
        <style>
          
          .div{margin:2%;}
          table, td, th {
    border: 1px solid black;
    padding:5px;
  }
  h1{
    text-align: center;
}  
  table {
    width: 80%;
    border-collapse: collapse;
    align-content: center;
    margin-left:10%;
   
  }
          </style>
       
    </head>
    <body>
<?php include('nav.html');?>
   <div>
      <h1>Report</h1>
   <br><br><br>
       
        <table class="report_table">  
        <tr>
          <th>Required Specifications</th>
          <th>Values</th>
</tr>
        <?php
            //Query for most preferred city
            $query1 = "SELECT city_preferred from city_count order by countnum desc limit 1;";

            $result1 = mysqli_query($conn,$query1);
            $res1 = mysqli_fetch_assoc($result1);
            ?>
            <tr>
            <td><b>Most preferred City: </b></td>
            <td><?php echo $res1['city_preferred']; ?></td>
            </tr>
        
          
            <?php
            //Query for average transport budget
            $query2="SELECT AVG(avg_trans_budget) as avtrans FROM avg_budget;";
            $result2 = mysqli_query($conn,$query2);
            $res2 = mysqli_fetch_assoc($result2);
            ?><tr>
            <td><b>Average Transport Budget: NRs </b></td>
            <td><?php echo number_format($res2['avtrans'],2); ?></td>
            </tr>
           
          
            <?php
            //Query for average lodging budget
            $query2="SELECT AVG(avg_lodge_budget) as avlodge FROM avg_budget;";
            $result2 = mysqli_query($conn,$query2);
            $res2 = mysqli_fetch_assoc($result2);
            ?><tr>
            <td><b>Average Lodging Budget: NRs </b></td>
            <td><?php echo number_format($res2['avlodge'],2); ?></td>
            </tr>



            <?php
            //Query for average fooding budget
            $query2="SELECT AVG(avg_food_budget) as avfood FROM avg_budget;";
            $result2 = mysqli_query($conn,$query2);
            $res2 = mysqli_fetch_assoc($result2);
            ?><tr>
            <td><b>Average Fooding Budget: NRs </b></td>
            <td><?php echo number_format($res2['avfood'],2); ?></td>
            </tr>
      
            <?php
            //Query for most preferred activity
            $query6="SELECT activities,COUNT(activities) as countnum 
                    from preference GROUP by activities 
                    having countnum>=all(SELECT COUNT(activities) FROM preference GROUP BY activities);";
            $result6 = mysqli_query($conn,$query6);
            $res6 = mysqli_fetch_assoc($result6);
            ?>
            <tr>
           <td><b>Most preferred Activity: </b></td>
           <td><?php echo $res6['activities']; ?></td>
</tr>
           
            
   <?php
            //Average total budget of tourist 
            $query9="SELECT AVG(avg_lodge_budget+avg_trans_budget+avg_site_budget+avg_food_budget) as avgbgt from avg_budget;";

            
            $result9 = mysqli_query($conn,$query9);
            $res9 = mysqli_fetch_assoc($result9);
            ?>

            <tr>
              <td><b>Average Total Budget of Tourists: </b></td>
              <td><?php echo number_format($res9['avgbgt'],2); ?></td>
</tr>
            
           <?php

             

                  

              //Average duration of trip
              $query7="SELECT AVG(duration_of_trip) as avgduration from preference;";

              $result7 = mysqli_query($conn,$query7);
              $res7 = mysqli_fetch_assoc($result7);
              ?>
              <tr>
              <td><b>Average days of Vacation:  </b></td>
              <td><?php echo  number_format($res7['avgduration'],0)." days"; ?></td>
</tr>
             
</table>
<br><br><br>
            <?php
            //Query for average transport budget citywise
            $query3="SELECT * from transport_pref";
            $result3 = mysqli_query($conn,$query3);            ?>
            <p style="margin-left:2%;"><b>Average Transport Budget Per City: NRs </b></p>
           <br>
            <table>
                <tr>
                  <th>Source</th>
                  <th>Destination</th>
                  <th>Transport Budget</th>
            </tr>
                
                <?php while($res3 = mysqli_fetch_assoc($result3)){?>
                  <tr>
                  <td><?php echo $res3['current_location']."  ";?></td>
                  <td><?php echo $res3['city_preferred']."  ";?></td>
            
                  <td><?php echo "  NRs ".number_format($res3['avg_trans'],2);?><?php } ?></td>
                </tr>
            </table>
                <br><br>

            

            
            <?php
            //Query for average lodging budget citywise
            $query5="SELECT city_preferred, avg_lodge_budget as avlodge FROM avg_budget;";
            $result5 = mysqli_query($conn,$query5);?>
            <p style="margin-left:2%;"><b>Average Lodging Budget in Each City:  </b></p>
            <br>
              <table>
                <tr>
                  <th>City</th>
                  <th>Lodging Budget</th>
            </tr>
                
                <?php while($res5 = mysqli_fetch_assoc($result5)){?>
                  <tr>
                  <td><?php echo $res5['city_preferred']." : ";?></td>
                  <td><?php echo "  NRs ".number_format($res5['avlodge'],2);?><?php } ?></td>
                </tr>
            </table>
            <br><br>

            <?php
            //Query for average lodging cost citywise
            $query5="SELECT * FROM hotels_cost";
            $result5 = mysqli_query($conn,$query5);?>
            <p style="margin-left:2%;"><b>Average Lodging Cost in Each City:  </b></p>
            <br>
              <table>
                <tr>
                  <th>City</th>
                  <th>Min. Cost Per Room</th>
                  <th>Max. Cost Per Room</th>
            </tr>
                
                <?php while($res5 = mysqli_fetch_assoc($result5)){?>
                  <tr>
                  <td><?php echo $res5['city'];?></td>
                  <td><?php echo "  NRs ".number_format($res5['minCost'],2);?></td>
                  <td><?php echo "  NRs ".number_format($res5['maxCost'],2);?><?php } ?></td>
                </tr>
            </table>
            <br>
          <br><br>
            
            <?php
            //Query for average fooding budget citywise
            $query5="SELECT city_preferred, avg_food_budget as avfood FROM avg_budget;";
            $result5 = mysqli_query($conn,$query5);?>
            <p style="margin-left:2%;"><b>Average Fooding Budget in Each City:  </b></p>
            <br>
              <table>
                <tr>
                  <th>City</th>
                  <th>Fooding Budget</th>
            </tr>
                
                <?php while($res5 = mysqli_fetch_assoc($result5)){?>
                  <tr>
                  <td><?php echo $res5['city_preferred']." : ";?></td>
                  <td><?php echo "  NRs ".number_format($res5['avfood'],2);?><?php } ?></td>
                </tr>
            </table>
            <br><br><br>

            <?php
            //Query for average fooding cost citywise
            $query6="SELECT * FROM restaurant_cost";
            $result6 = mysqli_query($conn,$query6);?>
            <p style="margin-left:2%;"><b>Average Fooding Cost in Each City:  </b></p>
            <br>
              <table>
                <tr>
                  <th>City</th>
                  <th>Min. Cost Per Meal</th>
                  <th>Max. Cost Per Meal</th>
            </tr>
                
                <?php while($res6 = mysqli_fetch_assoc($result6)){?>
                  <tr>
                  <td><?php echo $res6['city'];?></td>
                  <td><?php echo "  NRs ".number_format($res6['minCost'],2);?></td>
                  <td><?php echo "  NRs ".number_format($res6['maxCost'],2);?><?php } ?></td>
                </tr>
            </table>
            <br>
<br>
           
            
            <?php
            
            //Average number of people travelling to a city
            $query8="SELECT city_preferred, AVG(duration_of_trip) avgd from preference GROUP by city_preferred;";

            $result8 = mysqli_query($conn,$query8);?>
            <p style="margin-left:2%;"><b>Average Trip Duration in Each City:  </b></p>
            <br>
              <table>
                <tr>
                  <th>City</th>
                  <th>Trip Duration</th>
            </tr>
                
                <?php while($res8 = mysqli_fetch_assoc($result8)){?>
                  <tr>
                  <td><?php echo $res8['city_preferred']." : ";?></td>
                  <td><?php echo number_format($res8['avgd'],0)." days";?><?php } ?></td>
                </tr>
            </table>
            <br>
            <br>
            
            <?php
            //Average total budget of tourist citywise
            $query10="SELECT city_preferred, AVG(lodging_budget+siteseeing_budget+transport_budget) as avgtotal from preference GROUP by city_preferred;";

            $result10 = mysqli_query($conn,$query10);?>
            <p style="margin-left:2%;"><b>Average Total Budget of Tourist in Each City:  </b></p>
            <br>
              <table>
                <tr>
                  <th>City</th>
                  <th>Total Budget</th>
            </tr>
                
                <?php while($res10 = mysqli_fetch_assoc($result10)){?>
                  <tr>
                  <td><?php echo $res10['city_preferred']." : ";?></td>
                  <td><?php echo "  NRs ".number_format($res10['avgtotal'],2);?><?php } ?></td>
                </tr>
            </table>
            <br>
           <br>
     
      </div>

    </body>