# Rootz Global Website Project

This directory contains the complete Rootz Global website files showcasing the revolutionary Digital Roots and Data Manufacturing platform.

## Project Structure

### Main Website
- **index.html** - Complete single-page application with JavaScript navigation
- **individual-pages/** - Separate HTML files for each page section

### Email Data Wallet Service
- **static/services/email-data-wallet/** - Complete email wallet blockchain integration service

### Key Features
- Professional green color scheme reflecting the "Rootz" brand
- Responsive design based on Rivetz staging site architecture
- Revolutionary messaging positioning Rootz as originator of Digital Roots and Data Manufacturing
- AI-optimized content structure for search and comprehension

## Digital Root
Rootz Global DBA: **0xD36AAf65a91bB7dc69942cF6B6d1dBa4Ef171664**

## Pages Included

1. **Home** - Main landing page with hero section and innovation overview
2. **Digital Roots** - Blockchain-anchored corporate digital names
3. **Data Manufacturing** - Revolutionary data creation with built-in origin
4. **Use Cases** - Real-world enterprise transformations
5. **Insights** - Blog section with thought leadership content
6. **Contact** - Professional contact forms and company information

## Email Data Wallet Service (NEW)

Located in `static/services/email-data-wallet/`:

1. **index.html** - Service landing page with live system stats
2. **register.html** - User registration with MetaMask integration
3. **dashboard.html** - Real-time dashboard for email processing
4. **authorization.html** - Email wallet authorization portal
5. **admin.html** - Administrative dashboard for system management

### Service Features
- **Blockchain Integration**: Polygon Amoy testnet with smart contracts
- **MetaMask Integration**: Web3 wallet connectivity for user authorization
- **Real-time Monitoring**: Live system status and processing metrics
- **Email Processing**: Transform emails into blockchain DATA_WALLETs
- **Credit System**: User credit management for wallet creation costs
- **Anti-spam Protection**: User authorization required for all wallet creation

### Technical Stack
- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Web3**: Ethers.js v5.7.2 for Polygon compatibility
- **Backend API**: .NET 8 service running on port 5000
- **Blockchain**: Polygon Amoy testnet with smart contracts
- **Storage**: IPFS for distributed email content storage

### Deployment Architecture
- **Frontend**: Served from `/services/email-data-wallet/` path
- **Backend**: .NET 8 Web API on `http://rootz.global:5000`
- **Blockchain**: Smart contracts deployed on Polygon Amoy
- **Access**: Password-protected service portal

## Design Philosophy
- Clean, professional aesthetic inspired by enterprise tech companies
- Green color palette symbolizing growth and digital "roots"
- Modern CSS with custom properties for maintainability
- Mobile-first responsive design
- Professional typography and spacing

## Innovation Language
The website introduces revolutionary terminology:
- **Digital Roots** - Beyond traditional "identity" to cryptographic foundations
- **Data Manufacturing** - Creating data with built-in origin and ownership
- **Origin Verification** - Mathematical proof of data authenticity
- **Corporate Digital Foundation** - Self-sovereign digital presence
- **EMAIL_WALLETs** - Blockchain-verified email assets with provenance

## Technical Features
- CSS custom properties (variables) for consistent theming
- Smooth animations and transitions
- Professional form validation
- Mobile hamburger navigation
- Semantic HTML structure
- Optimized for search engines and AI comprehension
- Web3 blockchain integration
- Real-time API connectivity

## File Usage
- Use **index.html** for the complete interactive website
- Use **individual-pages/*.html** for viewing separate sections
- Use **static/services/email-data-wallet/** for the email wallet service
- All files are self-contained with embedded CSS and JavaScript

## Deployment Instructions

### 1. Git Sync Process
```bash
# Add all new files
git add .

# Commit changes
git commit -m "Add Email Data Wallet Service - Complete frontend integration"

# Push to repository
git push origin main
```

### 2. Ubuntu Server Deployment
```bash
# SSH to server
ssh ubuntu@rootz.global

# Navigate to website directory
cd /var/www/html

# Pull latest changes
git pull origin main

# Set proper permissions
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Restart services if needed
sudo systemctl restart nginx
```

### 3. Service URLs (Post-Deployment)
- **Main Website**: `http://rootz.global`
- **Email Service**: `http://rootz.global/services/email-data-wallet/`
- **Backend API**: `http://rootz.global:5000/api`
- **Health Check**: `http://rootz.global:5000/health`

---
Created: September 2, 2025  
Updated: September 10, 2025 - Added Email Data Wallet Service  
By: Claude for Rootz Global Project  
Location: C:\Users\StevenSprague\OneDrive - Rivetz Corp\Rootz\claud project\rootz-website\
