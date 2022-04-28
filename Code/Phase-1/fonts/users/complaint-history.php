<?php 
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['login'])==0)
  { 
header('location:index.php');
}
else{
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>BTS | Bug History</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <link href="assets/css/table-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body  style="background-size: cover; background-image: url('userimages/rob.jpg'); Padding: 300px;" >>

  <section id="container" >
<?php include("includes/header.php");?>
<?php include("includes/sidebar.php");?>

      <section id="main-content">
          <section class="wrapper">
          	<h2  style="background-color:black;color:#ff4500;" ><i class="fa fa-angle-right"></i> Your Bug Hstory</h2>
		  		<div class="row mt">
			  		<div class="col-lg-12">
                      <div class="content-panel">
                          <section id="unseen">
                            <table class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr style="text-align: center">
                                  <th style="text-align: center">Bug Number</th>
                                  <th style="text-align: center">Creation Date</th>
                                  <th style="text-align: center">Last Updation date</th>
                                  <th style="text-align: center">Status</th>
                                  <th style="text-align: center">Action</th>
                                  
                              </tr>
                              </thead>
                              <tbody>
  <?php


   $query=mysqli_query($con,"select * from tblcomplaints where userId='".$_SESSION['id']."'");
while($row=mysqli_fetch_array($query))
{
  ?>
                              <tr>
                                  <td align="center"><?php echo htmlentities($row['complaintNumber']);?></td>
                                  <td align="center"><?php echo htmlentities($row['regDate']);?></td>
                                 <td align="center"><?php echo  htmlentities($row['lastUpdationDate']);

                                 ?></td>
                                  <td align="center"><?php 
                                    $status=$row['status'];
                                    if($status=="" or $status=="NULL")
                                    { ?>
                                      <button type="button" class="btn btn-theme04">To Do</button>
                                   <?php }
 if($status=="in process"){ ?>
<button type="button" class="btn btn-warning">In Process</button>
<?php }
if($status=="closed") {
?>
<button type="button" class="btn btn-success">Closed</button>
<?php } ?>
                                   <td align="center">
                                   <a href="complaint-details.php?cid=<?php echo htmlentities($row['complaintNumber']);?>">
<button type="button" class="btn btn-primary">View Details</button></a>
                                   </td>
                                </tr>
                              <?php } ?>
                            
                              </tbody>
                          </table>
                          </section>
                  </div><!-- /content-panel -->
               </div><!-- /col-lg-4 -->			
		  	</div><!-- /row -->
		  	
		  	

		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
<?php include("includes/footer.php");?>
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    

  </body>
</html>
<?php } ?>
