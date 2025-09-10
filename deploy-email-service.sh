#!/bin/bash
# Email Data Wallet Service - Git Sync and Deployment Script
# Created: September 10, 2025

echo "🚀 Email Data Wallet Service - Git Sync and Deployment"
echo "======================================================="

# Change to the project directory
cd "C:\Users\StevenSprague\OneDrive - Rivetz Corp\Rootz\claud project\rootz-website"

echo ""
echo "📂 Current directory: $(pwd)"
echo ""

# Check git status
echo "📋 Git Status:"
git status

echo ""
echo "📁 Files to be committed:"
echo "- static/services/email-data-wallet/index.html"
echo "- static/services/email-data-wallet/register.html" 
echo "- static/services/email-data-wallet/dashboard.html"
echo "- static/services/email-data-wallet/authorization.html"
echo "- static/services/email-data-wallet/admin.html"
echo "- README.md (updated)"

echo ""
read -p "🤔 Do you want to add these files to git? (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "➕ Adding files to git..."
    git add static/services/email-data-wallet/
    git add README.md
    
    echo ""
    echo "📝 Committing changes..."
    git commit -m "Add Email Data Wallet Service - Complete frontend integration

Features:
- Landing page with live system stats
- User registration with MetaMask integration  
- Real-time dashboard for email processing
- Email wallet authorization portal
- Administrative dashboard for system management

Technical:
- Ethers.js v5.7.2 for Polygon compatibility
- Backend API integration (port 5000)
- Responsive mobile-first design
- Web3 wallet connectivity
- Real-time status monitoring

Deployment ready for http://rootz.global/services/email-data-wallet/"

    echo ""
    echo "🚀 Pushing to repository..."
    git push origin main
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ SUCCESS: Files committed and pushed to repository!"
        echo ""
        echo "🔄 Next Steps for Ubuntu Server Deployment:"
        echo "1. SSH to server: ssh ubuntu@rootz.global"
        echo "2. Navigate to site: cd /var/www/html"  
        echo "3. Pull changes: git pull origin main"
        echo "4. Set permissions: sudo chown -R www-data:www-data /var/www/html/"
        echo "5. Test access: http://rootz.global/services/email-data-wallet/"
        echo ""
        echo "📡 Service URLs after deployment:"
        echo "- Main Service: http://rootz.global/services/email-data-wallet/"
        echo "- Registration: http://rootz.global/services/email-data-wallet/register.html"
        echo "- Dashboard: http://rootz.global/services/email-data-wallet/dashboard.html" 
        echo "- Authorization: http://rootz.global/services/email-data-wallet/authorization.html"
        echo "- Admin Panel: http://rootz.global/services/email-data-wallet/admin.html"
        echo ""
        echo "🔧 Backend Service:"
        echo "- API Base: http://rootz.global:5000/api"
        echo "- Health Check: http://rootz.global:5000/health"
        echo "- Swagger Docs: http://rootz.global:5000/swagger"
    else
        echo ""
        echo "❌ ERROR: Failed to push to repository!"
        echo "Please check your internet connection and git credentials."
    fi
else
    echo ""
    echo "⏸️  Deployment cancelled. Files remain uncommitted."
fi

echo ""
echo "📊 Repository Status:"
git status --short

echo ""
echo "🏁 Deployment script completed."
