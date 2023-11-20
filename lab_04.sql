-- LAB_04

-- LIST
CREATE TABLE tabela
(id_postaci int AUTO_INCREMENT PRIMARY KEY,

nazwa varchar (40) NOT NULL,

rodzaj ENUM( 'wiking', 'ptak', 'kobieta'),
data_ur date,
wiek int unsigned);

INSERT INTO postac (nazwa, rodzaj, data_ur, wiek) VALUES
('Bjorn', 'wiking', '1990-05-15', 30),
('Drozd', 'ptak', '2000-02-20', 22),
('Tesciowa', 'kobieta', '1935-09-10', 75);


UPDATE postac SET wiek = 88 WHERE nazwa = 'Tesciowa';


-- PANIKA


CREATE TABLE walizka (
    id_walizki INT AUTO_INCREMENT PRIMARY KEY,
    pojemnosc INT UNSIGNED,
    kolor ENUM('różowy', 'czerwony', 'tęczowy', 'żółty') DEFAULT 'różowy',
    id_wlasciciela INT,
    FOREIGN KEY (id_wlasciciela) REFERENCES postac(id_postaci) ON DELETE CASCADE
);


INSERT INTO walizka (pojemnosc, id_wlasciciela) VALUES (50, 1);


INSERT INTO walizka (pojemnosc, id_wlasciciela) VALUES (40, 3);

-- NIESPODZIANKA


CREATE TABLE izba (
    adres_budynku VARCHAR(50),
    nazwa_izby VARCHAR(50),
    metraz INT UNSIGNED,
    kolor VARCHAR(20) DEFAULT 'czarny',
    wlasciciel INT,
    PRIMARY KEY (adres_budynku, nazwa_izby),
    FOREIGN KEY (wlasciciel) REFERENCES postac(id_postaci) ON DELETE SET NULL
);


ALTER TABLE izba ADD COLUMN kolor VARCHAR(20) DEFAULT 'czarny' AFTER metraz;


INSERT INTO izba (adres_budynku, nazwa_izby, metraz, kolor, wlasciciel) VALUES
('Adres Budynku 1', 'spiżarnia', 15, 'biały', 1);

-- KOSZMAR

  CREATE TABLE przetwory (
  id_przetworu  INT PRIMARY KEY,
  rok_produkcji YEAR DEFAULT 1654,
  id_wykonawcy INT,
  zawartosc varchar(40),
  dodatek varchar(40) DEFAULT 'papryczka chilli',
  id_konsumenta INT,
  FOREIGN KEY (id_wykonwacy) REFERENCES postac(id_postaci),
  FOREIGN KEY (id_wykonwacy) REFERENCES postac(id_postaci)
  );
  
  INSERT INTO przetwory (rok_produkcji, id_wykonawcy, zawartość, id_konsumenta) VALUES
  (2023, 1, 'bigos', 3);
  
  -- UCIECZKA
  
  INSERT INTO postac(nazwa, rodzaj, data_ur, wiek) VALUES
  ('Wiking1', 'wiking', 1990-05-15, 32),
  ('Wiking2', 'wiking', 1990-05-15, 32),
  ('Wiking3', 'wiking', 1990-05-15, 32),
  ('Wiking4', 'wiking', 1990-05-15, 32),
  ('Wiking5', 'wiking', 1990-05-15, 32);
  
  
  CREATE TABLE statek(
  nazwa_statku VARCHAR(50) PRIMARY KEY,
  rodzaj_statku ENUM('Fregata', 'Bryg'),
  data_wodowania DATE,
  max_ladownosc INT UNSIGNED);
  
  INSERT INTO statek(nazwa_statku, rodzaj_statku, data_wodowania, max_ladownosc) VALUES
  ('Statek1', 'Bryg', 2000-05-19, 100 ),
  ('Statek2', 'Bryg', 2000-08-21, 100 );
  
  ALTER TABLE postac ADD COLUMN funkcja VARCHAR(40);
  

UPDATE postac SET funkcja = 'kapitan' WHERE nazwa = 'Wiking1';


ALTER TABLE postac ADD COLUMN id_statku VARCHAR(50);
ALTER TABLE postac ADD FOREIGN KEY (id_statku) REFERENCES statek(nazwa_statku);


UPDATE postac SET id_statku = 'Statek1' WHERE nazwa IN ('Wiking1', 'Wiking2', 'Wiking3');
UPDATE postac SET id_statku = 'Statek2' WHERE nazwa IN ('Wiking4', 'Wiking5', 'Drozd');


DELETE FROM izba WHERE nazwa_izby = 'spiżarnia';


DROP TABLE izba;
