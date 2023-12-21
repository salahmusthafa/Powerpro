<?php
// Include your database connection logic here

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "PowerproV1";

$conn = new mysqli($servername, $username, $password, $dbname);
// Assuming you have a valid database connection in $conn

// Your SQL query to fetch building consumption data (modify as needed)
$sql = "SELECT building_name, building_consumption FROM building";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $buildingData = array();
    
    // Fetch data from the result set
    while ($row = $result->fetch_assoc()) {
        $buildingData[] = $row;
    }

    // Output the data as JSON
    header('Content-Type: application/json');
    echo json_encode($buildingData);
} else {
    // Handle the case when no data is retrieved
    echo json_encode(array('error' => 'No data found'));
}

// Close the database connection
$conn->close();
?>
