-- Vorbereitungen
DROP TABLE IF EXISTS design.servants;
DROP TABLE IF EXISTS design.cats; 


-- Mastertabelle (MT): unverändert
CREATE TABLE IF NOT EXISTS design.cats
(
  id         INT         NOT NULL AUTO_INCREMENT COMMENT 'Index',
  cat_name   VARCHAR(45) NOT NULL COMMENT 'Katzennamen',
  fur_colour VARCHAR(45) NOT NULL COMMENT 'Feltfarbe',
  PRIMARY KEY (id)
);

-- Struktur: MT
DESCRIBE design.cats;

-- Inserts: MT 
INSERT INTO design.cats (id, cat_name,fur_color) VALUES 
(DEFAULT, "Moon", "white"),
(DEFAULT, "Pettimo", "orange"),
(DEFAULT, "Shadow", "black")
;
 

-- Inhalte: MT
SELECT*FROM design.cats;


-- Detailtabelle: Verbindung zur MT über Fremdschlüssel
CREATE TABLE design.servants
(
  id         VARCHAR(45) NOT NULL AUTO_INCREMENT COMMENT 'Index',
  cats_id    INT         NOT NULL COMMENT 'FK',
  serv_name  VARCHAR     NOT NULL COMMENT 'Name der Diener',
  yrs_served TINYINT     NOT NULL COMMENT 'Dienstzeit',
  PRIMARY KEY (id)
);

-- Fremdschlüssel: DT
ALTER TABLE design.servants
  ADD CONSTRAINT FK_cats_TO_servants
    FOREIGN KEY (cats_id)
    REFERENCES cats (id);

-- wichtig bei 1:1  UNIQUE im fk
ALTER TABLE design.servants
  ADD CONSTRAINT UQ_cats_id UNIQUE (cats_id);

-- Struktur: DT
DESCRIBE design.servants;

-- Inserts: DT


-- Inhalte: DT
SELECT*FROM design.servants;