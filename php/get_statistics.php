<?php
require_once 'config.php';
setJsonResponse();

// Count blogs
$blogCount = 0;
if (file_exists('../data/blogs.json')) {
    $json = file_get_contents('../data/blogs.json');
    $blogs = json_decode($json, true);
    $blogCount = count($blogs);
}

// Count destinations
$destinationCount = 0;
if (file_exists('../data/destinations.json')) {
    $json = file_get_contents('../data/destinations.json');
    $destinations = json_decode($json, true);
    $destinationCount = count($destinations);
}

// Count comments
$commentCount = 0;
if (file_exists('../data/comments.json')) {
    $json = file_get_contents('../data/comments.json');
    $comments = json_decode($json, true);
    $commentCount = count($comments);
}

echo json_encode([
    'blog_count' => $blogCount,
    'destination_count' => $destinationCount,
    'comment_count' => $commentCount
]);
?>
