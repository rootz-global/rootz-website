@echo off
echo Pushing navigation fixes to repository...

REM Change to the correct directory
cd /d "C:\Users\StevenSprague\OneDrive - Rivetz Corp\Rootz\claud project\rootz-website"

git add static/services/email-data-wallet/admin.html
git commit -m "Fix email wallet admin navigation - add Testing and Main Site buttons"
git push origin main

echo.
echo ✅ Navigation fixes pushed to repository!
echo.
echo Now run on server:
echo ssh ubuntu@rootz.global
echo cd /var/www/html
echo sudo git pull origin main
echo sudo chown -R www-data:www-data /var/www/html/
echo.
pause