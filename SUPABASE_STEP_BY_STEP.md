# 🗄️ Supabase Setup — Step by Step

## Langkah 1: Buat Akun Supabase

1. Buka https://supabase.com
2. Klik **"Sign Up"**
3. Pilih metode login (Google, GitHub, atau email)
4. Verifikasi email

---

## Langkah 2: Buat Project

1. Setelah login, klik **"New Project"**
2. Isi form:
   - **Name:** `DATABASE` (atau nama lain)
   - **Database Password:** Buat password kuat (save it!)
   - **Region:** Pilih `Singapore` atau `ap-southeast-1` (paling dekat untuk Indonesia)
3. Klik **"Create new project"**
4. ⏳ Tunggu 2-3 menit sampai selesai

---

## Langkah 3: Setup Database Schema

### 3A. Buka SQL Editor

Setelah project selesai:
1. Klik **"SQL Editor"** di sidebar kiri
2. Klik **"New Query"**

### 3B. Copy-Paste SQL

Buka file `SUPABASE_SETUP.sql`, copy SELURUH isinya.

Paste ke SQL Editor, lalu klik **"Run"** (Ctrl+Enter).

✅ Seharusnya semua berhasil, output: `Query executed successfully`

### 3C. Verifikasi Tabel

Di sidebar kiri, buka **"Database"** → **"Tables"** → Harusnya ada:
- `audit_log`
- `sales_data`
- `stok_data`

---

## Langkah 4: Ambil API Keys

### 4A. Buka Settings → API

1. Di sidebar, klik **"Settings"** (gear icon)
2. Pilih **"API"**
3. Lihat bagian "Project API keys"

### 4B. Copy Credentials

Ada 2 key penting:

```
┌─────────────────────────────────────────────────────────┐
│ Project URL (Service role)                              │
│ https://hqncomzsdegqukpaeydd.supabase.co                │  ← Copy ini
└─────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────┐
│ anon public (NEXT: sb_publishable_...)                  │
│ sb_publishable_e8eJOfNcckNcUpdCc5SrnQ_7GQR9hiB         │  ← Copy ini
└─────────────────────────────────────────────────────────┘
```

**PENTING:** 
- ✅ Gunakan `anon public` key untuk frontend
- ⚠️ Jangan share `service_role` key

---

## Langkah 5: Update HTML

Edit `index.html`, cari baris ~11-12:

```javascript
const SUPABASE_URL = 'https://hqncomzsdegqukpaeydd.supabase.co';
const SUPABASE_KEY = 'sb_publishable_e8eJOfNcckNcUpdCc5SrnQ_7GQR9hiB';
```

Ganti dengan nilai yang sudah di-copy:

```javascript
const SUPABASE_URL = 'YOUR_PROJECT_URL_HERE';
const SUPABASE_KEY = 'YOUR_ANON_KEY_HERE';
```

**Contoh:**
```javascript
const SUPABASE_URL = 'https://abcdefghijk.supabase.co';
const SUPABASE_KEY = 'sb_publishable_xyz123...';
```

Save file.

---

## Langkah 6: Test Koneksi

### 6A. Local Testing
1. Buka `index.html` dengan browser (Chrome recommended)
2. Lihat header → status "Tersync" (hijau)
3. Upload file Excel penjualan

### 6B. Verify di Supabase
1. Kembali ke Supabase Dashboard
2. Klik **"Table Editor"**
3. Pilih tabel `sales_data`
4. Harusnya data yang di-upload muncul di sini ✓

---

## 🔒 Security (Production)

Untuk production dengan sensitive data, uncomment bagian "AUTHENTICATED USERS ONLY" di `SUPABASE_SETUP.sql`:

1. Buka SQL Editor lagi
2. Cari komentar `-- SECURITY:`
3. Uncomment baris-baris policy
4. Run query

Sekarang hanya user yang login yang bisa akses data.

---

## 📊 Monitor Database

### Cek Usage
1. Settings → **"Usage"**
2. Lihat berapa banyak data sudah digunakan
3. Free tier: 500MB (cukup untuk jutaan baris)

### Backup Data
1. Settings → **"Backups"**
2. Supabase auto-backup setiap hari
3. Bisa restore dari backup lama jika perlu

---

## 🐛 Troubleshooting

| Error | Solusi |
|-------|--------|
| "Connection failed" | Cek URL & key benar, pastikan online |
| "Table does not exist" | Run SQL setup script lagi |
| "Permission denied" | Cek policy RLS di Table settings |
| "quota exceeded" | Upgrade ke paid plan |

---

## ✅ Checklist

- [ ] Akun Supabase sudah dibuat
- [ ] Project selesai di-setup
- [ ] SQL script sudah di-run
- [ ] Tabel `sales_data` & `stok_data` ada
- [ ] URL & Anon Key sudah di-copy
- [ ] HTML sudah di-update dengan keys
- [ ] Test koneksi berhasil
- [ ] Data upload muncul di Supabase

---

## 🎉 Selesai!

Database sudah siap untuk multi-user sync real-time. Setiap orang yang buka link akan:
- ✅ Lihat data yang sama
- ✅ Update otomatis saat ada perubahan
- ✅ Bekerja offline, sync saat online
