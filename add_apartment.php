<?php

// Create a database connection

// Database connection
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "PowerproV1";
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data
$apartmentOwner = mysqli_real_escape_string($conn, $_POST['apartmentOwner']);
$apartmentNumber = mysqli_real_escape_string($conn, $_POST['apartmentNumber']);
$buildingName = mysqli_real_escape_string($conn, $_POST['buildingName']);

// SQL query to insert data into the building table
$sql = "INSERT INTO apartment (apartment_owner_name, apartment_number, building_id)
        VALUES (
            '$apartmentOwner',
            '$apartmentNumber',
            (SELECT building_id FROM building WHERE building_name = '$buildingName')
        )";
        
// Execute the query
if ($conn->query($sql) === TRUE) {
    echo json_encode(['status' => 'success']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Error inserting into building table: ' . $conn->error]);
}

// Close the database connection
$conn->close();
?>
