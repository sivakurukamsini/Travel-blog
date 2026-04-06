<?php
require_once 'config.php';
setJsonResponse();

// Get all destinations from JSON file
$destinations = [];

if (file_exists('../data/destinations.json')) {
    $json = file_get_contents('../data/destinations.json');
    $destinations = json_decode($json, true);
} else {
    // Return empty array if file doesn't exist
    echo json_encode($destinations);
    exit;
}

echo json_encode($destinations);
?>
