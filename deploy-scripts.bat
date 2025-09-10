@echo off
REM Email Data Wallet Service - Git Sync and Deployment Script (Fixed)
REM Created: September 10, 2025

echo 🚀 Email Data Wallet Service - Git Sync and Deployment
echo =======================================================

REM Change to the project directory
cd /d "C:\Users\StevenSprague\OneDrive - Rivetz Corp\Rootz\claud project\rootz-website"

echo.
echo 📂 Current directory: %CD%
echo.

REM Check git status
echo 📋 Git Status:
git status

echo.
echo 📁 Remaining files to commit:
echo - deploy-email-service.bat (this script)
echo - deploy-email-service.sh (Linux version)
echo - ubuntu-deploy.sh (server deployment script)
echo - static/index.html (any updates)

echo.
set /p choice="🤔 Do you want to commit these deployment scripts? (y/n): "

if /i "%choice%"=="y" goto :commit
if /i "%choice%"=="yes" goto :commit
goto :cancel

:commit
echo.
echo ➕ Adding remaining files to git...
git add deploy-email-service.bat
git add deploy-email-service.sh
git add ubuntu-deploy.sh
git add static/index.html

echo.
echo 📝 Committing deployment scripts...
git commit -m "Add deployment scripts for Email Data Wallet Service"

echo.
echo 🚀 Pushing to repository...
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo ✅ SUCCESS: Deployment scripts committed and pushed!
    echo.
    echo 🔄 Your Email Data Wallet Service is now ready for Ubuntu deployment!
) else (
    echo.
    echo ❌ ERROR: Failed to push to repository!
)
goto :end

:cancel
echo.
echo ⏸️ Skipping deployment scripts commit.

:end
echo.
echo 📊 Current Repository Status:
git status --short

echo.
echo 🏁 Ready for Ubuntu server deployment!
echo.
echo 🔄 Next Step: Run Ubuntu deployment
echo SSH Command: ssh ubuntu@rootz.global
pause
