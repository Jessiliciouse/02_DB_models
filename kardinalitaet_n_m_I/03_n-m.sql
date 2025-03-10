
\! cls

-- Vorbereitung
DROP TABLE IF EXISTS design.servants;
DROP TABLE IF EXISTS design.products; 

DROP TABLE IF EXISTS design.purchases;

/* SERVANTS */


-- Servants: ohne Fremdschlüssel
CREATE TABLE IF NOT EXISTS design.servants
(
  id           INT     NOT NULL AUTO_INCREMENT COMMENT 'PK',
  servant_name VARCHAR(45) NOT NULL,
  yrs_served   TINYINT NOT NULL,
  PRIMARY KEY (id)
);

-- Servants: Struktur
DESCRIBE design.servants;

-- Servants: Inserts
INSERT INTO design.servants (id,servant_name,yrs_served) VALUES
(DEFAULT,"Mikasa Arckerman",5),
(DEFAULT,"Eren Yeager",5),
(DEFAULT,"Armin Arlet",5)
;
-- Servants: Inhalte 
SELECT*FROM design.servants;


/*  PRODUCTS */

-- Products: ohne Fremdschlüssel

CREATE TABLE IF NOT EXISTS design.products 
(
  id            INT         NOT NULL AUTO_INCREMENT COMMENT 'PK',
  product_name  VARCHAR(45) NOT NULL,
  product_price DECIMAL(6,2)  NOT NULL,
  PRIMARY KEY (id)
);


-- Products: Struktur
DESCRIBE design.products;
-- Products: Inserts

INSERT INTO design.products (id, product_name, product_price) VALUES 
(DEFAULT,"ODM Gear",599.99),
(DEFAULT,"Thunder Spears",59.99),
(DEFAULT, "Litter box", 3.33),
(DEFAULT, "Catnip", 7.50),
(DEFAULT, "Erwin's Resuscitation", 5.49),
(DEFAULT,"Zeke's spinal fluid", 99.99),
(DEFAULT,"Founding Titan Flashback",00.00),
(DEFAULT,"Wiskas Lachs",2.99);

-- Products: Inhalte 
SELECT*FROM design.products;

/*  PURCHASES (Kaufprozesse)*/

-- ServantsProducts (purchases)
CREATE TABLE IF NOT EXISTS design.purchases
(
  id          INT       NOT NULL AUTO_INCREMENT COMMENT 'PK',
  servants_id INT       NOT NULL COMMENT 'FK',
  products_id INT       NOT NULL COMMENT 'FK',
  p_time      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Zeitpunkt',
  PRIMARY KEY (id)
);
ALTER TABLE design.purchases
  ADD CONSTRAINT FK_servants_TO_purchases
    FOREIGN KEY (servants_id)
    REFERENCES servants (id);

ALTER TABLE design.purchases
  ADD CONSTRAINT FK_products _TO_purchases
    FOREIGN KEY (products_id)
    REFERENCES products  (id);
-- Purchases: Struktur
DESCRIBE design.purchases;

-- Purchases: Inserts (Kaufprozesse : Käufer - Produkt)
INSERT INTO design.purchases (id, servants_id, products_id, p_time) VALUES 
(DEFAULT,1,1,DEFAULT),
(DEFAULT,3,1,DEFAULT),
(DEFAULT,2,1,DEFAULT),
(DEFAULT,1,2,DEFAULT),
(DEFAULT,1,7,DEFAULT),
(DEFAULT,3,3,DEFAULT),
(DEFAULT,2,8,DEFAULT),
(DEFAULT,2,5,DEFAULT),
(DEFAULT,3,7,DEFAULT);
-- Purchases: Inhalte 
SELECT*FROM design.purchases;