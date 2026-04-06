<?php
require_once 'config.php';
setJsonResponse();

$blogId = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($blogId === 0) {
    echo json_encode(['success' => false, 'message' => 'Invalid blog ID']);
    exit;
}

// Get blog from JSON file
if (file_exists('../data/blogs.json')) {
    $json = file_get_contents('../data/blogs.json');
    $blogs = json_decode($json, true);
    
    foreach ($blogs as $blog) {
        if ($blog['id'] === $blogId) {
            echo json_encode($blog);
            exit;
        }
    }
}

echo json_encode(['success' => false, 'message' => 'Blog not found']);
?>
