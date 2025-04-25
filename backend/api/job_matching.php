<?php
require_once("../config/db.php");
header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"));

if (empty($data->name) || empty($data->email) || empty($data->job_interest)) {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "All fields are required"]);
    exit;
}

$name = $conn->real_escape_string($data->name);
$email = $conn->real_escape_string($data->email);
$interest = $conn->real_escape_string($data->job_interest);

$sql = "INSERT INTO job_matching (name, email, job_interest)
        VALUES ('$name', '$email', '$interest')";

if ($conn->query($sql)) {
    echo json_encode(["success" => true, "message" => "Job interest submitted"]);
} else {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Error submitting job interest"]);
}

$conn->close();
