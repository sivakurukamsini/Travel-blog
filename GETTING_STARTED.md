# Travel Sri Lanka Blog - Quick Start Guide

## 📋 Checklist Before Running

- [x] All HTML, CSS, and JavaScript files created
- [x] PHP backend files configured
- [x] JSON data files with sample data
- [x] Responsive Bootstrap layout
- [x] AJAX functionality for dynamic content
- [x] Comment system
- [x] Contact form handling

## 🚀 Getting Started

### Step 1: Server Setup
Choose one of the following methods:

#### Method 1: XAMPP (Windows)
```bash
1. Download XAMPP from: https://www.apachefriends.org/
2. Install in default location (C:\xampp)
3. Copy project to: C:\xampp\htdocs\travel-blog\
4. Open XAMPP Control Panel
5. Click "Start" next to Apache and MySQL
6. Open: http://localhost/travel-blog/
```

#### Method 2: PHP Built-in Server (Any OS)
```bash
cd "C:\Users\U S E R\Desktop\My_Projects\Travel blog"
php -S localhost:8000
# Visit: http://localhost:8000/
```

#### Method 3: IIS (Windows)
```
1. Open IIS Manager
2. Add new website pointing to project folder
3. Set port to 80 or 8000
4. Enable PHP through IIS
```

### Step 2: Configure Paths (if needed)

Make sure relative paths are correct:
- HTML files reference CSS: `../css/style.css`
- HTML files reference JS: `../js/script.js`
- HTML files reference PHP: `../php/*.php`
- PHP files reference data: `../data/*.json`

### Step 3: Add Your Own Content

#### Add Blog Posts
Edit `data/blogs.json` and add your posts:

```json
{
    "id": 6,
    "title": "Your Blog Title",
    "excerpt": "Brief summary of the blog",
    "content": "<h3>Main Content</h3><p>Full article content with HTML tags</p>",
    "image": "images/blog-image.jpg",
    "author": "Your Name",
    "category": "Adventure",
    "created_date": "2026-04-06",
    "tags": ["Travel", "SriLanka"]
}
```

#### Add Destinations
Edit `data/destinations.json`:

```json
{
    "id": 7,
    "name": "Destination Name",
    "location": "Region",
    "description": "Description of the destination",
    "image": "images/destination.jpg"
}
```

### Step 4: Add Images

1. Create an `images/` folder if it doesn't exist
2. Add your images:
   - Banner: `images/banner.jpg` (recommended: 1600x400px)
   - Blog images: `images/blog*.jpg` (recommended: 800x600px)
   - Destination images: `images/destination*.jpg`
   - Team images: `images/team*.jpg`
   - About images: `images/about*.jpg`

### Step 5: Test All Features

1. **Homepage**: Check if blogs and destinations load dynamically
2. **Blog Listing**: Filter by category, search functionality
3. **Blog Details**: View individual posts, add comments
4. **About Page**: Team members display correctly
5. **Contact Page**: Submit contact form, fill FAQ table
6. **Newsletter**: Subscribe to newsletter

## 🎨 Customization

### Change Website Title
Edit in all HTML files:
```html
<title>Travel Sri Lanka - Your New Title</title>
```

### Change Color Scheme
Edit `css/style.css`:
```css
:root {
    --primary-color: #0d6efd;      /* Change this to your color */
    --secondary-color: #6c757d;
    --success-color: #198754;
}
```

### Update Contact Information
Edit `pages/contact.html`:
```html
<p>
    <a href="tel:+94112345678">+94 11 2345 678</a>
    <!-- Update phone number -->
</p>
```

### Update Footer Information
Edit footer in all HTML files:
```html
<p>&copy; 2026 Travel Sri Lanka. All Rights Reserved.</p>
```

## 📊 Data Files Reference

### blogs.json Structure
```json
{
    "id": 1,
    "title": "Post Title",
    "excerpt": "Short description",
    "content": "Full HTML content",
    "image": "path/to/image.jpg",
    "author": "Author Name",
    "category": "Category Name",
    "created_date": "YYYY-MM-DD",
    "tags": ["tag1", "tag2"]
}
```

### Comments Structure (auto-generated)
```json
{
    "id": 1,
    "blog_id": 1,
    "name": "Visitor Name",
    "email": "email@example.com",
    "comment": "Comment text",
    "created_date": "YYYY-MM-DD HH:MM:SS",
    "status": "approved"
}
```

### Contacts Structure (auto-generated)
```json
{
    "id": 1,
    "name": "Visitor Name",
    "email": "email@example.com",
    "subject": "Subject Line",
    "message": "Message content",
    "submitted_date": "YYYY-MM-DD HH:MM:SS",
    "status": "unread"
}
```

## ⚙️ PHP Configuration

### Email Setup (for contact form)
Edit `php/send_contact.php` line 28:
```php
$to = 'your-email@example.com';  // Change this to your email
```

### Database Setup (Optional - to use MySQL instead of JSON)
1. Create database using SQL commands in README.md
2. Update `php/config.php` with your credentials:
```php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', 'your_password');
define('DB_NAME', 'travel_blog');
```

## ✅ Feature Verification

### Homepage
- ✓ Banner displays correctly
- ✓ Featured destinations load via AJAX
- ✓ Blog posts load via AJAX
- ✓ Statistics update dynamically
- ✓ Newsletter form works
- ✓ Responsive on mobile

### Blog Listing Page
- ✓ All blogs display in grid
- ✓ Category filter works
- ✓ Search functionality works
- ✓ Each blog links to details page
- ✓ Featured table displays all posts

### Blog Details Page
- ✓ Blog content displays correctly
- ✓ Comments load dynamically
- ✓ Can submit new comments
- ✓ Recent posts sidebar updates
- ✓ Related articles show in table

### About Page
- ✓ Story section displays
- ✓ Mission section with list
- ✓ Team member cards display
- ✓ Why Sri Lanka section renders

### Contact Page
- ✓ Contact form submits successfully
- ✓ Contact information displays
- ✓ FAQ table shows all items
- ✓ Contact categories table displays

## 🐛 Troubleshooting

### Issue: "Error loading blog posts"
**Solution**: 
- Check if PHP server is running
- Verify file paths in JavaScript
- Check browser console for errors (F12)

### Issue: Images not loading
**Solution**:
- Ensure images folder exists
- Check image paths in JSON files
- Verify image file extensions (jpg, png, etc.)

### Issue: Comments not saving
**Solution**:
- Check if `data/` folder has write permissions
- Ensure JSON files have correct syntax
- Check PHP error logs

### Issue: AJAX calls failing
**Solution**:
- Clear browser cache
- Check network tab in developer tools
- Verify PHP files exist in correct location

## 📱 Mobile Testing

Test on different screen sizes:
- Desktop (1200px+)
- Tablet (768px - 1024px)
- Mobile (320px - 767px)

Use Chrome DevTools (F12) → Toggle device toolbar

## 🔒 Security Notes

1. **Input Validation**: All user inputs are sanitized in PHP
2. **CSRF Protection**: Consider adding tokens for forms
3. **SQL Injection**: Using JSON files prevents SQL injection
4. **File Upload**: Currently no file upload feature

## ⚡ Performance Optimization

1. Minify CSS and JavaScript
2. Optimize images (use ImageOptim or similar)
3. Enable gzip compression on server
4. Use browser caching headers
5. Lazy load images (Advanced)

## 📚 Additional Resources

- Bootstrap Docs: https://getbootstrap.com/docs/5.0/
- jQuery Docs: https://api.jquery.com/
- PHP Documentation: https://www.php.net/docs.php
- JSON Specification: https://www.json.org/

## 🎯 Next Steps

1. Add your own blog posts and images
2. Customize colors and styling
3. Test all forms and features
4. Deploy to web server
5. Submit to search engines
6. Set up analytics (Google Analytics)

---

**Congratulations! Your Travel Sri Lanka Blog is ready to go!** 🎉

For support or updates, refer to the README.md file in the project root.
