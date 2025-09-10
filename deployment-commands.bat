@echo off
echo Deploying Email Data Wallet Service updates...

REM Navigate to repository directory
cd /d "C:\Users\StevenSprague\OneDrive - Rivetz Corp\Rootz\claud project\rootz-website"

REM Add all changes
git add .

REM Commit with descriptive message
git commit -m "Fix: Update Services page and Admin panel navigation

- Add Admin Control Panel as primary link in Services section
- Fix navigation links in admin.html to use relative paths
- Resolve 'Cannot GET' errors in email service navigation
- Improve user experience with prominent admin panel access"

REM Push to remote repository
git push origin main

echo.
echo ✅ Changes deployed to git repository!
echo.
echo Next steps:
echo 1. SSH to your Ubuntu server
echo 2. Run: cd /var/www/html && sudo git pull origin main
echo 3. Test the updated website at http://rootz.global
echo.
pause
