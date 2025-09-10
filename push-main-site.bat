@echo off
REM Complete Website Deployment - Push All Remaining Files
REM Created: September 10, 2025

echo 🌐 Complete Website Deployment - Push All Remaining Files
echo ============================================================

REM Change to the project directory
cd /d "C:\Users\StevenSprague\OneDrive - Rivetz Corp\Rootz\claud project\rootz-website"

echo.
echo 📂 Current directory: %CD%
echo.

REM Check git status
echo 📋 Current Git Status:
git status

echo.
echo 📁 Files ready to commit:
echo - static/index.html (updated with Services section)
echo - deploy-email-service.bat (email service deployment script)
echo - deploy-email-service.sh (Linux version)
echo - ubuntu-deploy.sh (server deployment script)
echo - deploy-scripts.bat (this script)

echo.
set /p choice="🤔 Do you want to commit all remaining website files? (y/n): "

if /i "%choice%"=="y" goto :commit
if /i "%choice%"=="yes" goto :commit
goto :cancel

:commit
echo.
echo ➕ Adding all remaining files to git...
git add static/index.html
git add deploy-email-service.bat
git add deploy-email-service.sh
git add ubuntu-deploy.sh
git add deploy-scripts.bat

echo.
echo 📝 Committing main website updates and deployment scripts...
git commit -m "Complete website integration with Email Data Wallet Service

Main Site Updates:
- Added Services portal with password protection (Rivetz9100)
- Integrated email data wallet service links
- Enhanced navigation with service access
- Professional service portal integration

Deployment Scripts:
- Windows deployment automation (deploy-email-service.bat)
- Linux deployment support (deploy-email-service.sh)  
- Ubuntu server deployment (ubuntu-deploy.sh)
- Complete deployment workflow automation

Ready for full production deployment to http://rootz.global"

echo.
echo 🚀 Pushing complete website to repository...
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo ✅ SUCCESS: Complete website pushed to repository!
    echo.
    echo 🎉 Your Rootz website is now complete with:
    echo - Main corporate website with Data Wallet information
    echo - Integrated Email Data Wallet Service portal
    echo - Password-protected services access (Rivetz9100)
    echo - Complete deployment automation scripts
    echo.
    echo 🔄 Ready for Ubuntu Server Deployment:
    echo 1. SSH to server: ssh ubuntu@rootz.global
    echo 2. Navigate to site: cd /var/www/html
    echo 3. Pull changes: git pull origin main
    echo 4. Set permissions: sudo chown -R www-data:www-data /var/www/html/
    echo 5. Test main site: http://rootz.global
    echo 6. Test email service: http://rootz.global/services/email-data-wallet/
    echo.
    echo 🌐 Live Website URLs (after deployment):
    echo - Main Website: http://rootz.global
    echo - Services Portal: http://rootz.global (Services section, password: Rivetz9100)
    echo - Email Service: http://rootz.global/services/email-data-wallet/
    echo - Backend API: http://rootz.global:5000/api
    echo - Health Check: http://rootz.global:5000/health
    echo.
    echo 🎯 Next Steps:
    echo 1. Deploy to Ubuntu server using the commands above
    echo 2. Test all website functionality
    echo 3. Verify email service integration
    echo 4. Test backend API connectivity
    echo 5. Confirm Services portal password protection
) else (
    echo.
    echo ❌ ERROR: Failed to push to repository!
    echo Please check your internet connection and git credentials.
    echo You may need to pull latest changes first: git pull origin main
)
goto :end

:cancel
echo.
echo ⏸️ Deployment cancelled. Files remain uncommitted.

:end
echo.
echo 📊 Final Repository Status:
git status --short

echo.
echo 🏁 Website deployment script completed.
echo.
echo 💡 Remember: Your email service is already deployed in git!
echo You can deploy to Ubuntu server even if you skip this step.
pause
