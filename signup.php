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
$name = mysqli_real_escape_string($conn, $_POST['name']);
$email = mysqli_real_escape_string($conn, $_POST['email']);
$building = mysqli_real_escape_string($conn, $_POST['building']);
$password = mysqli_real_escape_string($conn, $_POST['password']);

// SQL query to insert data into the admins table
$sql = "INSERT INTO admins (username, password, email) VALUES ('$name', '$password', '$email')";

// Execute the query
if ($conn->query($sql) === TRUE) {
    // Get the admin_id of the newly inserted record
    $admin_id = $conn->insert_id;

    // SQL query to insert data into the building table
    $sql_building = "INSERT INTO building (building_name, building_owner_name, admin_id) VALUES ('$building', '$name', $admin_id)";

    // Execute the building table query
    if ($conn->query($sql_building) === TRUE) {
        echo json_encode(['status' => 'success']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Error inserting into building table: ' . $conn->error]);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Error inserting into admins table: ' . $conn->error]);
}

// Close the database connection
$conn->close();
?>
