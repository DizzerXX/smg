<?php
require_once('../config/db.php');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(204);
    exit();
}

$data = json_decode(file_get_contents("php://input"), true);

$name = trim($data["name"] ?? "");
$email = trim($data["email"] ?? "");
$phone = trim($data["phone"] ?? "");
$session = trim($data["session"] ?? "");

if (empty($name) || empty($email) || empty($phone) || empty($session)) {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "All fields are required."]);
    exit();
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Invalid email format."]);
    exit();
}

$stmt = $conn->prepare("INSERT INTO visitor_registrations (name, email, phone, session) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $name, $email, $phone, $session);

if ($stmt->execute()) {
    http_response_code(200);
    echo json_encode(["success" => true, "message" => "Registration successful."]);
} else {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Failed to register."]);
}

$stmt->close();
$conn->close();
?>
