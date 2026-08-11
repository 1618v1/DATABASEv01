# 🚀 Deployment Guide — Pilih Platform Anda

---

## 🟢 Option 1: GitHub Pages (RECOMMENDED - FREE)

### Setup
```bash
# Clone atau buat repo baru
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/DATABASE.git
git push -u origin main
```

### Enable GitHub Pages
1. Buka GitHub repository
2. Settings → Pages
3. Source: Branch `main`, folder `/ (root)`
4. Save

### Result
- ✅ URL: `https://YOUR_USERNAME.github.io/DATABASE/`
- ✅ Auto HTTPS (install button akan muncul)
- ✅ Free
- ✅ Auto-update saat push ke main

---

## 🟡 Option 2: Vercel (RECOMMENDED - FASTEST)

### Step 1: Push to GitHub (sama seperti di atas)

### Step 2: Deploy di Vercel
1. Buka https://vercel.com
2. Klik "Add New..." → "Project"
3. Pilih "Import Git Repository"
4. Connect GitHub account
5. Pilih repository `DATABASE`
6. Klik "Deploy"

### Result
- ✅ URL: `https://DATABASE.vercel.app` atau custom domain
- ✅ Auto HTTPS (install button akan muncul)
- ✅ Auto-update setiap push
- ✅ Very fast (global CDN)
- ✅ Free tier cukup untuk small-medium business

---

## 🟣 Option 3: Netlify (ALTERNATIVE)

### Step 1: Push to GitHub

### Step 2: Deploy
1. Buka https://netlify.com
2. Klik "Add new site" → "Import an existing project"
3. Connect GitHub
4. Select repository
5. Deploy settings:
   - Build command: (leave empty)
   - Publish directory: `.` (atau root)
6. Deploy

### Result
- ✅ Free tier bagus
- ✅ Good performance
- ✅ Auto-update

---

## 🔴 Option 4: Manual Host (cPanel, VPS, dll)

### Step 1: Download Files
```
index.html
manifest.json
sw.js
```

### Step 2: Upload via FTP
1. Buka File Manager (cPanel)
2. Upload ketiga file di atas ke `public_html/`
3. Selesai!

### Step 3: Set Permissions
```bash
chmod 644 index.html
chmod 644 manifest.json
chmod 644 sw.js
```

### Important
- ⚠️ **HTTPS Required!** Setup SSL certificate di cPanel
- ⚠️ Jika tidak HTTPS: install button tidak akan muncul
- ✅ Buka di: `https://yourdomain.com`

---

## 🟦 Option 5: AWS S3 + CloudFront

### Step 1: Create S3 Bucket
1. Buka AWS Console
2. S3 → Create bucket → `database-yourname`
3. Properties → Enable "Static website hosting"

### Step 2: Upload Files
1. S3 → Bucket → Upload files
2. Set public permissions

### Step 3: Create CloudFront Distribution
1. CloudFront → Create distribution
2. Origin: S3 bucket
3. Enable caching
4. Setup custom domain + SSL

### Cost
- ~$0.50 per bulan (very cheap)

---

## 📱 Custom Domain

### GitHub Pages + Custom Domain
1. Settings → Pages
2. Custom domain: `database.yourdomain.com`
3. Add DNS record:
   ```
   CNAME  database  yourusername.github.io
   ```
4. Wait 5-10 minutes

### Vercel + Custom Domain
1. Project Settings → Domains
2. Add custom domain
3. Vercel akan beri DNS records
4. Add ke DNS provider Anda

### Netlify + Custom Domain
1. Domain management → Add domain
2. Follow Netlify instructions

---

## 🔐 Setup HTTPS

### GitHub Pages / Vercel / Netlify
✅ **Automatic HTTPS** - tidak perlu setup

### Manual Host / VPS
```bash
# Using Let's Encrypt (Free)
# Via cPanel: 
# Auto Installer → Let's Encrypt

# Or via CLI:
certbot certonly --webroot -w /var/www/html -d yourdomain.com
```

---

## 📊 Performance Comparison

| Platform | Speed | Price | Setup Time | Best For |
|----------|-------|-------|-----------|----------|
| GitHub Pages | Good | Free | 5 min | Small teams |
| Vercel | Excellent | Free | 3 min | **RECOMMENDED** |
| Netlify | Good | Free | 5 min | Alternative |
| cPanel | Good | $5-15/yr | 10 min | Already have hosting |
| AWS S3 | Excellent | $0.50/mo | 20 min | Scale large |

---

## 🔄 Auto-Update Workflow

### GitHub Pages / Vercel / Netlify
Setiap kali push ke GitHub:
1. Git push → GitHub
2. Vercel/Pages auto-detect
3. Auto build & deploy
4. Live dalam 1-2 menit

```bash
# Workflow
git add .
git commit -m "Update features"
git push origin main

# Automatically deployed! 🚀
```

---

## 🐛 Troubleshooting Deployment

### "Domain/URL not working"
- ✅ Wait 5-10 minutes (DNS propagation)
- ✅ Refresh browser (Ctrl+F5)
- ✅ Check DNS records correct

### "HTTPS not working"
- ✅ GitHub Pages / Vercel: automatic
- ✅ Manual host: setup SSL certificate
- ✅ Check domain is in DNS

### "Install button not showing"
- ⚠️ Must be HTTPS!
- ✅ Check manifest.json is accessible
- ✅ Check service worker registered (F12 → Application)

### "Data not syncing"
- ✅ Check Supabase URL & Key correct
- ✅ Check internet connection (status in header)
- ✅ Check Supabase project still active

---

## 📈 Scaling Tips

### For 1-10 users
- ✅ GitHub Pages (Free)
- ✅ Supabase Free tier

### For 10-100 users
- ✅ Vercel Pro ($20/mo)
- ✅ Supabase Pro ($25/mo)

### For 100+ users
- ✅ AWS / Google Cloud
- ✅ Supabase Enterprise
- ✅ Custom backend

---

## 🎯 Recommended Setup

1. **Repository:** GitHub
2. **Hosting:** Vercel
3. **Database:** Supabase Free tier
4. **Domain:** Custom domain via Vercel
5. **SSL:** Automatic

**Total cost:** $0 (Free) → $25/mo (Supabase Pro)

---

## ✅ Post-Deployment Checklist

- [ ] App berjalan di URL publik
- [ ] Install button muncul di header
- [ ] Upload Excel berhasil
- [ ] Data muncul di Supabase
- [ ] Offline mode bekerja
- [ ] Mobile responsive OK
- [ ] Share link ke tim

🎉 **Go live!**
