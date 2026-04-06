# Server Configuration Guide

## Available Server Options

### Option 1: XAMPP (Windows) - Recommended

#### Installation
1. Download from: https://www.apachefriends.org/
2. Run installer (xampp-windows-x*-installer.exe)
3. Select Apache and PHP during installation
4. Click Finish

#### Configuration
1. Copy project to: `C:\xampp\htdocs\travel-blog\`
2. Open XAMPP Control Panel
3. Click "Start" next to Apache
4. Visit: `http://localhost/travel-blog/`

#### PHP Version
The project requires PHP 7.0 or higher.

**Check PHP Version:**
```bash
# Open Command Prompt in C:\xampp\php
php -v
```

#### Common Issues:
- **Port 80 already in use**: Change in Apache config to port 8080
- **MySQL not needed**: Project uses JSON files by default
- **Performance**: Good for development and testing

---

### Option 2: PHP Built-in Server

#### Requirements
- PHP 5.4 or higher installed on system
- Terminal/Command Prompt

#### Setup
```bash
# Navigate to project folder
cd "C:\Users\U S E R\Desktop\My_Projects\Travel blog"

# Start server on port 8000
php -S localhost:8000

# Server running at: http://localhost:8000/
```

#### Advantages
- Lightweight
- No additional software needed
- Quick setup
- Perfect for development

#### Limitations
- Single-threaded (one request at a time)
- Not suitable for production
- No SSL support

#### Common Issues:
- **Port already in use**: Change port number (8001, 8002, etc.)
- **PHP not recognized**: Add PHP to System PATH

---

### Option 3: WAMP (Windows, Apache, MySQL, PHP)

#### Installation
1. Download from: http://www.wampserver.com/
2. Run installer
3. Install all components

#### Configuration
1. Copy project to: `C:\wamp\www\travel-blog\`
2. Start WAMP from system tray
3. Visit: `http://localhost/travel-blog/`

#### Advantages
- Includes Apache, PHP, and MySQL
- GUI management
- Easy database setup

#### Note
- Use PHP 7.2+ for better compatibility

---

### Option 4: Docker

#### Requirements
- Docker installed on system

#### Docker Compose File (`docker-compose.yml`)
```yaml
version: '3.8'

services:
  web:
    image: php:7.4-apache
    ports:
      - "80:80"
    volumes:
      - .:/var/www/html
    working_dir: /var/www/html

  mysql:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: travel_blog
    ports:
      - "3306:3306"
    volumes:
      - db_data:/var/lib/mysql

volumes:
  db_data:
```

#### Commands
```bash
# Start containers
docker-compose up -d

# Stop containers
docker-compose down

# View logs
docker-compose logs -f
```

#### Access
- Website: `http://localhost/`
- MySQL: `localhost:3306`

---

### Option 5: Vagrant

#### Vagrant File Example
```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y apache2 php php-mysql
    systemctl start apache2
  SHELL
  
  config.vm.synced_folder ".", "/var/www/html"
  config.vm.network "private_network", ip: "192.168.33.10"
end
```

#### Commands
```bash
vagrant up      # Start VM
vagrant ssh     # Connect to VM
vagrant halt    # Stop VM
```

---

### Option 6: Linux (Apache)

#### Installation
```bash
sudo apt-get update
sudo apt-get install apache2 php libapache2-mod-php
```

#### Configuration
```bash
# Copy project to web root
sudo cp -r "Travel blog" /var/www/html/

# Set permissions
sudo chown -R www-data:www-data /var/www/html/travel-blog
sudo chmod -R 755 /var/www/html/travel-blog

# Start Apache
sudo systemctl start apache2

# Access at: http://localhost/travel-blog/
```

---

### Option 7: macOS (MAMP)

#### Installation
1. Download MAMP (free) from: https://www.mamp.info/
2. Install in Applications folder

#### Configuration
1. Copy project to: `Applications/MAMP/htdocs/travel-blog/`
2. Open MAMP
3. Click "Start Servers"
4. Visit: `http://localhost:8888/travel-blog/`

---

## Environment Configuration

### php.ini Settings

Recommended settings for development:

```ini
max_upload_size = 64M
post_max_size = 64M
memory_limit = 256M
max_execution_time = 300
display_errors = On
error_reporting = E_ALL
```

### Apache Configuration

Enable necessary modules:
```bash
a2enmod rewrite    # Enable URL rewriting
a2enmod ssl        # Enable SSL
a2enmod headers    # Enable headers
```

---

## Development vs Production

### Development Setup
- `.env.development`
- Debug mode enabled
- Detailed error messages
- No optimization

### Production Setup  
- `.env.production`
- Debug mode disabled
- Error logging only
- Optimized code

---

## Troubleshooting Server Issues

### Apache Won't Start
1. Check if port 80 is available
2. Disable conflicting services
3. Check Apache error logs
4. Try different port (8080)

### PHP Not Recognized
1. Add PHP to system PATH
2. Restart command prompt/terminal
3. Check PHP installation

### Database Connection Error
1. Start MySQL/Apache services
2. Check credentials in config.php
3. Verify database exists

### Permission Denied
1. Check folder permissions (755)
2. Check file permissions (644)
3. Run as administrator (Windows)
4. Use `sudo` (Linux/macOS)

### Port Already in Use
```bash
# Find process using port
netstat -ano | findstr :80    # Windows
lsof -i :80                    # macOS/Linux

# Kill process
taskkill /PID <PID> /F         # Windows
kill -9 <PID>                  # macOS/Linux
```

---

## Performance Tips

1. **Enable compression**
   ```apache
   mod_gzip_on Yes
   ```

2. **Enable caching**
   ```apache
   ExpiresActive On
   ExpiresByType image/jpeg A2592000
   ```

3. **Optimize PHP**
   - Use OPcache
   - Increase memory limit
   - Optimize database queries

4. **Use CDN**
   - CloudFlare
   - AWS CloudFront
   - Bunny CDN

---

## Deployment Checklist

- [ ] PHP version compatible (7.0+)
- [ ] All required extensions installed
- [ ] Database configured (if using MySQL)
- [ ] File permissions correct
- [ ] Images folder exists
- [ ] JSON files writable
- [ ] Error logging enabled
- [ ] SSL certificate installed
- [ ] Domain configured
- [ ] DNS records updated
- [ ] Backup system in place
- [ ] Email configuration working

---

## Support

For server configuration help:
- Apache: https://httpd.apache.org/
- PHP: https://www.php.net/docs.php
- MySQL: https://dev.mysql.com/doc/

Contact: info@travelsrilanka.com
