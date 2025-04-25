<?php
require_once("../config/db.php");
header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"));

if (empty($data->name) || empty($data->email) || empty($data->session_name)) {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Required fields missing"]);
    exit;
}

$name = $conn->real_escape_string($data->name);
$email = $conn->real_escape_string($data->email);
$session = $conn->real_escape_string($data->session_name);

$sql = "INSERT INTO career_talk (name, email, session_name)
        VALUES ('$name', '$email', '$session')";

if ($conn->query($sql)) {
    echo json_encode(["success" => true, "message" => "Career talk registered successfully"]);
} else {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Server error while registering."]);
}

$conn->close();
