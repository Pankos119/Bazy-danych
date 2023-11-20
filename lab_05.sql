 -- LAB_05
  
  -- CICHA WODA
  DELETE FROM postac
WHERE rodzaj = 'wiking' AND nazwa != 'Bjorn'
ORDER BY wiek DESC
LIMIT 2;

ALTER TABLE postac DROP FOREIGN KEY fk_postac_statek;


ALTER TABLE postac DROP FOREIGN KEY fk_postac_konsument;


ALTER TABLE postac DROP PRIMARY KEY;


ALTER TABLE postac ADD COLUMN id_postaci_new INT AUTO_INCREMENT PRIMARY KEY FIRST;


UPDATE postac SET id_postaci_new = id_postaci;


ALTER TABLE postac DROP COLUMN id_postaci;


ALTER TABLE postac CHANGE COLUMN id_postaci_new id_postaci INT AUTO_INCREMENT;

  -- SYRENKA
  

ALTER TABLE postac ADD COLUMN pesel VARCHAR(11) PRIMARY KEY;


UPDATE postac SET pesel = '12345678901' WHERE nazwa = 'Bjorn';
UPDATE postac SET pesel = '23456789012' WHERE nazwa = 'Drozd';
UPDATE postac SET pesel = '34567890123' WHERE nazwa = 'Tesciowa';

  

ALTER TABLE postac MODIFY COLUMN rodzaj ENUM('wiking', 'ptak', 'kobieta', 'syrena');


INSERT INTO postac (nazwa, rodzaj, data_ur, wiek, pesel) VALUES
('Gertruda Nieszczera', 'syrena', '1990-01-01', 30, '45678901234');

-- PRZECHYŁY
  UPDATE postac
SET id_statku = 'StatekBjorna'
WHERE nazwa LIKE '%a%';

  
  UPDATE statek
SET max_ladownosc = max_ladownosc * 0.7
WHERE YEAR(data_wodowania) BETWEEN 1900 AND 1999;

SELECT *
FROM postac
WHERE wiek <= 1000;

-- WĄŻ LOKO

  INSERT INTO postac (nazwa, rodzaj, data_ur, wiek) VALUES ('Loko', 'wąż', '2000-01-01', 22);

  CREATE TABLE Marynarz AS
SELECT *
FROM postac
WHERE id_statku IS NOT NULL;

  
  
ALTER TABLE Marynarz DROP PRIMARY KEY;


ALTER TABLE Marynarz ADD PRIMARY KEY (id_postaci);

ALTER TABLE Marynarz DROP COLUMN id_statku;

-- SZTORM
  
  UPDATE postac SET statek = NULL;
  
  DELETE FROM postac WHERE nazwa = 'Wiking1' LIMIT 1;
  
  DELETE FROM statek;
  
  DROP TABLE statek;
  
CREATE TABLE zwierz (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nazwa VARCHAR(50),
    wiek INT
);
INSERT INTO zwierz (nazwa, wiek)
SELECT nazwa, wiek FROM postac;