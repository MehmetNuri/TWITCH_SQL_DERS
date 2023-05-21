-- Yorum satırı
-- birden
-- fazla
-- yorum

--SQL  (Structure Query Language)

-- DDL -> İnşaat Mühendisi (Binanın Yapısını Belirler)
-- -- Data Defination Language

-- DML  -> İç Mimar (Bina İçindeki Değişebilecek Yapıları Belirler)
---  Data Manupilation Language

--- DDL
---  CREATE -> OLUŞTUR
---  ALTER  -> GÜNCELLEME
---  DROP -> SİLME
---  RENAME -> YENİDEN ADLANDIRMA
---  TRUNCATE  -> YAPI İÇERİĞİNİ TEMİZLER


-- SQL (Structured Query Language), ilişkisel veritabanı yönetim sistemlerinde kullanılan bir programlama dilidir. SQL'de kullanılan veri tipleri aşağıda listelenmiştir:
--
-- 1. CHAR(n): Sabit uzunluktaki karakter dizilerini temsil eder. "n" parametresi, karakter dizisinin uzunluğunu belirtir.
--
-- 2. VARCHAR(n): Değişken uzunluktaki karakter dizilerini temsil eder. "n" parametresi, karakter dizisinin maksimum uzunluğunu belirtir.
--
-- 3. INT: Tam sayı değerlerini temsil eder. Örneğin, 1, 2, -5 gibi değerler INT veri tipi kullanılarak saklanabilir.
--
-- 4. FLOAT(p): Ondalıklı sayıları temsil eder. "p" parametresi, ondalık basamak sayısını belirtir.
--
-- 5. DOUBLE(p): Çift hassasiyetli ondalıklı sayıları temsil eder. "p" parametresi, ondalık basamak sayısını belirtir.
--
-- 6. DECIMAL(p, s): Hassas ondalıklı sayıları temsil eder. "p" parametresi, toplam basamak sayısını ve "s" parametresi ondalık basamak sayısını belirtir.
--
-- 7. DATE: Tarih değerlerini temsil eder. Örneğin, '2023-05-21' gibi bir tarih DATE veri tipi kullanılarak saklanabilir.
--
-- 8. TIME: Saat değerlerini temsil eder. Örneğin, '14:30:00' gibi bir saat TIME veri tipi kullanılarak saklanabilir.
--
-- 9. DATETIME: Tarih ve saat değerlerini birleştirerek temsil eder. Örneğin, '2023-05-21 14:30:00' gibi bir tarih ve saat DATETIME veri tipi kullanılarak saklanabilir.
--
-- 10. BOOLEAN: Mantıksal değerleri temsil eder. "TRUE" veya "FALSE" değerlerini alabilir.
--
-- 11. BLOB: Büyük binary verilerini (örneğin, resimler veya dosyalar) temsil eder.
--
-- Bu sadece bazı yaygın veri tipleridir ve her veritabanı yönetim sistemi farklı veri tipleri sunabilir. Ayrıca, bazı veri tipleri veritabanı yönetim sistemine özgü olabilir.


CREATE TABLE IF NOT EXISTS ogrenciler
(
    id         SERIAL PRIMARY KEY,
    ad         VARCHAR(100),
    soyad      VARCHAR(100),
    cinsiyet   VARCHAR(5),
    dogum_yili INT
);


--- VERİ EKLEME
INSERT INTO ogrenciler(ad,soyad,cinsiyet,dogum_yili)
VALUES('MEHMET NURİ','ÖZTÜRK', 'ERKEK', 1993);


-- ÇOKLU VERİ EKLEME
INSERT INTO ogrenciler(ad,soyad,cinsiyet,dogum_yili)
VALUES  ('CANSU', 'ÖZTÜRK', 'KADIN', 1993),
        ('TOPRAK', 'ÖZTÜRK', 'KADIN', 2021),
        ('BERK', 'ÖZTÜRK', 'ERKEK', 2015);


--SORGULAMALAR


-- TABLO SEÇME

SELECT * FROM ogrenciler;
SELECT ad, soyad FROM ogrenciler;
SELECT  ad AS ISIM, soyad AS SOYISIM  FROM ogrenciler;

--TABLO KOLONLARINI BİRLEŞTİRME

SELECT ad ||  ' ' || soyad   AS ad_soyad FROM  ogrenciler;
SELECT CONCAT(ad, ' ', soyad) as ad_soyad FROM  ogrenciler;


--SORGULAMA
SELECT * FROM  ogrenciler WHERE  id = 2;
SELECT * FROM  ogrenciler WHERE ad = 'CANSU'; -- TAM EŞLEME
SELECT * FROM  ogrenciler WHERE ad LIKE '%A%'; -- AD KOLONUNDA İÇİERİSİNDE A GEÇEN KAYITLAR
SELECT * FROM  ogrenciler WHERE ad LIKE '%U'; -- AD KOLONUNDA SONU U İLE BİTEN KAYITLAR
SELECT * FROM  ogrenciler WHERE ad LIKE 'C%'; -- AD KOLONUNDA SONU U İLE BAŞLAYAN KAYITLAR


-- BİRDEN FAZLA KOŞUL SAĞLAMA
SELECT * FROM ogrenciler WHERE ad LIKE '%A%' AND cinsiyet = 'KADIN' AND dogum_yili =  2021;
SELECT * FROM ogrenciler WHERE ad LIKE '%T%' OR cinsiyet = 'KADIN';


-- ARİTMETİKSEL SORGULAMALAR
-- > < >= <= != =
SELECT * FROM ogrenciler where id = 1;
SELECT * FROM  ogrenciler where id > 1;
SELECT * FROM  ogrenciler where id >= 1;
SELECT * FROM  ogrenciler where id < 2;
SELECT * FROM  ogrenciler where id <= 2;
SELECT * FROM  ogrenciler where id != 2;
SELECT * FROM  ogrenciler where id <> 2;


-- SIRALAMA
SELECT * FROM ogrenciler ORDER BY id ASC; -- ID KOLONUNA GÖRE KÜÇÜKTEN BÜYÜĞE KAYIRLARI GETİR
SELECT * FROM ogrenciler ORDER BY id DESC; -- ID KOLONUNA GÖRE BÜYÜKTEN KÜÇÜĞE SIRALA

SELECT * FROM ogrenciler ORDER BY ad;
SELECT * FROM ogrenciler ORDER BY ad DESC;

-- IN İÇERSİNDE
SELECT  * FROM ogrenciler WHERE id IN(1,5,3);
SELECT * FROM ogrenciler WHERE  ad IN('CANSU', 'TOPRAK');

--
--  accounts isminde bir tablo oluştur ve aşağıdaki kurallar olsun
--      1- kolonlar  id, user_name, password, email, created_at
--      2- username ve password boş olmasın
--      3- created_at kayıt eklendiğinde otomatik atansın
--      4- id sequence olarak tanımlansın ve 10 dan başlasın


-- SEQUENCE OLUŞTURMA
CREATE  SEQUENCE  account_id_seq START 10;

--TABLO OLUŞTURMA

CREATE TABLE accounts(
    id BIGINT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL ,
    email VARCHAR(100),
    created_at TIMESTAMP
);

-- VAR OLAN KOLONU GÜNCELLEME

ALTER TABLE  accounts ALTER COLUMN id SET DEFAULT NEXTVAL('account_id_seq');
ALTER TABLE  accounts ALTER  COLUMN  created_at SET DEFAULT  current_timestamp;

INSERT INTO accounts(user_name, password, email, created_at)
VALUES ('mehmet_nuri', '123', 'info@mehmetnuri.net', current_timestamp);

INSERT INTO accounts(user_name, password, email)
VALUES ('cansu_ozturk', '123', 'cansu@cansu.com');

