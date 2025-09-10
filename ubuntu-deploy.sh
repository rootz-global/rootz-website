#!/bin/bash
# Ubuntu Server Deployment Script for Email Data Wallet Service
# Run this on the Ubuntu server at rootz.global after git push
# Created: September 10, 2025

echo "🌐 Ubuntu Server - Email Data Wallet Service Deployment"
echo "========================================================"

# Check if running as root or with sudo access
if [[ $EUID -eq 0 ]]; then
   echo "⚠️  This script should not be run as root directly."
   echo "Please run as ubuntu user with sudo access."
   exit 1
fi

echo ""
echo "📂 Current user: $(whoami)"
echo "📂 Current directory: $(pwd)"

# Navigate to website directory
echo ""
echo "🔄 Navigating to website directory..."
cd /var/www/html

if [ ! -d ".git" ]; then
    echo "❌ ERROR: Not a git repository!"
    echo "Please ensure /var/www/html is a git repository."
    exit 1
fi

echo ""
echo "📋 Current git status:"
git status

echo ""
echo "🔄 Pulling latest changes from repository..."
git pull origin main

if [ $? -eq 0 ]; then
    echo "✅ Git pull successful!"
else
    echo "❌ Git pull failed!"
    exit 1
fi

echo ""
echo "📁 Checking if email service files exist..."
if [ -f "static/services/email-data-wallet/index.html" ]; then
    echo "✅ Email service files found!"
else
    echo "❌ Email service files not found!"
    echo "Please verify the git push completed successfully."
    exit 1
fi

echo ""
echo "🔧 Setting proper file permissions..."
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

echo ""
echo "📊 Verifying file permissions..."
ls -la static/services/email-data-wallet/

echo ""
echo "🔄 Testing nginx configuration..."
sudo nginx -t

if [ $? -eq 0 ]; then
    echo "✅ Nginx configuration is valid!"
    
    echo ""
    echo "🔄 Reloading nginx..."
    sudo systemctl reload nginx
    
    if [ $? -eq 0 ]; then
        echo "✅ Nginx reloaded successfully!"
    else
        echo "⚠️ Nginx reload failed, but configuration is valid."
    fi
else
    echo "❌ Nginx configuration has errors!"
    echo "Please check the nginx configuration."
fi

echo ""
echo "🏥 Checking backend service status..."
if systemctl is-active --quiet email-wallet-service; then
    echo "✅ Email wallet backend service is running!"
    
    echo ""
    echo "🔍 Testing backend API connectivity..."
    response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:5000/health)
    
    if [ "$response" = "200" ]; then
        echo "✅ Backend API is responding correctly!"
    else
        echo "⚠️ Backend API not responding (HTTP $response)"
        echo "You may need to start or restart the backend service."
    fi
else
    echo "⚠️ Email wallet backend service is not running!"
    echo "You may need to start the backend service:"
    echo "sudo systemctl start email-wallet-service"
fi

echo ""
echo "🌐 Testing frontend accessibility..."
response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/services/email-data-wallet/)

if [ "$response" = "200" ]; then
    echo "✅ Frontend is accessible!"
else
    echo "⚠️ Frontend not accessible (HTTP $response)"
fi

echo ""
echo "📡 Deployment completed! Service URLs:"
echo "- Main Service: http://rootz.global/services/email-data-wallet/"
echo "- Registration: http://rootz.global/services/email-data-wallet/register.html"
echo "- Dashboard: http://rootz.global/services/email-data-wallet/dashboard.html"
echo "- Authorization: http://rootz.global/services/email-data-wallet/authorization.html"
echo "- Admin Panel: http://rootz.global/services/email-data-wallet/admin.html"

echo ""
echo "🔧 Backend API URLs:"
echo "- Health Check: http://rootz.global:5000/health"
echo "- API Base: http://rootz.global:5000/api"
echo "- Swagger Docs: http://rootz.global:5000/swagger"

echo ""
echo "📋 Post-Deployment Checklist:"
echo "□ Test frontend loads correctly"
echo "□ Test MetaMask connection works"
echo "□ Test backend API connectivity"
echo "□ Verify registration process"
echo "□ Check dashboard functionality"
echo "□ Test authorization flow"
echo "□ Verify admin panel access"

echo ""
echo "🏁 Server deployment script completed!"

# Show final status
echo ""
echo "📊 Final System Status:"
echo "- Nginx: $(systemctl is-active nginx)"
echo "- Email Service: $(systemctl is-active email-wallet-service 2>/dev/null || echo 'not configured')"
echo "- Git Status: $(git log --oneline -1)"

echo ""
echo "💡 If you encounter issues:"
echo "1. Check nginx logs: sudo tail -f /var/log/nginx/error.log"
echo "2. Check service logs: sudo journalctl -f -u email-wallet-service"
echo "3. Test URLs manually in browser"
echo "4. Verify firewall settings for ports 80 and 5000"
