<?php
require_once 'config.php';
setJsonResponse();

$blogId = isset($_GET['blog_id']) ? intval($_GET['blog_id']) : 0;

if ($blogId === 0) {
    echo json_encode([]);
    exit;
}

// Get comments from JSON file
$comments = [];

if (file_exists('../data/comments.json')) {
    $json = file_get_contents('../data/comments.json');
    $allComments = json_decode($json, true);
    
    // Filter comments by blog_id
    foreach ($allComments as $comment) {
        if ($comment['blog_id'] === $blogId) {
            $comments[] = $comment;
        }
    }
}

// Sort by date (newest first)
usort($comments, function($a, $b) {
    return strtotime($b['created_date']) - strtotime($a['created_date']);
});

echo json_encode($comments);
?>
