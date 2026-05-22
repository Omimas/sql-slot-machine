-- 🍒 SQL Slot Machine Game
-- Simple database-based slot machine simulation

-- 1. KURULUM: Tablo yoksa yarat (Varsa içindeki skorlara dokunmaz)
CREATE TABLE IF NOT EXISTS oyun_durumu (
  oyuncu VARCHAR(10),
  slot1 CHAR(2),
  slot2 CHAR(2),
  slot3 CHAR(2),
  skor INT
);

-- 2. KAYIT: Oyuncular tabloda yoksa sıfır puanla ekle
INSERT INTO oyun_durumu (oyuncu, slot1, slot2, slot3, skor)
SELECT 'Oyuncu1', '-', '-', '-', 0
WHERE NOT EXISTS (SELECT 1 FROM oyun_durumu WHERE oyuncu = 'Oyuncu1');

INSERT INTO oyun_durumu (oyuncu, slot1, slot2, slot3, skor)
SELECT 'Oyuncu2', '-', '-', '-', 0
WHERE NOT EXISTS (SELECT 1 FROM oyun_durumu WHERE oyuncu = 'Oyuncu2');

-- 3. MAKİNEYİ ÇEVİR: Rastgele meyve atama
UPDATE oyun_durumu 
SET 
    slot1 = CASE ABS(RANDOM()) % 3 WHEN 0 THEN '🍎' WHEN 1 THEN '🍋' ELSE '🍒' END,
    slot2 = CASE ABS(RANDOM()) % 3 WHEN 0 THEN '🍎' WHEN 1 THEN '🍋' ELSE '🍒' END,
    slot3 = CASE ABS(RANDOM()) % 3 WHEN 0 THEN '🍎' WHEN 1 THEN '🍋' ELSE '🍒' END;

-- 4. KAZANANI KONTROL ET: Jackpot kontrolü
UPDATE oyun_durumu 
SET skor = skor + 1 
WHERE slot1 = slot2 AND slot2 = slot3;

-- 5. SONUÇLARI GÖSTER
SELECT 
    oyuncu,
    slot1 || ' ' || slot2 || ' ' || slot3 AS makine_ekrani,
    skor AS toplam_puan,
    CASE 
        WHEN slot1 = slot2 AND slot2 = slot3 
        THEN '🎉 JACKPOT! +1 PUAN 🎉'
        ELSE '❌' 
    END AS tur_sonucu
FROM oyun_durumu
ORDER BY skor DESC;
