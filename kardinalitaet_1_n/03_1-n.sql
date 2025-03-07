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
(DEFAULT, "Marshmallow", "white"),
(DEFAULT, "Cinnamon", "orange"),
(DEFAULT, "Donut", "black"),
(DEFAULT, "Ashy", "grey"),
(DEFAULT, "Waffle", "striped")
;
-- MT: Inhalte
SELECT*FROM design.catmoms;

-- DT: kittens
CREATE TABLE IF NOT EXISTS design.kittens
(
  id          INT         NOT NULL AUTO_INCREMENT,
  kitten_name VARCHAR(45) NOT NULL,
  fur_color   VARCHAR(45) NOT NULL,
  catmoms_id  INT         NOT NULL,
  PRIMARY KEY (id)
);

ALTER TABLE design.kittens
  ADD CONSTRAINT FK_catmoms_TO_kittens
    FOREIGN KEY (catmoms_id)
    REFERENCES catmoms (id);

-- DT: Struktur
DESCRIBE design.kittens;

-- DT: Inserts
INSERT INTO design.kittens (id, kitten_name, fur_color, catmoms_id) VALUES (DEFAULT, "Gumdrop", "white", 1),
(DEFAULT, "Candy", "white", 1),
(DEFAULT, "Toffe", "white", 1)
;
INSERT INTO design.kittens (id, kitten_name, fur_color, catmoms_id) VALUES (DEFAULT, "Cotton", "white", 1);
INSERT INTO design.kittens (id, kitten_name, fur_color, catmoms_id) VALUES (DEFAULT, "Sprinkles", "striped", 2);

-- DT: Inhalte
SELECT * FROM design.kittens;



