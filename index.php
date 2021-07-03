<?php 
	session_start();
	error_reporting(0);
	include('includes/config.php');	
?>

<?php 

// MY CART
if(isset($_GET['action']) && $_GET['action']=='add')
	{
		$id=intval($_GET['pid']);
		if(isset($_SESSION['cart'][$id]))
		{
			$_SESSION['cart'][$id]['quantity']++;
		}else{
			$sql_p="SELECT * FROM medicine WHERE id={$id}";
			$query_p=mysqli_query($con,$sql_p);

			if(mysqli_num_rows($query_p)!=0)
			{
				$row=mysqli_fetch_array($query_p);
				$_SESSION['cart'][$row['id']]=array("quantity" => 1, "price" => $row_p['medicinePrice']);
			}else{
				$message="Product ID is invalid";
			}
		}
		echo "<script>alert('Product has been added to the cart')</script>";
		echo "<script type='text/javascript'> document.location ='mycart.php'; </script>";
	}

?>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>E Med</title>
	<?php include('includes/links.php')?>
</head>

<body>
	<?php include('includes/header.php')?>

	<!-- Banner Start -->
	<section class="banner">
		<div class="container">
			<div class="row">
				<div class=" col-md-6 ">
					<div class="block">
						<h1 style="margin-top:50px; font-size:60px;">Upload Your Prescription And
							<span style="color:white; text-weight:bold;">Earn Money</span></h1>

						<p style="color:black;">We are providing you this opportunity to earn some money from online, if
							you have any prescription please upload it to our site and earn money.</p>

						<div class="btn-container mt-5">
							<a href="prescription.php" class="btn btn-primary">Upload Prescription <i
									class="icofont-simple-right "></i></a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- Banner End -->

	

	<!-- Shop area -->

	<!-- Featured -->
	<section class="shop">
		<div class="col-md-12 mt-100" style="text-align:center; padding:50px;">
			<h1>Featured <span style="color:#E12454">Products</span></h1>
		</div>


		<div class="col-md-12">
			<div class="container">
				<div class="row">
					<?php
						$get_product="select * from medicine where feature='yes' order by 1 DESC LIMIT 0,6 ";
						$run_products=mysqli_query($con,$get_product);
						
						while($row_product=mysqli_fetch_array($run_products)){
							
							$pro_id=$row_product['id'];
							$pro_title=$row_product['name'];
							$pro_price=$row_product['price'];
							$pro_company=$row_product['company'];
							$pro_img1=$row_product['image1'];
							$pro_avail=$row_product['product_availability'];
						?>

					<div class='col-md-4' style='margin-bottom:30px;'>
						<div class='card' style='width: 18rem; text-align:center;'>
							<?php echo "<img class='card-img-top' src='admin/images/medicines/$pro_img1'  alt='Card image cap' style='width:250px; height:220px'>"
									 ?>
							<div class='card-body'>
								<h5 class='card-title'><?php echo $pro_title?></h5>
								<p> BDT <?php echo $pro_price?> </p>
								<a href='product_details.php?pid=<?php echo $pro_id;?>' class='btn btn-primary'>More
									Details</a>

								<?php
											if($pro_avail == 'In Stock'){
												echo"<a href='index.php?page=product&action=add&pid= $pro_id' class='btn btn-primary' style='background-color:#222222'>Add To Cart</a>";
											}else{
												echo"<a href='#' class='btn btn-primary' style='background-color:white; color:red;'>Out of Stock</a>";
											}
										?>


							</div>
						</div>
					</div>

					<?php	
						}							
					?>

				</div>
			</div>
		</div>

		<!-- Featured End -->


		<!-- New Products -->
		<div class="col-md-12 mt-100" style="text-align:center; padding:50px;">
			<h1>New <span style="color:#E12454">Products</span> </h1>
		</div>

		<div class="col-md-12">
			<div class="container">
				<div class="row">
					<?php
						$get_product="select * from medicine order by 1 DESC LIMIT 0,3 ";
						$run_products=mysqli_query($con,$get_product);
						
						while($row_product=mysqli_fetch_array($run_products)){
							
							$pro_id=$row_product['id'];
							$pro_title=$row_product['name'];
							$pro_price=$row_product['price'];
							$pro_company=$row_product['company'];
							$pro_img1=$row_product['image1'];
							$pro_avail=$row_product['product_availability'];
						?>

					<div class='col-md-4' style='margin-bottom:30px;'>
						<div class='card' style='width: 18rem; text-align:center;'>
							<?php echo "<img class='card-img-top' src='admin/images/medicines/$pro_img1'  alt='Card image cap' style='width:250px; height:220px'>"
									 ?>
							<div class='card-body'>
								<h5 class='card-title'><?php echo $pro_title?></h5>
								<p> BDT <?php echo $pro_price?> </p>
								<a href='product_details.php?pid=<?php echo $pro_id;?>' class='btn btn-primary'>More
									Details</a>



								<?php
											if($pro_avail == 'In Stock'){
												echo"<a href='index.php?page=product&action=add&pid=$pro_id;' class='btn btn-primary' style='background-color:#222222'>Add To Cart</a>";
											}else{
												echo"<a href='#' class='btn btn-primary' style='background-color:white; color:red;'>Out of Stock</a>";
											}
										?>


							</div>
						</div>
					</div>

					<?php	
						}							
					?>

				</div>
			</div>
		</div>
		<!-- NEW End -->
	</section>

	<!-- Shop End -->

	<!--Scripts -->
	<?php include('includes/scripts.php')?>


</body>

</html>