<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "PowerproV1";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle login
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $data = json_decode(file_get_contents("php://input"));

    // Get username and password from the request
    $username = $data->username;
    $password = $data->password;

    // Perform validation and hashing as needed
    // For simplicity, we'll do basic validation
    if (!empty($username) && !empty($password)) {
        // Query to check user credentials
        $sql = "SELECT * FROM admins WHERE username = '$username' AND password = '$password'";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // User authenticated successfully
            $response = array("status" => "success", "message" => "Login successful", "username" => $username);
            echo json_encode($response);

        } else {
            // Invalid credentials
            $response = array("status" => "error", "message" => "Invalid credentials");
            echo json_encode($response);
        }
    } else {
        // Invalid input
        $response = array("status" => "error", "message" => "Invalid input");
        echo json_encode($response);
    }
} else {
    // Invalid request method
    $response = array("status" => "error", "message" => "Invalid request method");
    echo json_encode($response);
}

$conn->close();
?>
