<?php
$db_host = 'localhost'; // Server Name
$db_user = 'admin'; // Username
$db_pass = 'admin'; // Password
$db_name = 'appointments'; // Database Name

$conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
if (!$conn) {
    die ('Failed to connect to MySQL: ' . mysqli_connect_error());
}

$sql = 'SELECT * FROM data';
		
$query = mysqli_query($conn, $sql);

if (!$query) {
	die ('SQL Error: ' . mysqli_error($conn));
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Appointments</title>
</head>
<body>    
</body>
</html>