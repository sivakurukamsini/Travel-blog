# Travel Sri Lanka Blog - File Navigation Guide

## 📖 Where to Start

### 1️⃣ First Time Setup?
**Start here**: [`GETTING_STARTED.md`](GETTING_STARTED.md)
- Quick setup instructions
- Server configuration
- Basic customization

### 2️⃣ Understanding the Project?
**Read this**: [`PROJECT_SUMMARY.md`](PROJECT_SUMMARY.md)
- Complete overview
- Feature list
- Technology stack

### 3️⃣ Need Help?
**Choose your guide**:
- Setting up a server? → [`SERVER_SETUP.md`](SERVER_SETUP.md)
- Using the API? → [`API_DOCUMENTATION.md`](API_DOCUMENTATION.md)
- Overall guide? → [`README.md`](README.md)

---

## 📂 File Structure & Purposes

### 🏠 Root Files

| File | Purpose | Read When |
|------|---------|-----------|
| `index.html` | Homepage | Want to preview the site |
| `README.md` | Complete documentation | Need full project info |
| `PROJECT_SUMMARY.md` | Project overview | Want quick reference |
| `GETTING_STARTED.md` | Quick start guide | Just started using it |
| `API_DOCUMENTATION.md` | AJAX endpoints | Developing new features |
| `SERVER_SETUP.md` | Server configuration | Need to set up server |
| `.gitignore` | Git configuration | Using version control |

### 🎨 CSS Folder (Styling)

| File | Purpose | Lines | When to Edit |
|------|---------|-------|--------------|
| `css/style.css` | All website styling | 900+ | Changing colors, fonts, layout |

**Key Sections**:
- Lines 1-20: CSS variables (colors)
- Lines 30-70: Navigation styling
- Lines 90-120: Banner animations
- Lines 150-200: Cards and hover effects
- Lines 350+: Responsive design

### ⚙️ JS Folder (Functionality)

| File | Purpose | Lines | When to Edit |
|------|---------|-------|--------------|
| `js/script.js` | jQuery AJAX functions | 400+ | Adding new features |

**Key Functions**:
- `loadBlogPosts()` - Fetch blogs
- `loadDestinations()` - Fetch destinations
- `loadComments()` - Fetch comments
- `saveComment()` - Save new comment
- `sendContact()` - Send contact form

### 📱 Pages Folder (Additional Pages)

| File | Purpose | Content | When to Use |
|------|---------|---------|------------|
| `pages/blog.html` | Blog listing | All posts with filters | Production |
| `pages/blog-details.html` | Individual blog | Full post + comments | Production |
| `pages/about.html` | About us page | Team + company info | Production |
| `pages/contact.html` | Contact page | Contact form + FAQ | Production |

### 🔧 PHP Folder (Backend)

| File | Purpose | Type | When to Use |
|------|---------|------|------------|
| `php/config.php` | Configuration | Setup | Initial setup |
| `php/get_blogs.php` | Fetch blogs | GET | Homepage, blog page |
| `php/get_blog_details.php` | Fetch blog | GET | Blog details page |
| `php/get_destinations.php` | Fetch destinations | GET | Homepage |
| `php/get_comments.php` | Fetch comments | GET | Blog details page |
| `php/save_comment.php` | Save comment | POST | Blog details page |
| `php/send_contact.php` | Contact form | POST | Contact page |
| `php/get_statistics.php` | Get stats | GET | Multiple pages |
| `php/subscribe.php` | Newsletter | POST | Homepage, all pages |

### 📊 Data Folder (Content)

| File | Purpose | Records | When to Edit |
|------|---------|---------|--------------|
| `data/blogs.json` | Blog posts | 5 sample | Add/edit blog posts |
| `data/destinations.json` | Destinations | 6 sample | Add/edit destinations |
| `data/comments.json` | Comments | 6 sample | Remove old comments |
| `data/contacts.json` | Contact forms | Auto-created | View submissions |
| `data/subscribers.json` | Newsletter | Auto-created | View subscribers |

### 🖼️ Images Folder

| File | Purpose | When to Add |
|------|---------|------------|
| `images/README.txt` | Image guidelines | Reference |
| (all other images) | Website images | Replace defaults |

### 📁 Database (Optional)

| File | Purpose | When to Use |
|------|---------|------------|
| `database_setup.sql` | MySQL schema | Upgrading to MySQL |

---

## 🔍 How to Find What You Need

### Want to...

#### **Change Website Colors?**
→ Edit `css/style.css` (lines 1-20)
```css
:root {
    --primary-color: #0d6efd;  /* ← Change this */
}
```

#### **Add a New Blog Post?**
→ Edit `data/blogs.json`
```json
{
    "id": 6,
    "title": "Your Title",
    ...
}
```

#### **Modify Homepage Layout?**
→ Edit `index.html` (lines 1-100)

#### **Add Navigation Links?**
→ Edit `index.html` navbar section or search `<nav>`

#### **Change Team Members?**
→ Edit `pages/about.html` (team section)

#### **Update Contact Info?**
→ Edit `pages/contact.html` (contact-info div)

#### **Add New Feature?**
→ Add PHP file in `php/` folder
→ Add jQuery function in `js/script.js`
→ Call from HTML page

---

## 📚 Documentation Map

```
Project Documentation
├── README.md
│   ├── Features
│   ├── Setup Instructions
│   ├── Project Structure
│   ├── Customization Guide
│   ├── Troubleshooting
│   └── API Reference
│
├── PROJECT_SUMMARY.md
│   ├── Project Overview
│   ├── File Descriptions
│   ├── Technology Stack
│   ├── Quick Start
│   ├── Features Summary
│   └── Next Steps
│
├── GETTING_STARTED.md
│   ├── Checklist
│   ├── Server Setup (3 methods)
│   ├── Data Files Reference
│   ├── PHP Configuration
│   ├── Feature Verification
│   └── Troubleshooting
│
├── SERVER_SETUP.md
│   ├── XAMPP Setup
│   ├── PHP Built-in Server
│   ├── WAMP Setup
│   ├── Docker Setup
│   ├── Linux Setup
│   ├── Environment Config
│   └── Performance Tips
│
├── API_DOCUMENTATION.md
│   ├── Blogs API
│   ├── Destinations API
│   ├── Comments API
│   ├── Contact API
│   ├── Newsletter API
│   ├── Statistics API
│   ├── Error Handling
│   └── Testing Endpoints
│
├── database_setup.sql
│   ├── Database Schema
│   ├── Tables
│   ├── Sample Data
│   ├── Views
│   └── Stored Procedures
│
└── FILE_GUIDE.md (this file)
    └── Navigation & References
```

---

## 🚀 Common Tasks & Files

### Setup & Configuration
- First time? → `GETTING_STARTED.md`
- Server issues? → `SERVER_SETUP.md`
- Database? → `database_setup.sql`

### Adding Content
- New blog post? → `data/blogs.json`
- New destination? → `data/destinations.json`
- New page? → `pages/` folder

### Styling & Design
- Change colors? → `css/style.css`
- New fonts? → `css/style.css`
- Responsive layout? → `css/style.css`

### Features & Functions
- New AJAX call? → `js/script.js`
- New API endpoint? → `php/` folder
- New form? → `pages/` + `php/` + `js/script.js`

### Troubleshooting
- 404 errors? → `API_DOCUMENTATION.md`
- Styles issues? → `css/style.css` + browser F12
- Server problems? → `SERVER_SETUP.md`

---

## 🔗 Quick Links

### Main Pages
- Homepage: `index.html`
- Blog Listing: `pages/blog.html`
- Blog Details: `pages/blog-details.html`
- About: `pages/about.html`
- Contact: `pages/contact.html`

### Backend
- API Endpoints: `php/` folder
- Data Files: `data/` folder
- Configuration: `php/config.php`

### Documentation
- Overview: `PROJECT_SUMMARY.md`
- Setup: `GETTING_STARTED.md`
- Servers: `SERVER_SETUP.md`
- API: `API_DOCUMENTATION.md`

---

## 📋 Version Information

| Item | Value |
|------|-------|
| Project Version | 1.0.0 |
| Created | April 6, 2026 |
| Total Files | 20+ |
| Total Lines of Code | 3000+ |
| Documentation Pages | 6 |

---

## ✅ File Checklist

- ✅ `index.html` (250 lines)
- ✅ `css/style.css` (900 lines)
- ✅ `js/script.js` (400 lines)
- ✅ `php/config.php`
- ✅ `php/get_blogs.php`
- ✅ `php/get_blog_details.php`
- ✅ `php/get_destinations.php`
- ✅ `php/get_comments.php`
- ✅ `php/save_comment.php`
- ✅ `php/send_contact.php`
- ✅ `php/get_statistics.php`
- ✅ `php/subscribe.php`
- ✅ `data/blogs.json`
- ✅ `data/destinations.json`
- ✅ `data/comments.json`
- ✅ `pages/blog.html`
- ✅ `pages/blog-details.html`
- ✅ `pages/about.html`
- ✅ `pages/contact.html`
- ✅ `README.md`
- ✅ `PROJECT_SUMMARY.md`
- ✅ `GETTING_STARTED.md`
- ✅ `API_DOCUMENTATION.md`
- ✅ `SERVER_SETUP.md`
- ✅ `database_setup.sql`
- ✅ `.gitignore`
- ✅ `images/README.txt`

---

## 🎓 Learning Path

1. **Day 1**: Read `GETTING_STARTED.md` and `PROJECT_SUMMARY.md`
2. **Day 2**: Set up server and run website
3. **Day 3**: Customize colors and add your content
4. **Day 4**: Add blog posts and images
5. **Day 5**: Test all features and functionality
6. **Week 2**: Deploy to production

---

## 🎯 One-Minute Quick Reference

```
To start:           php -S localhost:8000
To customize:       Edit css/style.css
To add content:     Edit data/*.json files
To read docs:       Start with GETTING_STARTED.md
To understand API:  Read API_DOCUMENTATION.md
To fix server:      Check SERVER_SETUP.md
To troubleshoot:    See README.md Troubleshooting section
```

---

## 💡 Pro Tips

1. **Always backup** your data before making changes
2. **Test locally** before deploying to production
3. **Use browser DevTools** (F12) to debug AJAX issues
4. **Check console** for JavaScript errors
5. **Validate JSON** files before saving
6. **Optimize images** before uploading
7. **Document changes** in comments
8. **Use version control** (git) for tracking changes

---

## 🆘 Getting Help

1. Check the relevant documentation file
2. Review comments in the code
3. Check browser console (F12) for errors
4. Review PHP error logs
5. Test with browser DevTools Network tab
6. Verify file paths and permissions

---

**Last Updated**: April 6, 2026  
**Status**: ✅ Complete  
**Questions?** Contact: info@travelsrilanka.com

---

Happy developing! 🚀
