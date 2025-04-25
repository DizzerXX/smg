<?php
require_once('../config/db.php');
header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"));

if (empty($data->name) || empty($data->email)) {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Required fields missing"]);
    exit;
}

$name = $conn->real_escape_string($data->name);
$email = $conn->real_escape_string($data->email);
$job_title = $conn->real_escape_string($data->job_title ?? '');
$resume = $conn->real_escape_string($data->resume ?? '');

$sql = "INSERT INTO job_matching (name, email, job_title, resume)
        VALUES ('$name', '$email', '$job_title', '$resume')";

if ($conn->query($sql)) {
    echo json_encode(["success" => true, "message" => "Job matching form submitted successfully."]);
} else {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Failed to submit job matching form."]);
}

$conn->close();
?>
