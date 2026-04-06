# Travel Sri Lanka Blog - Deployment & Testing Guide

## 🚀 Quick Deployment Steps

### Step 1: Choose Your Server

**Option A: PHP Built-in Server (Fastest)**
```bash
cd "C:\Users\U S E R\Desktop\My_Projects\Travel blog"
php -S localhost:8000
```

**Option B: XAMPP**
1. Copy folder to `C:\xampp\htdocs\travel-blog\`
2. Start Apache in XAMPP Control Panel
3. Visit `http://localhost/travel-blog/`

### Step 2: Navigate to Website
- Open browser
- Go to: `http://localhost:8000/` or `http://localhost/travel-blog/`
- You should see the Travel Sri Lanka homepage with a banner

### Step 3: Test All Features

---

## ✅ Testing Checklist

### Homepage (index.html)
- [ ] Banner displays correctly
- [ ] Featured destinations load (AJAX)
- [ ] Blog posts display (AJAX)
- [ ] Statistics show counts
- [ ] Newsletter form visible
- [ ] Footer displays correctly
- [ ] Navigation works on mobile

### Blog Page (pages/blog.html)
- [ ] All 5 blogs display in grid
- [ ] Category filter works
- [ ] Search functionality works
- [ ] Featured table shows all posts
- [ ] Featured table has action buttons
- [ ] Blog cards are clickable

### Blog Details (pages/blog-details.html)
- [ ] Blog post displays with image
- [ ] Post metadata shows (author, date, category)
- [ ] Blog content displays correctly
- [ ] Comments section loads
- [ ] Can add a new comment
- [ ] Recent posts sidebar populates
- [ ] Related articles table displays
- [ ] Statistics sidebar shows

### About Page (pages/about.html)
- [ ] Story section displays
- [ ] Mission section displays
- [ ] Team member cards show
- [ ] Why Sri Lanka section displays
- [ ] Newsletter form works

### Contact Page (pages/contact.html)
- [ ] Contact form visible
- [ ] Contact information displays
- [ ] FAQ table shows questions
- [ ] Contact categories table displays
- [ ] Form submission works
- [ ] Success/error message shows

---

## 🧪 Feature Testing

### Blog Loading
```javascript
// Test in browser console (F12)
// Should load JSON from PHP
$.ajax({
    url: 'php/get_blogs.php',
    success: () => console.log('✅ Blogs loaded')
});
```

### Comment Submission
1. Go to any blog details page
2. Scroll to comment form
3. Fill in: Name, Email, Comment
4. Click "Post Comment"
5. Should see confirmation message
6. Refresh page - comment should persist

### Contact Form
1. Go to Contact page
2. Fill in: Name, Email, Subject, Message
3. Click "Send Message"
4. Should see success message
5. Check `data/contacts.json` for data

### Newsletter Subscription
1. Scroll to newsletter section
2. Enter email
3. Click "Subscribe"
4. Should show confirmation
5. Check `data/subscribers.json`

---

## 🔍 Debugging Guide

### AJAX Not Loading
1. Open browser console (F12)
2. Check Network tab
3. Look for failed requests
4. Verify PHP file paths
5. Check PHP error logs

### Styles Not Applying
1. Clear browser cache (Ctrl+Shift+Delete)
2. Hard refresh (Ctrl+F5)
3. Check CSS file path
4. Verify Bootstrap CDN loaded

### Comments Not Showing
1. Check if JSON exists
2. Verify file permissions
3. Check browser console
4. Verify blog_id parameter

### Images Not Loading
1. Check image folder exists
2. Verify image paths in JSON
3. Verify image file names
4. Check image file extensions

---

## 📊 Performance Testing

### Load Time Test
1. Open DevTools (F12)
2. Go to Network tab
3. Reload page (Ctrl+R)
4. Should load in < 2 seconds local

### AJAX Response Time
1. Open Console tab
2. Execute: `$.ajax({url: 'php/get_blogs.php', ...})`
3. Should respond in < 100ms local

### Mobile Testing
1. Open DevTools (F12)
2. Toggle device toolbar (Ctrl+Shift+M)
3. Test on different screen sizes
4. Check touch functionality

---

## 🐛 Common Issues & Solutions

| Issue | Cause | Solution |
|-------|-------|----------|
| 404 on AJAX | Wrong file path | Check paths in script.js |
| Styles missing | CSS not loading | Clear cache & hard refresh |
| Comments blank | JSON file issue | Check data/comments.json |
| No data | PHP error | Check PHP error log |

---

## 📁 File Permissions

Ensure these folders are writable:
```
data/          - Comments, contacts, subscribers
images/        - User-uploaded images (optional)
```

### Set Permissions
```bash
# Linux/macOS
chmod 755 data/
chmod 644 data/*.json

# Windows
Right-click > Properties > Security > Edit
Add write permission for current user
```

---

## 📧 Testing Email Features

### Contact Form Email
1. Update `php/send_contact.php` line 28:
```php
$to = 'your-email@example.com';
```

2. Fill contact form
3. Submit
4. Check email inbox

**Note**: Requires email server configuration

---

## 🔐 Security Testing

### Input Validation
1. Try submitting empty form
2. Try invalid email
3. Try XSS payload: `<script>alert('xss')</script>`
4. Should be sanitized

### File Permissions
- Check data files aren't publicly readable
- Verify no sensitive info exposed
- Ensure PHP files not directly executable

---

## 🌍 Cross-Browser Testing

Test on:
- [ ] Chrome/Chromium
- [ ] Firefox
- [ ] Safari
- [ ] Edge
- [ ] Mobile Safari (iOS)
- [ ] Chrome Mobile (Android)

### Tools
- BrowserStack: https://www.browserstack.com/
- Can I Use: https://caniuse.com/

---

## 📱 Responsive Design Testing

### Mobile (320px)
- [ ] Menu hamburger works
- [ ] Text readable
- [ ] Buttons clickable
- [ ] No horizontal scroll

### Tablet (768px)
- [ ] 2-column layout
- [ ] Touch friendly
- [ ] Images scale correctly

### Desktop (1200px)
- [ ] 3-column layout
- [ ] Full nav bar
- [ ] Proper spacing

---

## 🚢 Production Deployment

### Pre-Deployment Checklist
- [ ] All testing passed locally
- [ ] Images added and optimized
- [ ] Contact email configured
- [ ] Database migrated (if needed)
- [ ] SSL certificate ready
- [ ] Domain configured
- [ ] Backup system in place
- [ ] Error logging enabled
- [ ] Analytics configured

### Deployment Steps
1. Upload files to web server
2. Set correct file permissions
3. Update config paths
4. Test on live server
5. Monitor error logs
6. Set up monitoring

### Post-Deployment
1. Submit to Google Search Console
2. Set up Analytics
3. Configure Backups
4. Monitor performance
5. Check logs regularly

---

## 📊 Analytics Setup

Add Google Analytics to `index.html`:
```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_ID');
</script>
```

### Track Events
Track AJAX calls and form submissions

---

## 🔄 Continuous Integration

### GitHub Actions (Optional)
Create `.github/workflows/test.yml`:
```yaml
name: Tests
on: [push]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: PHP Syntax Check
        run: php -l $(find . -name '*.php')
      - name: JSON Validation
        run: python -m json.tool data/*.json
```

---

## 📈 Monitoring & Maintenance

### Daily
- [ ] Check error logs
- [ ] Monitor website uptime

### Weekly
- [ ] Check user feedback
- [ ] Review analytics
- [ ] Check server performance

### Monthly
- [ ] Backup database
- [ ] Update content
- [ ] Security updates
- [ ] Performance optimization

---

## 🆘 Emergency Procedures

### Site Down
1. Check server status
2. Check error logs
3. Verify database connection
4. Check disk space
5. Restart services

### Data Loss
1. Restore from backup
2. Rebuild JSON files
3. Notify users
4. Investigate cause

### Security Breach
1. Take site offline
2. Check logs for breach
3. Update passwords
4. Scan for malware
5. Restore clean backup
6. Review security

---

## 📞 Support Contacts

- **Hosting Support**: Contact your hosting provider
- **PHP Issues**: https://www.php.net/
- **Bootstrap Issues**: https://getbootstrap.com/docs/
- **jQuery Issues**: https://api.jquery.com/

---

## 🎓 Training Resources

### PHP
- Official Documentation: https://www.php.net/docs.php
- PHP Best Practices: https://phptherightway.com/

### JavaScript
- MDN Web Docs: https://developer.mozilla.org/
- jQuery Documentation: https://api.jquery.com/

### Deployment
- Server Configuration: https://httpd.apache.org/
- MySQL Setup: https://dev.mysql.com/

---

## ✅ Final Checklist

Before going live:
- [ ] All pages tested
- [ ] AJAX calls working
- [ ] Images optimized
- [ ] Database configured
- [ ] Backups enabled
- [ ] SSL certificate
- [ ] Email configured
- [ ] Analytics setup
- [ ] Monitoring enabled
- [ ] Documentation updated

---

## 📝 Change Log

**v1.0.0 (April 6, 2026)**
- Initial release
- All core features implemented
- Full documentation

---

**Ready to Launch!** 🚀

Your Travel Sri Lanka Blog is fully tested and ready for production deployment.

For support: info@travelsrilanka.com
