<?php
require_once('../config/db.php');
header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"));

if (empty($data->company_name) || empty($data->contact_person) || empty($data->email)) {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Required fields missing"]);
    exit;
}

$company = $conn->real_escape_string($data->company_name);
$person = $conn->real_escape_string($data->contact_person);
$email = $conn->real_escape_string($data->email);
$phone = $conn->real_escape_string($data->phone ?? '');
$industry = $conn->real_escape_string($data->industry ?? '');
$booth = $conn->real_escape_string($data->booth_size ?? '');
$message = $conn->real_escape_string($data->message ?? '');

$sql = "INSERT INTO exhibitors (company_name, contact_person, email, phone, industry, booth_size, message)
        VALUES ('$company', '$person', '$email', '$phone', '$industry', '$booth', '$message')";

if ($conn->query($sql)) {
    echo json_encode(["success" => true, "message" => "Exhibitor form submitted successfully."]);
} else {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Failed to submit exhibitor form."]);
}

$conn->close();
?>
