<?php
// Your database connection code here
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "PowerproV1";

$conn = new mysqli($servername, $username, $password, $dbname);

// Assume $ownerUsername contains the username of the logged-in owner
$ownerUsername = "owner_username"; // Replace with actual username

$sql = "SELECT
            b.building_id,
            b.building_name,
            SUM(a.apartment_consumption) AS total_building_consumption
        FROM
            building b
        JOIN
            apartment a ON b.building_id = a.building_id
        JOIN
            admins ad ON b.admin_id = ad.admin_id
        WHERE
            ad.username = '$ownerUsername'
        GROUP BY
            b.building_id, b.building_name";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Output data for each row
    while ($row = $result->fetch_assoc()) {
        echo "Building ID: " . $row["building_id"] . "<br>";
        echo "Building Name: " . $row["building_name"] . "<br>";
        echo "Total Consumption: " . $row["total_building_consumption"] . "<br>";
        echo "------------------------<br>";
    }
} else {
    echo "No buildings found for the owner.";
}

// Close the database connection
$conn->close();
?>
