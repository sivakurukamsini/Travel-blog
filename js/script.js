// Travel Sri Lanka - JavaScript with jQuery and AJAX

$(document).ready(function() {
    console.log('Document ready - initializing Travel Sri Lanka website');
    
    // Load blog posts on page load
    loadBlogPosts();
    loadDestinations();
    loadStatistics();
    
    // Newsletter subscription
    $('#newsletter-form').on('submit', function(e) {
        e.preventDefault();
        alert('Newsletter subscription is disabled in the static version. Please contact the site administrator.');
        $('#newsletter-form')[0].reset();
    });
});

// Function to load blog posts via AJAX
function loadBlogPosts() {
    $.ajax({
        url: 'data/blogs.json',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            console.log('Blogs loaded:', data);
            // Sort by date (newest first)
            data.sort(function(a, b) {
                return new Date(b.created_date) - new Date(a.created_date);
            });
            displayBlogPosts(data);
        },
        error: function(xhr, status, error) {
            console.error('Error loading blogs:', error);
            $('#blog-container').html('<div class="alert alert-danger">Error loading blog posts</div>');
        }
    });
}

// Function to display blog posts
function displayBlogPosts(blogs) {
    let html = '';
    
    if(blogs.length === 0) {
        html = '<div class="col-12 text-center"><p>No blog posts available yet.</p></div>';
    } else {
        blogs.forEach(blog => {
            const date = new Date(blog.created_date);
            const formattedDate = date.toLocaleDateString('en-US', { 
                year: 'numeric', 
                month: 'short', 
                day: 'numeric' 
            });
            
            html += `
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card blog-card h-100">
                        <img src="${blog.image}" class="card-img-top" alt="${blog.title}">
                        <div class="card-body d-flex flex-column">
                            <div class="blog-meta">
                                <i class="fas fa-calendar"></i> ${formattedDate}
                                <span class="ms-3">
                                    <i class="fas fa-user"></i> ${blog.author}
                                </span>
                            </div>
                            <h5 class="card-title blog-title">${blog.title}</h5>
                            <p class="card-text blog-excerpt">${blog.excerpt}</p>
                            <a href="pages/blog-details.html?id=${blog.id}" class="mt-auto read-more-btn">
                                Read More <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
            `;
        });
    }
    
    $('#blog-container').html(html);
}

// Function to load destinations via AJAX
function loadDestinations() {
    $.ajax({
        url: 'data/destinations.json',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            console.log('Destinations loaded:', data);
            displayDestinations(data);
        },
        error: function(xhr, status, error) {
            console.error('Error loading destinations:', error);
        }
    });
}

// Function to display destinations
function displayDestinations(destinations) {
    let html = '';
    
    destinations.forEach(destination => {
        html += `
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card destination-card h-100">
                    <img src="${destination.image}" class="card-img-top" alt="${destination.name}">
                    <div class="card-body">
                        <h5 class="card-title">${destination.name}</h5>
                        <p class="card-text">${destination.description}</p>
                        <p class="text-muted"><i class="fas fa-map-pin"></i> ${destination.location}</p>
                    </div>
                </div>
            </div>
        `;
    });
    
    $('#destinations-container').html(html);
}

// Function to load statistics via AJAX
function loadStatistics() {
    // Load blogs
    $.ajax({
        url: 'data/blogs.json',
        type: 'GET',
        dataType: 'json'
    }).done(function(blogs) {
        $('#blog-count').text(blogs.length);
        $('#total-blog-count').text(blogs.length);
    }).fail(function() {
        console.error('Error loading blog count');
    });

    // Load destinations
    $.ajax({
        url: 'data/destinations.json',
        type: 'GET',
        dataType: 'json'
    }).done(function(destinations) {
        $('#destination-count').text(destinations.length);
        $('#total-destination-count').text(destinations.length);
    }).fail(function() {
        console.error('Error loading destination count');
    });

    // Load comments
    $.ajax({
        url: 'data/comments.json',
        type: 'GET',
        dataType: 'json'
    }).done(function(comments) {
        $('#comment-count').text(comments.length);
        $('#total-comment-count').text(comments.length);
    }).fail(function() {
        console.error('Error loading comment count');
    });
}

// Function to get blog details by ID
function getBlogDetails(blogId) {
    return $.ajax({
        url: 'data/blogs.json',
        type: 'GET',
        dataType: 'json'
    }).then(function(blogs) {
        for (let blog of blogs) {
            if (blog.id == blogId) {
                return blog;
            }
        }
        throw new Error('Blog not found');
    });
}

// Function to display blog details
function displayBlogDetails(blog) {
    const date = new Date(blog.created_date);
    const formattedDate = date.toLocaleDateString('en-US', { 
        year: 'numeric', 
        month: 'short', 
        day: 'numeric' 
    });
    
    let html = `
        <div class="blog-header">
            <img src="../${blog.image}" alt="${blog.title}">
        </div>
        <div class="blog-meta mb-3">
            <i class="fas fa-calendar"></i> ${formattedDate}
            <span class="ms-3"><i class="fas fa-user"></i> ${blog.author}</span>
            <span class="ms-3"><i class="fas fa-folder"></i> ${blog.category}</span>
        </div>
        <h1 class="mb-4">${blog.title}</h1>
        <div class="blog-content">
            ${blog.content}
        </div>
    `;
    
    $('#blog-details-container').html(html);
}

// Function to load comments for a blog post
function loadComments(blogId) {
    $.ajax({
        url: 'data/comments.json',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            console.log('Comments loaded:', data);
            // Filter comments by blog_id
            const filteredComments = data.filter(comment => comment.blog_id == blogId);
            // Sort by date (newest first)
            filteredComments.sort(function(a, b) {
                return new Date(b.created_date) - new Date(a.created_date);
            });
            displayComments(filteredComments);
        },
        error: function() {
            console.error('Error loading comments');
        }
    });
}

// Function to display comments
function displayComments(comments) {
    let html = '';
    
    if(comments.length === 0) {
        html = '<p class="text-muted">No comments yet. Be the first to comment!</p>';
    } else {
        comments.forEach(comment => {
            const date = new Date(comment.created_date);
            const formattedDate = date.toLocaleDateString('en-US', { 
                year: 'numeric', 
                month: 'short', 
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit'
            });
            
            html += `
                <div class="comment-item">
                    <div class="comment-author">${comment.name}</div>
                    <div class="comment-date">${formattedDate}</div>
                    <div class="comment-text">${comment.comment}</div>
                </div>
            `;
        });
    }
    
    $('#comments-container').html(html);
}

// Function to save a new comment
function saveComment(blogId, name, email, comment) {
    return $.ajax({
        url: 'php/save_comment.php',
        type: 'POST',
        data: {
            blog_id: blogId,
            name: name,
            email: email,
            comment: comment
        },
        dataType: 'json'
    });
}

// Function to send contact form
function sendContact(name, email, subject, message) {
    return $.ajax({
        url: 'php/send_contact.php',
        type: 'POST',
        data: {
            name: name,
            email: email,
            subject: subject,
            message: message
        },
        dataType: 'json'
    });
}

// Function to format date
function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', { 
        year: 'numeric', 
        month: 'short', 
        day: 'numeric' 
    });
}

// Smooth scrolling for anchor links
$(document).on('click', 'a[href^="#"]', function(e) {
    e.preventDefault();
    const target = $(this.getAttribute('href'));
    if(target.length) {
        $('html, body').stop().animate({
            scrollTop: target.offset().top - 80
        }, 1000);
    }
});

// Add active class to navbar based on current page
$(document).ready(function() {
    const currentPage = window.location.pathname.split('/').pop();
    $('.nav-link').each(function() {
        $(this).toggleClass('active', 
            $(this).attr('href').includes(currentPage) || 
            (currentPage === '' && $(this).attr('href').includes('index'))
        );
    });
});
