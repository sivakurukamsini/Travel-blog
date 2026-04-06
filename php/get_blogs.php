<?php
require_once 'config.php';
setJsonResponse();

// Get all blog posts from JSON file
$blogs = [];

if (file_exists('../data/blogs.json')) {
    $json = file_get_contents('../data/blogs.json');
    $blogs = json_decode($json, true);
} else {
    // Return empty array if file doesn't exist
    echo json_encode($blogs);
    exit;
}

// Sort by date (newest first)
usort($blogs, function($a, $b) {
    return strtotime($b['created_date']) - strtotime($a['created_date']);
});

echo json_encode($blogs);
?>
