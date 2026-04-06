<?php
require_once 'config.php';
setJsonResponse();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
    exit;
}

$email = isset($_POST['email']) ? sanitize($_POST['email']) : '';

// Validation
if (empty($email)) {
    echo json_encode(['success' => false, 'message' => 'Email is required']);
    exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(['success' => false, 'message' => 'Invalid email address']);
    exit;
}

// Load existing subscribers
$subscribers = [];
$subscriptionFile = '../data/subscribers.json';

if (file_exists($subscriptionFile)) {
    $json = file_get_contents($subscriptionFile);
    $subscribers = json_decode($json, true);
    
    // Check if email already exists
    foreach ($subscribers as $subscriber) {
        if ($subscriber['email'] === $email) {
            echo json_encode(['success' => false, 'message' => 'This email is already subscribed']);
            exit;
        }
    }
}

// Create new subscriber
$newSubscriber = [
    'id' => count($subscribers) + 1,
    'email' => $email,
    'subscribed_date' => date('Y-m-d H:i:s')
];

// Add subscriber to array
$subscribers[] = $newSubscriber;

// Save to JSON file
if (file_put_contents($subscriptionFile, json_encode($subscribers, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES))) {
    echo json_encode(['success' => true, 'message' => 'Successfully subscribed!']);
} else {
    echo json_encode(['success' => false, 'message' => 'Error processing subscription']);
}
?>
