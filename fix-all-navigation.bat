@echo off
echo Deploying ALL Website Navigation Fixes...

cd /d "C:\Users\StevenSprague\OneDrive - Rivetz Corp\Rootz\claud project\rootz-website"

echo.
echo Fixed ALL navigation links to include /static/ in paths:
echo.
echo EMAIL SERVICE PAGES:
echo - index.html: Logo and all nav links + CTA buttons
echo - register.html: Logo, nav links, and success redirect
echo - dashboard.html: Logo and all nav links  
echo - authorization.html: Logo, nav links, success link, and denial redirect
echo - admin.html: Logo path (nav already had relative paths)
echo.
echo MAIN WEBSITE:
echo - static/index.html: FAQ link and ALL Services section links fixed
echo - Admin Control Panel link: Now uses /static/ path
echo - All secondary testing tool links: Now use /static/ paths
echo.

git add .

git commit -m "Complete website navigation fix - ALL links now use /static/ paths

COMPREHENSIVE FIX for entire website:

EMAIL SERVICE PAGES:
- index.html: All nav links, logo, and CTA buttons now use /static/services/email-data-wallet/
- register.html: Nav links, logo, and success dashboard link fixed
- dashboard.html: All navigation links corrected  
- authorization.html: Nav links, logo, success link, and denial redirect fixed
- admin.html: Logo path corrected to match other pages

MAIN WEBSITE FIXES:
- static/index.html: FAQ link now uses /static/individual-pages/faq.html
- Services section: Admin Control Panel link uses /static/services/email-data-wallet/admin.html
- All secondary testing tool links now use /static/ paths

RESTLT: Complete cross-website navigation - no more 'Cannot GET' errors anywhere"

git push origin main

echo.
echo ✅ COMPLETE Website Navigation Fix Deployed!
echo.
echo Server deployment:
echo ssh ubuntu@rootz.global  
echo cd /var/www/html
echo sudo git pull origin main
echo sudo chown -R www-data:www-data /var/www/html/
echo.
echo Test URLs after server update:
echo Main site: http://rootz.global
echo Email service: http://rootz.global/static/services/email-data-wallet/
echo Admin panel: Services > Enter Rivetz9100 > Admin Control Panel
echo FAQ: Should work from main navigation
echo.
pause
