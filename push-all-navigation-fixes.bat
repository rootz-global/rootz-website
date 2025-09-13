@echo off
echo Adding all email wallet navigation updates...

cd /d "C:\Users\StevenSprague\OneDrive - Rivetz Corp\Rootz\claud project\rootz-website"

REM Add all the modified files
git add static/services/email-data-wallet/authorization.html
git add static/services/email-data-wallet/dashboard.html  
git add static/services/email-data-wallet/index.html
git add static/services/email-data-wallet/register.html
git add static/services/email-data-wallet/admin.html
git add static/services/email-data-wallet/test-scripts.html

git commit -m "Complete email wallet navigation fixes - all pages now have consistent 7-button navigation with Testing and Main Site buttons"

git push origin main

echo.
echo ✅ All email wallet navigation fixes pushed!
echo.
echo Now run on server:
echo ssh ubuntu@rootz.global  
echo cd /var/www/html
echo sudo git pull origin main
echo sudo chown -R www-data:www-data /var/www/html/
echo.
pause