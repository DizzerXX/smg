<?php
header("Access-Control-Allow-Origin: *"); 
header("Access-Control-Allow-Methods: GET, POST, OPTIONS"); 
header("Access-Control-Allow-Headers: Content-Type");

// Response headers
header("Content-Type: application/json; charset=UTF-8");

require_once '../config/db.php'; 
$query = "SELECT * FROM career_talks_sessions ORDER BY day ASC, id ASC";
$result = mysqli_query($conn, $query);

$sessionsByDay = [];

while ($row = mysqli_fetch_assoc($result)) {
    $dayKey = $row['day']; 

    if (!isset($sessionsByDay[$dayKey])) {
        $sessionsByDay[$dayKey] = [
            "title" => $dayKey,
            "sessions" => []
        ];
    }

    $sessionsByDay[$dayKey]["sessions"][] = [
        "title" => $row["session_title"], 
        "slots" => [
            [
                "label" => $row["slot_label"] 
            ]
        ]
    ];
}

$response = [
    "title" => "Career Talk Session",
    "sessions" => array_values($sessionsByDay)
];

echo json_encode($response);
?>
