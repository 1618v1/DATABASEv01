/**
 * KONFIGURASI SUPABASE
 * 
 * Ubah nilai di bawah sesuai project Supabase Anda
 * 
 * Cara mendapat nilai:
 * 1. Buka https://app.supabase.com
 * 2. Pilih project
 * 3. Settings → API
 * 4. Copy "Project URL" dan "anon public" key
 */

const SUPABASE_CONFIG = {
  // UBAH SESUAI SUPABASE ANDA
  URL: 'https://hqncomzsdegqukpaeydd.supabase.co',
  ANON_KEY: 'sb_publishable_e8eJOfNcckNcUpdCc5SrnQ_7GQR9hiB',
  
  // Nama tabel (sesuaikan jika berbeda)
  TABLES: {
    SALES: 'sales_data',
    STOK: 'stok_data'
  },
  
  // Settings
  SYNC_INTERVAL: 5000, // ms, interval sinkronisasi
  ENABLE_OFFLINE: true,
  ENABLE_PWA: true,
  
  // Local storage
  APP_NAME: 'DATABASEv01',
  DB_VERSION: 1
};

// Export untuk digunakan di script lain
if (typeof module !== 'undefined' && module.exports) {
  module.exports = SUPABASE_CONFIG;
}
