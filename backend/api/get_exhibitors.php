<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

require_once '../config/db.php'; 

$query = "SELECT id, name, location, logo FROM exhibitors ORDER BY id ASC";
$result = mysqli_query($conn, $query);

$exhibitors = [];

while ($row = mysqli_fetch_assoc($result)) {
    $exhibitors[] = [
        "id" => $row["id"],
        "name" => $row["name"],
        "location" => $row["location"],
        "logo" => $row["logo"] ? "@/assets/logos/" . $row["logo"] : null
    ];
}

echo json_encode($exhibitors);
?>
