<?php
require_once 'config.php';
setJsonResponse();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
    exit;
}

$blogId = isset($_POST['blog_id']) ? intval($_POST['blog_id']) : 0;
$name = isset($_POST['name']) ? sanitize($_POST['name']) : '';
$email = isset($_POST['email']) ? sanitize($_POST['email']) : '';
$comment = isset($_POST['comment']) ? sanitize($_POST['comment']) : '';

// Validation
if ($blogId === 0 || empty($name) || empty($email) || empty($comment)) {
    echo json_encode(['success' => false, 'message' => 'All fields are required']);
    exit;
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo json_encode(['success' => false, 'message' => 'Invalid email address']);
    exit;
}

// Load existing comments
$comments = [];
if (file_exists('../data/comments.json')) {
    $json = file_get_contents('../data/comments.json');
    $comments = json_decode($json, true);
}

// Create new comment
$newComment = [
    'id' => count($comments) + 1,
    'blog_id' => $blogId,
    'name' => $name,
    'email' => $email,
    'comment' => $comment,
    'created_date' => date('Y-m-d H:i:s'),
    'status' => 'pending'
];

// Add comment to array
$comments[] = $newComment;

// Save to JSON file
if (file_put_contents('../data/comments.json', json_encode($comments, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES))) {
    echo json_encode(['success' => true, 'message' => 'Comment submitted successfully', 'comment' => $newComment]);
} else {
    echo json_encode(['success' => false, 'message' => 'Error saving comment']);
}
?>
