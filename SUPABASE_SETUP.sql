-- ============================================================
-- DATABASE APP - SUPABASE SETUP SCRIPT
-- Copy-paste seluruh file ini ke SQL Editor di Supabase
-- ============================================================

-- 1. CREATE SALES TABLE
CREATE TABLE IF NOT EXISTS sales_data (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  data JSONB NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- Tambah index untuk performa
CREATE INDEX IF NOT EXISTS idx_sales_created_at ON sales_data(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_sales_updated_at ON sales_data(updated_at DESC);

-- Enable Row Level Security
ALTER TABLE sales_data ENABLE ROW LEVEL SECURITY;

-- Public access policy (ganti dengan auth policy di production)
CREATE POLICY "Enable public access for sales" ON sales_data
  FOR ALL 
  USING (true) 
  WITH CHECK (true);

-- ============================================================

-- 2. CREATE STOK TABLE
CREATE TABLE IF NOT EXISTS stok_data (
  id TEXT PRIMARY KEY,
  produk TEXT NOT NULL,
  tgl DATE NOT NULL,
  stok_awal INTEGER DEFAULT 0,
  masuk INTEGER DEFAULT 0,
  keluar INTEGER DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- Tambah index untuk performa
CREATE INDEX IF NOT EXISTS idx_stok_produk ON stok_data(produk);
CREATE INDEX IF NOT EXISTS idx_stok_tgl ON stok_data(tgl DESC);
CREATE INDEX IF NOT EXISTS idx_stok_created_at ON stok_data(created_at DESC);

-- Enable Row Level Security
ALTER TABLE stok_data ENABLE ROW LEVEL SECURITY;

-- Public access policy (ganti dengan auth policy di production)
CREATE POLICY "Enable public access for stok" ON stok_data
  FOR ALL 
  USING (true) 
  WITH CHECK (true);

-- ============================================================

-- 3. OPTIONAL: CREATE AUDIT LOG TABLE
CREATE TABLE IF NOT EXISTS audit_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  table_name TEXT NOT NULL,
  action TEXT NOT NULL, -- 'INSERT', 'UPDATE', 'DELETE'
  user_id TEXT,
  data JSONB,
  ip_address TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_audit_created_at ON audit_log(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_audit_table_action ON audit_log(table_name, action);

-- ============================================================

-- 4. SECURITY: AUTHENTICATED USERS ONLY (untuk production)
-- Uncomment ini jika ingin restrict access ke authenticated users saja

/*
DROP POLICY IF EXISTS "Enable public access for sales" ON sales_data;
CREATE POLICY "Authenticated users only" ON sales_data
  FOR ALL 
  USING (auth.role() = 'authenticated')
  WITH CHECK (auth.role() = 'authenticated');

DROP POLICY IF EXISTS "Enable public access for stok" ON stok_data;
CREATE POLICY "Authenticated users only" ON stok_data
  FOR ALL 
  USING (auth.role() = 'authenticated')
  WITH CHECK (auth.role() = 'authenticated');
*/

-- ============================================================

-- 5. TEST: Verify tables created
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
ORDER BY table_name;

-- Expected output: audit_log, sales_data, stok_data

-- ============================================================
-- SETUP SELESAI! 
-- Settings → API → Copy URL & Anon Key untuk dimasukkan ke HTML
-- ============================================================
