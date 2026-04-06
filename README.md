# Travel Sri Lanka - Dynamic Blog Website

A fully responsive travel blog website built with HTML, CSS, Bootstrap, jQuery, PHP, and JSON. This website showcases Sri Lankan destinations, travel stories, and provides a platform for community engagement through comments.

## Features

✨ **Key Features:**
- **Responsive Design** - Mobile-friendly layout using Bootstrap
- **Dynamic Content Loading** - AJAX-powered content loading with JSON data
- **Blog Management** - Create, read, and display blog posts with categories
- **Comment System** - Users can leave comments on blog posts
- **Contact Form** - Visitors can send inquiries
- **Newsletter Subscription** - Email subscription functionality
- **Category Filtering** - Filter blogs by category (Beaches, Adventure, Food, Culture, Wildlife)
- **Search Functionality** - Search blogs by title, author, or content
- **Statistics Dashboard** - Display blog count, comments, and destinations
- **Featured Destinations** - Showcase popular travel destinations
- **Team Section** - Display team members on About page
- **Responsive Tables** - Data displayed in interactive tables with sorting

## Project Structure

```
Travel blog/
├── index.html                 # Homepage
├── css/
│   └── style.css             # Main stylesheet
├── js/
│   └── script.js             # jQuery AJAX scripts
├── php/
│   ├── config.php            # Database configuration
│   ├── get_blogs.php         # Fetch all blogs
│   ├── get_blog_details.php  # Fetch single blog
│   ├── get_destinations.php  # Fetch destinations
│   ├── get_comments.php      # Fetch comments for a blog
│   ├── save_comment.php      # Save new comment
│   ├── send_contact.php      # Handle contact form
│   ├── get_statistics.php    # Get blog statistics
│   └── subscribe.php         # Handle newsletter subscription
├── data/
│   ├── blogs.json            # Blog posts data
│   ├── destinations.json     # Destinations data
│   ├── comments.json         # Comments data
│   ├── subscribers.json      # Newsletter subscribers
│   └── contacts.json         # Contact form submissions
├── pages/
│   ├── blog.html             # Blog listing page
│   ├── blog-details.html     # Individual blog post with comments
│   ├── about.html            # About Us page
│   └── contact.html          # Contact Us page
└── images/
    └── (banner and other images)
```

## Pages

### 1. **Home Page (index.html)**
- Banner with call-to-action button
- Featured destinations section
- Latest blog posts grid
- Statistics section
- Newsletter subscription form

### 2. **Blog Page (pages/blog.html)**
- List all blog posts in card format
- Filter by category
- Search functionality
- Featured posts table

### 3. **Blog Details Page (pages/blog-details.html)**
- Full blog post content
- Comments section
- Comment submission form
- Related articles table
- Recent posts sidebar
- Blog statistics sidebar

### 4. **About Us Page (pages/about.html)**
- Company story and mission
- Team member profiles
- Why choose Sri Lanka section
- Newsletter subscription

### 5. **Contact Us Page (pages/contact.html)**
- Contact form
- Contact information
- Business hours
- FAQ table
- Contact categories table

## Technologies Used

- **Frontend**: HTML5, CSS3, Bootstrap 5, jQuery 3.6
- **Backend**: PHP 7+
- **Data Storage**: JSON files
- **Styling**: Bootstrap classes + Custom CSS
- **AJAX**: jQuery AJAX for dynamic content loading

## Setup Instructions

### 1. **Prerequisites**
- PHP Server (XAMPP, WAMP, or similar)
- Modern web browser
- Text editor (VS Code recommended)

### 2. **Installation**

#### Option A: Using XAMPP

1. Download and install XAMPP from https://www.apachefriends.org/

2. Extract the project folder to `C:\xampp\htdocs\travel-blog`

3. Start Apache and MySQL from XAMPP Control Panel

4. Open browser and navigate to: `http://localhost/travel-blog/`

#### Option B: Using PHP Built-in Server

1. Navigate to project directory:
   ```bash
   cd "C:\Users\U S E R\Desktop\My_Projects\Travel blog"
   ```

2. Run PHP server:
   ```bash
   php -S localhost:8000
   ```

3. Open browser and navigate to: `http://localhost:8000/`

### 3. **Database Setup (Optional for MySQL)**

If you want to use MySQL instead of JSON:

```sql
-- Create database
CREATE DATABASE travel_blog;

-- Use database
USE travel_blog;

-- Create blogs table
CREATE TABLE blogs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    excerpt TEXT,
    content LONGTEXT,
    image VARCHAR(255),
    author VARCHAR(100),
    category VARCHAR(50),
    created_date DATETIME,
    tags TEXT
);

-- Create comments table
CREATE TABLE comments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    blog_id INT,
    name VARCHAR(100),
    email VARCHAR(100),
    comment TEXT,
    created_date DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (blog_id) REFERENCES blogs(id)
);

-- Create destinations table
CREATE TABLE destinations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    location VARCHAR(255),
    description TEXT,
    image VARCHAR(255)
);

-- Create subscribers table
CREATE TABLE subscribers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE,
    subscribed_date DATETIME
);

-- Create contacts table
CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    subject VARCHAR(255),
    message TEXT,
    submitted_date DATETIME,
    status VARCHAR(20)
);
```

## Usage

### Creating a New Blog Post

1. Add blog data to `data/blogs.json`:
```json
{
    "id": 6,
    "title": "Your Blog Title",
    "excerpt": "Short description...",
    "content": "<h3>Heading</h3><p>Content here...</p>",
    "image": "images/your-image.jpg",
    "author": "Author Name",
    "category": "Adventure",
    "created_date": "2026-04-06",
    "tags": ["tag1", "tag2"]
}
```

### Adding Comments

Comments are automatically saved to `data/comments.json` when submitted through the form.

### Handling Contact Forms

Contact submissions are saved to `data/contacts.json`.

## AJAX Endpoints

### GET Endpoints
- `php/get_blogs.php` - Returns all blog posts
- `php/get_blogs.php?id=1` - Returns specific blog post
- `php/get_destinations.php` - Returns all destinations
- `php/get_comments.php?blog_id=1` - Returns comments for a blog
- `php/get_statistics.php` - Returns blog statistics

### POST Endpoints
- `php/save_comment.php` - Save new comment
- `php/send_contact.php` - Process contact form
- `php/subscribe.php` - Process newsletter subscription

## Customization

### Change Colors
Edit `css/style.css` to change color scheme:
```css
:root {
    --primary-color: #0d6efd;
    --secondary-color: #6c757d;
    /* ... more colors ... */
}
```

### Add New Categories
1. Add to blog post in `data/blogs.json`
2. Update category filter buttons in `pages/blog.html`

### Customize Navigation
Edit the navbar in HTML files to add/remove links.

## Performance Tips

1. Optimize images before uploading
2. Use gzip compression on server
3. Implement caching for JSON files
4. Consider using a CDN for Bootstrap and jQuery

## Browser Support

- Chrome/Chromium 90+
- Firefox 88+
- Safari 14+
- Edge 90+
- Mobile browsers (iOS Safari, Chrome Mobile)

## Troubleshooting

### AJAX calls returning 404
- Ensure PHP files are in the `php/` directory
- Check file paths in JavaScript

### Styles not applying
- Clear browser cache (Ctrl+Shift+Delete)
- Check CSS file path in HTML

### Comments not saving
- Ensure `data/` folder has write permissions
- Check JSON file syntax

### Images not displaying
- Verify image paths are correct
- Ensure images are in `images/` folder

## Future Enhancements

- [ ] Database integration (MySQL/PostgreSQL)
- [ ] User authentication and profiles
- [ ] Social sharing buttons
- [ ] Rating system for posts
- [ ] Email notifications
- [ ] Admin dashboard
- [ ] User-generated content
- [ ] Image optimization
- [ ] SEO optimization
- [ ] API documentation

## License

This project is open source and free to use for educational purposes.

## Support

For issues or questions, please contact: info@travelsrilanka.com

## Version

Current Version: 1.0.0
Last Updated: April 6, 2026

---

Enjoy exploring the beautiful island of Sri Lanka through Travel Sri Lanka Blog! 🌴🏖️⛰️
