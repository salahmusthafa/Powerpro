<?php
// get_building_info.php

// Database connection
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "PowerproV1";

$conn = new mysqli($servername, $username, $password, $dbname);

$username = $_GET['username'];
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to get building information
$sql = "SELECT
            building.building_name,
            building.building_owner_name,
            building.building_consumption
        FROM
            building
        JOIN
            admins ON building.admin_id = admins.admin_id
        WHERE
            admins.username = '$username'";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Fetch building information
    $buildingInfo = $result->fetch_assoc();

    // Return data as JSON
    header('Content-Type: application/json');
    echo json_encode($buildingInfo);
} else {
    // No data found
    echo json_encode(array("error" => "Building information not found"));
}

$conn->close();
?>
