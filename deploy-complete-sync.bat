@echo off
echo Committing all changes including server redirect file...

cd /d "C:\Users\StevenSprague\OneDrive - Rivetz Corp\Rootz\claud project\rootz-website"

REM Add all changes including the new redirect file
git add .

REM Commit everything
git commit -m "Complete website sync: Add redirect index + fix Services and Admin navigation

- Add index.html redirect to sync with server setup
- Update Services page with prominent Admin Control Panel link  
- Fix admin.html navigation to use relative paths
- Resolve navigation errors across email service interface"

REM Push to remote
git push origin main

echo.
echo ✅ All changes committed and pushed!
echo.
echo Server deployment commands:
echo ssh ubuntu@rootz.global
echo cd /var/www/html
echo sudo git reset --hard HEAD
echo sudo git pull origin main  
echo sudo chown -R www-data:www-data /var/www/html/
echo.
pause
