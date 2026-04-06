<?php
require_once 'config.php';
setJsonResponse();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
    exit;
}

$name = isset($_POST['name']) ? sanitize($_POST['name']) : '';
$email = isset($_POST['email']) ? sanitize($_POST['email']) : '';
$subject = isset($_POST['subject']) ? sanitize($_POST['subject']) : '';
$message = isset($_POST['message']) ? sanitize($_POST['message']) : '';

// Validation
if (empty($name) || empty($email) || empty($subject) || empty($message)) {
    echo json_encode(['success' => false, 'message' => 'All fields are required']);
    exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(['success' => false, 'message' => 'Invalid email address']);
    exit;
}

// Email to admin
$to = 'admin@travelsrilanka.com';
$emailSubject = 'New Contact Form Submission: ' . $subject;
$headers = "From: " . $email . "\r\n";
$headers .= "Reply-To: " . $email . "\r\n";
$emailBody = "Name: " . $name . "\r\n";
$emailBody .= "Email: " . $email . "\r\n";
$emailBody .= "Subject: " . $subject . "\r\n";
$emailBody .= "Message:\r\n" . $message;

// For local development, save to file instead
$contactsFile = '../data/contacts.json';
$contacts = [];

if (file_exists($contactsFile)) {
    $json = file_get_contents($contactsFile);
    $contacts = json_decode($json, true);
}

$newContact = [
    'id' => count($contacts) + 1,
    'name' => $name,
    'email' => $email,
    'subject' => $subject,
    'message' => $message,
    'submitted_date' => date('Y-m-d H:i:s'),
    'status' => 'unread'
];

$contacts[] = $newContact;

// Save contact to JSON file
if (file_put_contents($contactsFile, json_encode($contacts, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES))) {
    // Try sending email (will fail in local environment, that's okay)
    @mail($to, $emailSubject, $emailBody, $headers);
    
    echo json_encode(['success' => true, 'message' => 'Message sent successfully! We will get back to you soon.']);
} else {
    echo json_encode(['success' => false, 'message' => 'Error processing your request']);
}
?>
