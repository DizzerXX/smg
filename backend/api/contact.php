<?php
require_once("../config/db.php");
header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"));

if (empty($data->name) || empty($data->email) || empty($data->message)) {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Name, email, and message are required"]);
    exit;
}

$name = $conn->real_escape_string($data->name);
$email = $conn->real_escape_string($data->email);
$subject = $conn->real_escape_string($data->subject ?? '');
$message = $conn->real_escape_string($data->message);

$sql = "INSERT INTO contact_messages (name, email, subject, message)
        VALUES ('$name', '$email', '$subject', '$message')";

if ($conn->query($sql)) {
    echo json_encode(["success" => true, "message" => "Message submitted successfully"]);
} else {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Failed to submit message"]);
}

$conn->close();
