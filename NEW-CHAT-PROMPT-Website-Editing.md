# New Chat Prompt: Rootz Website Editing Project

## Project Context
I'm working on the Rootz website (rootz.global) which showcases revolutionary Data Wallet and Digital Names technology. The website has two main components:

1. **Main Website** - Corporate site explaining Data Wallet concepts
2. **Email Data Wallet Service** - Production service for creating blockchain-verified email wallets

## Current System Status

### Website Structure
- **Main Site:** `http://rootz.global` (redirects to `/static/index.html`)
- **Email Service:** `http://rootz.global/static/services/email-data-wallet/`
- **Admin Panel:** Services section > Password "Rivetz9100" > Admin Control Panel

### Technical Setup
- **Local Development:** `C:\Users\StevenSprague\OneDrive - Rivetz Corp\Rootz\claud project\rootz-website\`
- **Production Server:** Ubuntu at rootz.global with nginx serving static files
- **Repository:** GitHub with automated deployment via git pull
- **File Structure:** All public files under `/static/` directory

### Recent Major Fix (September 10, 2025)
**CRITICAL:** Just completed comprehensive navigation fix - ALL links now use proper `/static/` paths. Navigation was completely broken with "Cannot GET" errors, now fully functional.

## File Locations

### Main Website Files
- **Primary:** `static/index.html` - Main corporate website with all content
- **FAQ:** `static/individual-pages/faq.html`
- **Redirect:** `index.html` (root level) - Simple redirect to static version

### Email Data Wallet Service Pages
- **Home:** `static/services/email-data-wallet/index.html`
- **Admin:** `static/services/email-data-wallet/admin.html` 
- **Register:** `static/services/email-data-wallet/register.html`
- **Dashboard:** `static/services/email-data-wallet/dashboard.html`
- **Authorization:** `static/services/email-data-wallet/authorization.html`
- **Testing Tools:** Various additional HTML files for development/testing

### Backend Integration
- **API Endpoint:** `http://rootz.global:5000` (.NET 8 service)
- **Blockchain:** Polygon Amoy testnet integration
- **Features:** MetaMask integration, email processing, DATA_WALLET creation

## Navigation Standards - CRITICAL

**ALL links must use `/static/` paths:**
```
✅ CORRECT: /static/services/email-data-wallet/admin.html
❌ WRONG:   services/email-data-wallet/admin.html

✅ CORRECT: /static/individual-pages/faq.html  
❌ WRONG:   individual-pages/faq.html
```

**Cross-page navigation patterns:**
- Logo links: Return to appropriate home page
- Nav menus: Consistent across all service pages
- Success redirects: Use proper `/static/` paths
- CTA buttons: Point to correct destinations

## Deployment Workflow

### Local Changes
```bash
cd "C:\Users\StevenSprague\OneDrive - Rivetz Corp\Rootz\claud project\rootz-website"
git add .
git commit -m "Description of changes"
git push origin main
```

### Server Update
```bash
ssh ubuntu@rootz.global
cd /var/www/html
sudo git pull origin main
sudo chown -R www-data:www-data /var/www/html/
```

### Verification
- Test main site: http://rootz.global
- Test email service: http://rootz.global/static/services/email-data-wallet/
- Verify all navigation links work without "Cannot GET" errors

## Content & Design Guidelines

### Brand Identity - Rootz
- **Core Concept:** "In the Future Everything has a Wallet"
- **Technology:** Data Wallets, Digital Names, Data Manufacturing
- **Corporate Digital Name:** 0xD36AAf65a91bB7dc69942cF6B6d1dBa4Ef171664
- **Tagline:** "Data with origin enables the economic recognition of Data as an asset"

### Design System
- **Colors:** Green theme (#2d5016 primary, #4a7c59 secondary)
- **Style:** Professional, modern, tech-forward
- **Components:** Cards, gradients, clean typography
- **Mobile:** Responsive design with mobile navigation

### Content Focus
- **Main Site:** Educational content about Data Wallet revolution
- **Email Service:** Functional interface for blockchain email processing
- **Technical Depth:** Balance accessibility with technical accuracy

## Common Editing Tasks

### Content Updates
- Modify text, add sections, update messaging
- Ensure consistent brand voice and technical accuracy
- Maintain responsive design principles

### Navigation Changes
- **CRITICAL:** Always use `/static/` prefix for internal links
- Test all navigation paths after changes
- Verify mobile navigation works properly

### Styling Modifications
- CSS is embedded in HTML files (no external stylesheets)
- Maintain consistent color scheme and spacing
- Test across desktop and mobile viewports

### Functionality Enhancements
- JavaScript for interactive elements
- MetaMask integration for blockchain features
- Form handling and user interactions

## Key Success Metrics
- Zero "Cannot GET" navigation errors
- Consistent user experience across all pages
- Professional presentation of Data Wallet concepts
- Functional email service workflow
- Mobile-friendly responsive design

## Questions to Ask When Starting
1. What specific pages or sections need editing?
2. Are you updating content, design, functionality, or navigation?
3. Is this for the main corporate site or email service pages?
4. Do you need help with deployment after changes?
5. Are there any new features or sections to add?

---

**Status:** Navigation system fully functional as of September 10, 2025  
**Priority:** Maintain `/static/` path consistency in all future edits  
**Documentation:** See DEPLOYMENT-UPDATE-Navigation-Fix-Sept-10-2025.md for recent fixes
