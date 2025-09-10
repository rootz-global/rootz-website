#!/bin/bash

# Website Navigation Verification Script
# Run this on Ubuntu server AFTER deployment to verify all fixes

echo "========================================"
echo "WEBSITE NAVIGATION VERIFICATION TEST"
echo "========================================"
echo

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Test function
test_url() {
    local url=$1
    local description=$2
    
    echo -n "Testing: $description... "
    
    if curl -s -I "$url" | grep -q "200 OK"; then
        echo -e "${GREEN}✓ PASS${NC}"
        return 0
    else
        echo -e "${RED}✗ FAIL${NC}"
        return 1
    fi
}

# Test main website
echo "MAIN WEBSITE TESTS:"
echo "==================="
test_url "http://rootz.global" "Main homepage"
test_url "http://rootz.global/static/individual-pages/faq.html" "FAQ page"

echo

# Test email service pages
echo "EMAIL SERVICE TESTS:"
echo "==================="
test_url "http://rootz.global/static/services/email-data-wallet/" "Email service home"
test_url "http://rootz.global/static/services/email-data-wallet/index.html" "Email service index"
test_url "http://rootz.global/static/services/email-data-wallet/admin.html" "Admin panel"
test_url "http://rootz.global/static/services/email-data-wallet/register.html" "Register page"
test_url "http://rootz.global/static/services/email-data-wallet/dashboard.html" "Dashboard page"
test_url "http://rootz.global/static/services/email-data-wallet/authorization.html" "Authorization page"

echo

# Test additional service tools
echo "TESTING TOOL TESTS:"
echo "==================="
test_url "http://rootz.global/static/services/email-data-wallet/authorization-test.html" "Authorization Test"
test_url "http://rootz.global/static/services/email-data-wallet/complete-flow-test.html" "Complete Flow Test"
test_url "http://rootz.global/static/services/email-data-wallet/direct-test.html" "Direct Test"
test_url "http://rootz.global/static/services/email-data-wallet/signature-test.html" "Signature Test"
test_url "http://rootz.global/static/services/email-data-wallet/authorization-portal.html" "Authorization Portal"
test_url "http://rootz.global/static/services/email-data-wallet/hybrid-authorization-test.html" "Hybrid Authorization"

echo

# Check for common issues
echo "CHECKING FOR COMMON ISSUES:"
echo "============================"

echo -n "Checking for 404 errors in nginx logs... "
if sudo tail -n 50 /var/log/nginx/error.log | grep -q "404"; then
    echo -e "${YELLOW}WARNING: Recent 404 errors found${NC}"
    echo "Recent 404s:"
    sudo tail -n 50 /var/log/nginx/error.log | grep "404" | tail -n 3
else
    echo -e "${GREEN}✓ No recent 404 errors${NC}"
fi

echo

echo -n "Checking file permissions... "
if [ -r "/var/www/html/static/services/email-data-wallet/admin.html" ]; then
    echo -e "${GREEN}✓ Files readable${NC}"
else
    echo -e "${RED}✗ Permission issues detected${NC}"
fi

echo

# Summary
echo "========================================"
echo "VERIFICATION COMPLETE"
echo "========================================"
echo
echo "If all tests show ✓ PASS, the navigation fix was successful!"
echo "If any tests show ✗ FAIL, check the specific URLs manually."
echo
echo "Manual testing recommended:"
echo "1. Visit http://rootz.global"
echo "2. Navigate: Services > Enter 'Rivetz9100' > Admin Control Panel"
echo "3. Test navigation between all email service pages"
echo "4. Verify FAQ link works from main navigation"
echo
echo "For issues, check:"
echo "- sudo systemctl status nginx"
echo "- sudo tail -f /var/log/nginx/error.log"
echo "- ls -la /var/www/html/static/services/email-data-wallet/"
