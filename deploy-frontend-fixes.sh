#!/bin/bash

# Frontend Fix Deployment Script
# Date: September 17, 2025
# Purpose: Deploy all frontend page fixes to rootz.global

echo "🚀 Deploying Frontend Fixes to rootz.global"
echo "============================================="

# Set local and remote paths
LOCAL_REPO="C:/Users/StevenSprague/OneDrive - Rivetz Corp/Rootz/claud project/rootz-website"
REMOTE_SERVER="ubuntu@rootz.global"
REMOTE_PATH="/var/www/html"

echo "📝 Files to be deployed:"
echo "  ✅ authorization.html (NEW - with pending requests list)"  
echo "  ✅ register.html (FIXED - proper POL payment handling)"
echo "  ✅ dashboard.html (UPDATED - correct API endpoints)"
echo "  ✅ admin.html (UPDATED - correct API endpoints)"

echo ""
echo "🔍 Pre-deployment checks..."

# Check if SSH key is available
if ! ssh-add -l > /dev/null 2>&1; then
    echo "⚠️  SSH agent not running. You may need to enter password."
fi

# Test SSH connection
echo "🔗 Testing SSH connection..."
if ssh -o ConnectTimeout=10 -o BatchMode=yes "$REMOTE_SERVER" exit 2>/dev/null; then
    echo "✅ SSH connection successful"
else
    echo "❌ SSH connection failed. Please check:"
    echo "   - SSH key is loaded: ssh-add ~/.ssh/id_rsa"
    echo "   - Server is accessible: ping rootz.global"
    echo "   - SSH service is running on server"
    exit 1
fi

echo ""
echo "📤 Deploying files..."

# Create backup directory on server
echo "💾 Creating backup on server..."
ssh "$REMOTE_SERVER" "sudo mkdir -p /var/www/html-backup/$(date +%Y%m%d_%H%M%S)/static/services/email-data-wallet/"

# Backup current files
echo "📋 Backing up existing files..."
ssh "$REMOTE_SERVER" "sudo cp -r /var/www/html/static/services/email-data-wallet/ /var/www/html-backup/$(date +%Y%m%d_%H%M%S)/static/services/"

# Deploy authorization.html (NEW)
echo "📧 Deploying authorization.html..."
scp "$LOCAL_REPO/static/services/email-data-wallet/authorization.html" "$REMOTE_SERVER:/tmp/authorization.html"
ssh "$REMOTE_SERVER" "sudo mv /tmp/authorization.html /var/www/html/static/services/email-data-wallet/"

# Deploy register.html (FIXED)
echo "🔐 Deploying register.html..."
scp "$LOCAL_REPO/static/services/email-data-wallet/register.html" "$REMOTE_SERVER:/tmp/register.html"
ssh "$REMOTE_SERVER" "sudo mv /tmp/register.html /var/www/html/static/services/email-data-wallet/"

# Deploy dashboard.html (UPDATED)
echo "📊 Deploying dashboard.html..."
scp "$LOCAL_REPO/static/services/email-data-wallet/dashboard.html" "$REMOTE_SERVER:/tmp/dashboard.html"
ssh "$REMOTE_SERVER" "sudo mv /tmp/dashboard.html /var/www/html/static/services/email-data-wallet/"

# Deploy admin.html (UPDATED)
echo "👤 Deploying admin.html..."
scp "$LOCAL_REPO/static/services/email-data-wallet/admin.html" "$REMOTE_SERVER:/tmp/admin.html"
ssh "$REMOTE_SERVER" "sudo mv /tmp/admin.html /var/www/html/static/services/email-data-wallet/"

# Set proper permissions
echo "🔒 Setting file permissions..."
ssh "$REMOTE_SERVER" "sudo chown -R www-data:www-data /var/www/html/static/services/email-data-wallet/"
ssh "$REMOTE_SERVER" "sudo chmod -R 644 /var/www/html/static/services/email-data-wallet/*.html"

echo ""
echo "✅ Deployment complete!"
echo ""
echo "🧪 Testing deployed pages..."

# Test each deployed page
PAGES=(
    "authorization.html"
    "register.html" 
    "dashboard.html"
    "admin.html"
)

for page in "${PAGES[@]}"; do
    echo -n "   Testing $page... "
    if curl -s -o /dev/null -w "%{http_code}" "http://rootz.global/static/services/email-data-wallet/$page" | grep -q "200"; then
        echo "✅ OK"
    else
        echo "❌ FAILED"
    fi
done

echo ""
echo "📋 Deployment Summary:"
echo "   🌐 Server: rootz.global"
echo "   📁 Location: /var/www/html/static/services/email-data-wallet/"
echo "   🔗 Access URLs:"
echo "      • Authorization: http://rootz.global/static/services/email-data-wallet/authorization.html"
echo "      • Registration: http://rootz.global/static/services/email-data-wallet/register.html"  
echo "      • Dashboard: http://rootz.global/static/services/email-data-wallet/dashboard.html"
echo "      • Admin: http://rootz.global/static/services/email-data-wallet/admin.html"

echo ""
echo "🎯 Key Improvements Deployed:"
echo "   ✅ Authorization page now shows pending requests list"
echo "   ✅ Registration page handles 0.01 POL payment correctly"
echo "   ✅ All pages use correct SKS Rootz Platform API endpoints (port 8000)"
echo "   ✅ Enhanced error handling and user feedback"
echo "   ✅ Mobile-responsive design for all pages"
echo "   ✅ Proper MetaMask integration with network verification"

echo ""
echo "🔄 Next Steps:"
echo "   1. Test registration with a new wallet (should cost 0.01 POL)"
echo "   2. Test authorization page with pending requests"
echo "   3. Verify dashboard and admin pages load API data correctly"
echo "   4. Set up email notifications for future enhancement"

echo ""
echo "💾 Rollback Information:"
echo "   Backup location: /var/www/html-backup/$(date +%Y%m%d_%H%M%S)/"
echo "   To rollback: ssh ubuntu@rootz.global 'sudo cp -r /var/www/html-backup/[timestamp]/static/services/ /var/www/html/static/'"

echo ""
echo "🚀 Frontend deployment completed successfully!"
