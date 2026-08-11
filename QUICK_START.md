# ⚡ Quick Start — Setup dalam 5 Menit

## 📋 Checklist

### 1️⃣ Supabase Setup (2 menit)
- [ ] Login ke https://supabase.com
- [ ] Buat project baru
- [ ] Buka SQL Editor
- [ ] Copy-paste script tabel dari `SETUP_GUIDE.md`
- [ ] Settings → API → Copy URL & Anon Key

### 2️⃣ Update File (1 menit)
**Edit baris 11-12 di `index.html`:**
```javascript
const SUPABASE_URL = 'YOUR_PROJECT_URL'; // Ganti ini
const SUPABASE_KEY = 'YOUR_ANON_KEY';    // Ganti ini
```

### 3️⃣ Deploy (1 menit)
Pilih salah satu:

**Option A: GitHub Pages**
```bash
git add .
git commit -m "Update"
git push
# Siap di: https://username.github.io/DATABASE
```

**Option B: Vercel** 
- Buka vercel.com
- Import repository GitHub
- Deploy automatic

**Option C: Manual Host**
- Upload file ke web server (cPanel, etc)
- Buka di browser

### 4️⃣ Test (1 menit)
- [ ] Buka aplikasi
- [ ] Lihat status "Tersync" di header
- [ ] Coba upload Excel penjualan
- [ ] Lihat data masuk ke Supabase → SQL Editor
- [ ] Klik tombol "📲 Install" di header
- [ ] Test offline mode (disconnect internet)

---

## 🚨 Penting!

### HTTPS Required untuk Install Button
- ✅ GitHub Pages: otomatis HTTPS
- ✅ Vercel: otomatis HTTPS  
- ⚠️ Local/HTTP: button tidak muncul (normal)

### Supabase Limits
- ✅ Free tier: 500MB storage, cukup untuk 100k+ data penjualan
- ⚠️ Jika >10 user akses bersamaan: upgrade ke paid

---

## 📱 Testing Multi-User Sync

1. **User A:** Buka app di Chrome, upload Excel
2. **User B:** Buka app di Firefox (tab baru)
3. **Lihat:** Data User A otomatis muncul di User B ✓

---

## 🔗 Links Penting

- Supabase Dashboard: https://app.supabase.com
- GitHub Pages: https://pages.github.com
- Vercel: https://vercel.com
- PWA Tools: https://web.dev/progressive-web-apps/

---

## 💡 Tips

1. **Backup Regular**: Export data dari Supabase Dashboard (CSV)
2. **Password Protection**: Tambahkan Auth Supabase jika data sensitive
3. **Custom Domain**: Hubungkan domain sendiri di Vercel/GitHub
4. **Mobile App**: PWA ini bisa di-home screen seperti native app

---

## ❓ Common Issues

| Issue | Solution |
|-------|----------|
| "URL/Key salah" | Cek Settings → API di Supabase |
| "Data tidak sync" | Tunggu koneksi internet, cek status di header |
| "Offline tidak jalan" | Clear cache browser, reload F5 |
| "Install button tidak ada" | Pastikan HTTPS, buka di Chrome/Edge |

---

## 🎉 Selesai!

Aplikasi siap digunakan dengan:
- ✅ Data real-time sync
- ✅ Offline mode
- ✅ Bisa diinstall sebagai app
- ✅ Multi-user support
