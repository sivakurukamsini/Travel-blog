# Travel Sri Lanka Blog - API Documentation

This document outlines all AJAX endpoints and their usage.

## Base URL
```
http://localhost/travel-blog/php/
```

---

## Blogs API

### Get All Blogs
**Endpoint**: `GET /get_blogs.php`

**Description**: Retrieve all published blog posts

**Response**:
```json
[
    {
        "id": 1,
        "title": "Top 10 Beaches in Sri Lanka",
        "excerpt": "Discover...",
        "content": "<h3>Mirissa Beach</h3>...",
        "image": "images/blog1.jpg",
        "author": "Sarah Johnson",
        "category": "Beaches",
        "created_date": "2026-04-01",
        "tags": ["beach", "travel"]
    }
]
```

**jQuery Example**:
```javascript
$.ajax({
    url: '../php/get_blogs.php',
    type: 'GET',
    dataType: 'json',
    success: function(blogs) {
        console.log(blogs);
    }
});
```

---

### Get Single Blog
**Endpoint**: `GET /get_blog_details.php?id=1`

**Parameters**:
- `id` (required, integer): Blog post ID

**Response**:
```json
{
    "id": 1,
    "title": "Top 10 Beaches in Sri Lanka",
    "excerpt": "Discover...",
    "content": "Full HTML content...",
    "image": "images/blog1.jpg",
    "author": "Sarah Johnson",
    "category": "Beaches",
    "created_date": "2026-04-01",
    "tags": ["beach", "travel"]
}
```

**jQuery Example**:
```javascript
$.ajax({
    url: '../php/get_blog_details.php',
    type: 'GET',
    data: { id: 1 },
    dataType: 'json',
    success: function(blog) {
        console.log(blog);
    }
});
```

---

## Destinations API

### Get All Destinations
**Endpoint**: `GET /get_destinations.php`

**Response**:
```json
[
    {
        "id": 1,
        "name": "Kandy",
        "location": "Central Province",
        "description": "Home to the sacred Temple...",
        "image": "images/destination1.jpg"
    }
]
```

**jQuery Example**:
```javascript
$.ajax({
    url: '../php/get_destinations.php',
    type: 'GET',
    dataType: 'json',
    success: function(destinations) {
        console.log(destinations);
    }
});
```

---

## Comments API

### Get Comments for a Blog
**Endpoint**: `GET /get_comments.php?blog_id=1`

**Parameters**:
- `blog_id` (required, integer): Blog post ID

**Response**:
```json
[
    {
        "id": 1,
        "blog_id": 1,
        "name": "John Traveler",
        "email": "john@example.com",
        "comment": "Amazing article!",
        "created_date": "2026-04-02 09:30:00",
        "status": "approved"
    }
]
```

**jQuery Example**:
```javascript
$.ajax({
    url: '../php/get_comments.php',
    type: 'GET',
    data: { blog_id: 1 },
    dataType: 'json',
    success: function(comments) {
        console.log(comments);
    }
});
```

---

### Save New Comment
**Endpoint**: `POST /save_comment.php`

**Parameters** (POST):
- `blog_id` (required, integer)
- `name` (required, string)
- `email` (required, string, valid email)
- `comment` (required, string)

**Response (Success)**:
```json
{
    "success": true,
    "message": "Comment submitted successfully",
    "comment": {
        "id": 7,
        "blog_id": 1,
        "name": "New User",
        "email": "new@example.com",
        "comment": "Great post!",
        "created_date": "2026-04-06 14:30:00",
        "status": "pending"
    }
}
```

**Response (Error)**:
```json
{
    "success": false,
    "message": "All fields are required"
}
```

**jQuery Example**:
```javascript
$.ajax({
    url: '../php/save_comment.php',
    type: 'POST',
    data: {
        blog_id: 1,
        name: 'John Doe',
        email: 'john@example.com',
        comment: 'Great article!'
    },
    dataType: 'json',
    success: function(response) {
        if(response.success) {
            console.log('Comment saved');
        }
    }
});
```

---

## Contact API

### Send Contact Form
**Endpoint**: `POST /send_contact.php`

**Parameters** (POST):
- `name` (required, string)
- `email` (required, string, valid email)
- `subject` (required, string)
- `message` (required, string)

**Response (Success)**:
```json
{
    "success": true,
    "message": "Message sent successfully! We will get back to you soon."
}
```

**Response (Error)**:
```json
{
    "success": false,
    "message": "Invalid email address"
}
```

**jQuery Example**:
```javascript
$.ajax({
    url: '../php/send_contact.php',
    type: 'POST',
    data: {
        name: 'Jane Doe',
        email: 'jane@example.com',
        subject: 'Inquiry about Sri Lanka',
        message: 'I would like more information...'
    },
    dataType: 'json',
    success: function(response) {
        if(response.success) {
            alert(response.message);
        }
    }
});
```

---

## Newsletter API

### Subscribe to Newsletter
**Endpoint**: `POST /subscribe.php`

**Parameters** (POST):
- `email` (required, string, valid email)

**Response (Success)**:
```json
{
    "success": true,
    "message": "Successfully subscribed!"
}
```

**Response (Error)**:
```json
{
    "success": false,
    "message": "This email is already subscribed"
}
```

**jQuery Example**:
```javascript
$.ajax({
    url: '../php/subscribe.php',
    type: 'POST',
    data: { email: 'user@example.com' },
    dataType: 'json',
    success: function(response) {
        console.log(response.message);
    }
});
```

---

## Statistics API

### Get Blog Statistics
**Endpoint**: `GET /get_statistics.php`

**Response**:
```json
{
    "blog_count": 5,
    "destination_count": 6,
    "comment_count": 6
}
```

**jQuery Example**:
```javascript
$.ajax({
    url: '../php/get_statistics.php',
    type: 'GET',
    dataType: 'json',
    success: function(stats) {
        console.log('Total blogs: ' + stats.blog_count);
    }
});
```

---

## Error Handling

### Common Error Responses

#### Invalid Request Method
```json
{
    "success": false,
    "message": "Invalid request method"
}
```

#### Missing Required Fields
```json
{
    "success": false,
    "message": "All fields are required"
}
```

#### Invalid Email
```json
{
    "success": false,
    "message": "Invalid email address"
}
```

#### Not Found
```json
{
    "success": false,
    "message": "Blog not found"
}
```

---

## Best Practices

### 1. Always Use Error Handling
```javascript
$.ajax({
    url: '../php/endpoint.php',
    success: function(data) { },
    error: function(xhr, status, error) {
        console.error('AJAX Error:', error);
    }
});
```

### 2. Validate Input Before Sending
```javascript
if(email && email.includes('@')) {
    // Send AJAX request
}
```

### 3. Show User Feedback
```javascript
// Show loading indicator
$('#loading').show();

$.ajax({
    success: function() {
        // Show success message
        alert('Success!');
    },
    complete: function() {
        // Hide loading indicator
        $('#loading').hide();
    }
});
```

### 4. Handle Different Response Types
```javascript
$.ajax({
    dataType: 'json',  // Specify expected data type
    success: function(data) {
        if(data.success) {
            // Process response
        }
    }
});
```

---

## CORS Configuration

If using cross-domain requests, PHP files include CORS headers:

```php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');
```

---

## Rate Limiting (Future Enhancement)

Consider implementing rate limiting for:
- Comment submissions
- Contact forms
- Newsletter subscriptions

---

## Data Validation

All user inputs are validated and sanitized:
- Email validation using `filter_var()`
- Input sanitization using `htmlspecialchars()`
- SQL injection prevention (using JSON instead of direct DB)

---

## Response Status Codes

- `200` - Success
- `400` - Bad Request (invalid parameters)
- `404` - Not Found
- `500` - Server Error

---

## Testing Endpoints

### Using cURL
```bash
# Get all blogs
curl http://localhost/travel-blog/php/get_blogs.php

# Get single blog
curl "http://localhost/travel-blog/php/get_blog_details.php?id=1"

# Submit comment (POST)
curl -X POST http://localhost/travel-blog/php/save_comment.php \
  -d "blog_id=1&name=John&email=john@example.com&comment=Great!"
```

### Using Postman
1. Open Postman
2. Create new request
3. Set method (GET/POST)
4. Set URL
5. Add parameters
6. Send request

---

## API Rate Limits

Currently no rate limiting is implemented. Consider adding:
- Per IP rate limiting
- Per user rate limiting
- Daily submission limits

---

## Version

**Current Version**: 1.0.0

---

## Support

For API issues:
- Check browser console (F12)
- Review PHP error logs
- Verify endpoint URLs
- Test with curl or Postman

Contact: api@travelsrilanka.com
