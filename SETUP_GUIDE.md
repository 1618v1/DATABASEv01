# 📱 DATABASE App — Setup Guide

## ✅ Yang Sudah Ditambahkan

### 1. **Integrasi Supabase (Real-time Sync)**
- Data penjualan dan stok tersimpan di cloud Supabase
- Otomatis sinkronisasi ketika online
- Tampilan status sync di header (✓ Tersync / ⚠️ Offline / ❌ Error)

### 2. **PWA (Progressive Web App)**
- ✅ Tombol "📲 Install" muncul di browser
- ✅ Bisa diakses offline (dengan Service Worker)
- ✅ Icon di home screen (Android & iOS)
- ✅ Standalone mode (full screen tanpa address bar)

### 3. **Offline-First Architecture**
- Data tersimpan di IndexedDB (browser local storage)
- Sinkronisasi ke Supabase saat online
- Bekerja sempurna tanpa internet

---

## 🚀 Setup Supabase (PENTING!)

### Step 1: Buat Project Supabase
1. Buka https://supabase.com
2. Klik "Sign Up" atau "Sign In"
3. Buat project baru → pilih region terdekat (Singapore/Indonesia jika ada)
4. Tunggu project selesai di-create

### Step 2: Buat Tabel `sales_data`

Buka **SQL Editor** di Supabase, copy-paste kode ini:

```sql
CREATE TABLE sales_data (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  data JSONB NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- Enable Row Level Security (opsional, untuk keamanan)
ALTER TABLE sales_data ENABLE ROW LEVEL SECURITY;

-- Public access (ganti dengan policy yang lebih aman di production)
CREATE POLICY "Enable public access" ON sales_data
  FOR ALL USING (true) WITH CHECK (true);
```

### Step 3: Buat Tabel `stok_data`

```sql
CREATE TABLE stok_data (
  id TEXT PRIMARY KEY,
  produk TEXT NOT NULL,
  tgl DATE NOT NULL,
  stok_awal INTEGER DEFAULT 0,
  masuk INTEGER DEFAULT 0,
  keluar INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

ALTER TABLE stok_data ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Enable public access" ON stok_data
  FOR ALL USING (true) WITH CHECK (true);
```

### Step 4: Ambil API Keys

1. Buka **Settings** → **API**
2. Copy:
   - **Project URL** (sudah ada di kode: `https://hqncomzsdegqukpaeydd.supabase.co`)
   - **Publishable Key** (anon key - sudah ada di kode: `sb_publishable_e8eJOfNcckNcUpdCc5SrnQ_7GQR9hiB`)

✅ **Keys sudah benar di kode, langsung bisa digunakan!**

---

## 📁 Struktur File yang Dibutuhkan

```
your-project/
├── index.html          (HTML utama - sudah dibuat)
├── manifest.json       (PWA manifest - sudah dibuat)
├── sw.js              (Service Worker - sudah dibuat)
└── README.md          (dokumentasi)
```

---

## 🌐 Deploy ke GitHub Pages (Gratis)

### Step 1: Upload ke GitHub

```bash
# Di folder project
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/DATABASE.git
git push -u origin main
```

### Step 2: Enable GitHub Pages

1. Buka GitHub repository
2. Settings → Pages
3. Branch: `main`, folder: `/ (root)`
4. Save

✅ Siap diakses di: `https://YOUR_USERNAME.github.io/DATABASE/`

---

## 🔧 Deploy ke Vercel (Alternatif, Recommended)

### Step 1: Push ke GitHub (sama seperti di atas)

### Step 2: Deploy di Vercel

1. Buka https://vercel.com
2. Click "Import Project"
3. Pilih repository GitHub
4. Deploy selesai! 🎉

---

## 💾 Cara Menggunakan

### Upload Data Penjualan
1. Klik **"📤 Upload Excel"** di tab Data Penjualan
2. Pilih file Excel dengan struktur:
   ```
   | Toko | Produk | Tanggal    | Harga | Qty | Total | Status | Bayar |
   |------|--------|------------|-------|-----|-------|--------|-------|
   | ... | ... | ... | ... | ... | ... | ... | ... |
   ```
3. Data tersimpan offline + sync ke Supabase

### Input Stok Manual
1. Tab **"📦 Stok Gudang"**
2. Pilih produk atau tambah baru
3. Isi tanggal, stok awal, masuk, keluar
4. Klik **"➕ Input Manual"**

### Offline Mode
- ✅ Semua fitur bekerja tanpa internet
- ✅ Data tersimpan di browser (IndexedDB)
- ⚠️ Sinkronisasi otomatis saat online

---

## 🔒 Security Tips (PRODUCTION)

Untuk production, ubah Row Level Security policy:

```sql
-- Hanya allow authenticated users
CREATE POLICY "Allow authenticated users" ON sales_data
  FOR ALL 
  USING (auth.role() = 'authenticated')
  WITH CHECK (auth.role() = 'authenticated');
```

Atau gunakan API key yang berbeda untuk read/write.

---

## 🐛 Troubleshooting

### ❓ "Tombol Install tidak muncul"
- ✅ Pastikan HTTPS (di production)
- ✅ Service Worker sudah registered
- ✅ Manifest.json valid
- ✅ Buka di desktop/mobile Chrome

### ❓ "Data tidak sync ke Supabase"
- ✅ Cek koneksi internet (lihat status di header)
- ✅ Pastikan URL & key Supabase benar
- ✅ Cek di Supabase Dashboard → Tabel `sales_data` & `stok_data`

### ❓ "Service Worker error"
- ✅ Cek console (F12 → Console tab)
- ✅ Clear cache: DevTools → Application → Clear storage

---

## 📊 Database Schema

### sales_data
```json
{
  "id": "sale_xxxxx",
  "data": {
    "sheet": "Sheet1",
    "toko": "Toko A",
    "produk": "Barang X",
    "tanggal": "2024-01-15",
    "harga": 50000,
    "qty": 2,
    "total": 100000,
    "status": "Lunas",
    "bayar": 100000,
    "sisa": 0
  }
}
```

### stok_data
```json
{
  "id": "stok_xxxxx",
  "produk": "barang x",
  "tgl": "2024-01-15",
  "stok_awal": 10,
  "masuk": 5,
  "keluar": 3
}
```

---

## 🎯 Features Checklist

- ✅ Upload Excel penjualan
- ✅ Filter by Toko, Sheet, Bulan, Status
- ✅ Ringkasan penjualan (total, terbayar, utang)
- ✅ Input stok manual
- ✅ Filter stok by bulan
- ✅ Dark/Light mode
- ✅ Offline-first dengan IndexedDB
- ✅ Real-time sync ke Supabase
- ✅ PWA installable
- ✅ Service Worker caching
- ✅ Responsive design (mobile-friendly)

---

## 📝 Next Steps

1. ✅ Copy file (index.html, manifest.json, sw.js) ke hosting
2. ✅ Setup Supabase (buat tabel)
3. ✅ Deploy ke GitHub Pages / Vercel
4. ✅ Test di browser desktop & mobile
5. ✅ Install sebagai app
6. ✅ Test offline mode

---

## 🆘 Support

Jika ada error:
1. Buka DevTools (F12)
2. Cek Console tab
3. Copy error message
4. Cek tabel Supabase apakah sudah ada data

**Untuk produksi dengan banyak user: upgrade Supabase ke paid plan** ⚠️
