<?php
$apiKey = 'your-api-key';
function getChatbotResponse($userInput)
{
    global $apiKey;

    $apiUrl = 'https://api.openai.com/v1/moderations';

    $data = [
        "model" => "omni-moderation-2024-09-26",
        "input" => $userInput
    ];

    $ch = curl_init($apiUrl);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Content-Type: application/json',
        'Authorization: Bearer ' . $apiKey
    ]);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

    $response = curl_exec($ch);

    if (curl_errno($ch)) {
        $error_message = curl_error($ch);
        echo json_encode(["response" => "Error: " . $error_message]);
        curl_close($ch);
        exit;
    }

    $responseData = json_decode($response, true);

    if (!$responseData) {
        echo json_encode(["response" => "Invalid response from OpenAI: " . $response]);
        curl_close($ch);
        exit;
    }

    if (isset($responseData['results'][0]['flagged']) && $responseData['results'][0]['flagged'] === true) {
        return "This message contains inappropriate content.";
    } else {
        return "Message is safe to send!";
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);
    $userInput = $data['message'] ?? '';

    if (!empty($userInput)) {
        $botResponse = getChatbotResponse($userInput);
        echo json_encode(['response' => $botResponse]);
    } else {
        echo json_encode(['response' => 'Please provide a message to the bot.']);
    }
}
