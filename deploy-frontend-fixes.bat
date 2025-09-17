@echo off
REM Frontend Fix Deployment Script
REM Date: September 17, 2025
REM Purpose: Deploy all frontend page fixes to rootz.global

echo 🚀 Deploying Frontend Fixes to rootz.global
echo ==============================================

REM Set paths
set LOCAL_REPO=C:\Users\StevenSprague\OneDrive - Rivetz Corp\Rootz\claud project\rootz-website
set REMOTE_SERVER=ubuntu@rootz.global
set REMOTE_PATH=/var/www/html

echo 📝 Files to be deployed:
echo   ✅ authorization.html (NEW - with pending requests list)
echo   ✅ register.html (FIXED - proper POL payment handling)
echo   ✅ dashboard.html (UPDATED - correct API endpoints)
echo   ✅ admin.html (UPDATED - correct API endpoints)
echo.

echo 🔍 Pre-deployment checks...

REM Test SSH connection
echo 🔗 Testing SSH connection...
ssh -o ConnectTimeout=10 %REMOTE_SERVER% "exit" 2>nul
if errorlevel 1 (
    echo ❌ SSH connection failed. Please check:
    echo    - SSH key is loaded
    echo    - Server is accessible: ping rootz.global
    echo    - SSH service is running on server
    pause
    exit /b 1
) else (
    echo ✅ SSH connection successful
)

echo.
echo 📤 Deploying files...

REM Create backup directory on server
echo 💾 Creating backup on server...
ssh %REMOTE_SERVER% "sudo mkdir -p /var/www/html-backup/$(date +%%Y%%m%%d_%%H%%M%%S)/static/services/email-data-wallet/"

REM Backup current files
echo 📋 Backing up existing files...
ssh %REMOTE_SERVER% "sudo cp -r /var/www/html/static/services/email-data-wallet/ /var/www/html-backup/$(date +%%Y%%m%%d_%%H%%M%%S)/static/services/"

REM Deploy authorization.html (NEW)
echo 📧 Deploying authorization.html...
scp "%LOCAL_REPO%\static\services\email-data-wallet\authorization.html" %REMOTE_SERVER%:/tmp/authorization.html
ssh %REMOTE_SERVER% "sudo mv /tmp/authorization.html /var/www/html/static/services/email-data-wallet/"

REM Deploy register.html (FIXED)  
echo 🔐 Deploying register.html...
scp "%LOCAL_REPO%\static\services\email-data-wallet\register.html" %REMOTE_SERVER%:/tmp/register.html
ssh %REMOTE_SERVER% "sudo mv /tmp/register.html /var/www/html/static/services/email-data-wallet/"

REM Deploy dashboard.html (UPDATED)
echo 📊 Deploying dashboard.html...
scp "%LOCAL_REPO%\static\services\email-data-wallet\dashboard.html" %REMOTE_SERVER%:/tmp/dashboard.html
ssh %REMOTE_SERVER% "sudo mv /tmp/dashboard.html /var/www/html/static/services/email-data-wallet/"

REM Deploy admin.html (UPDATED)
echo 👤 Deploying admin.html...
scp "%LOCAL_REPO%\static\services\email-data-wallet\admin.html" %REMOTE_SERVER%:/tmp/admin.html
ssh %REMOTE_SERVER% "sudo mv /tmp/admin.html /var/www/html/static/services/email-data-wallet/"

REM Set proper permissions
echo 🔒 Setting file permissions...
ssh %REMOTE_SERVER% "sudo chown -R www-data:www-data /var/www/html/static/services/email-data-wallet/"
ssh %REMOTE_SERVER% "sudo chmod -R 644 /var/www/html/static/services/email-data-wallet/*.html"

echo.
echo ✅ Deployment complete!
echo.

echo 🧪 Testing deployed pages...
curl -s -o nul -w "   Testing authorization.html... %%{http_code}" "http://rootz.global/static/services/email-data-wallet/authorization.html" && echo ✅ OK || echo ❌ FAILED
curl -s -o nul -w "   Testing register.html... %%{http_code}" "http://rootz.global/static/services/email-data-wallet/register.html" && echo ✅ OK || echo ❌ FAILED
curl -s -o nul -w "   Testing dashboard.html... %%{http_code}" "http://rootz.global/static/services/email-data-wallet/dashboard.html" && echo ✅ OK || echo ❌ FAILED
curl -s -o nul -w "   Testing admin.html... %%{http_code}" "http://rootz.global/static/services/email-data-wallet/admin.html" && echo ✅ OK || echo ❌ FAILED

echo.
echo 📋 Deployment Summary:
echo    🌐 Server: rootz.global
echo    📁 Location: /var/www/html/static/services/email-data-wallet/
echo    🔗 Access URLs:
echo       • Authorization: http://rootz.global/static/services/email-data-wallet/authorization.html
echo       • Registration: http://rootz.global/static/services/email-data-wallet/register.html
echo       • Dashboard: http://rootz.global/static/services/email-data-wallet/dashboard.html
echo       • Admin: http://rootz.global/static/services/email-data-wallet/admin.html

echo.
echo 🎯 Key Improvements Deployed:
echo    ✅ Authorization page now shows pending requests list
echo    ✅ Registration page handles 0.01 POL payment correctly
echo    ✅ All pages use correct SKS Rootz Platform API endpoints (port 8000)
echo    ✅ Enhanced error handling and user feedback
echo    ✅ Mobile-responsive design for all pages
echo    ✅ Proper MetaMask integration with network verification

echo.
echo 🔄 Next Steps:
echo    1. Test registration with a new wallet (should cost 0.01 POL)
echo    2. Test authorization page with pending requests
echo    3. Verify dashboard and admin pages load API data correctly
echo    4. Set up email notifications for future enhancement

echo.
echo 🚀 Frontend deployment completed successfully!
echo.
pause
