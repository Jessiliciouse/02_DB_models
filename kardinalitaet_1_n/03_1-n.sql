\! cls 
-- Vorbereitung
DROP TABLE IF EXISTS design.kittens;
DROP TABLE IF EXISTS design.catmoms; 


-- MT: catmoms
CREATE TABLE IF NOT EXISTS design.catmoms
(
  id        INT         NOT NULL AUTO_INCREMENT,
  cat_name  VARCHAR(45) NOT NULL,
  fur_color VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);

-- MT: Struktur
DESCRIBE design.catmoms;

-- MT: Inserts
INSERT INTO design.catmoms (id, cat_name, fur_color) VALUES
(DEFAULT, "Moon", "white"),
(DEFAULT, "Pettimo", "orange"),
(DEFAULT, "Shadow", "black"),
(DEFAULT, "Oldie", "grey"),
(DEFAULT, "Tiger", "striped")
;
-- MT: Inhalte
SELECT*FROM design.catmoms;

-- DT: kittens


-- DT: Struktur


-- DT: Inserts


-- DT: Inhalte

