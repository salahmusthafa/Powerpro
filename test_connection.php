<?php
// Include the database connection file
require_once('db.php');

// Perform a test query
$query = "SELECT * FROM rooms LIMIT 1";
$result = $conn->query($query);

// Check if the query was successful
if ($result) {
    // Fetch the result
    $row = $result->fetch_assoc();

    // Display the result (you can customize this part based on your database structure)
    echo '<pre>';
    print_r($row);
    echo '</pre>';
} else {
    // Display an error message if the query fails
    echo 'Error: ' . $conn->error;
}

// Close the database connection
$conn->close();
?>
