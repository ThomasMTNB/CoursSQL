select * from telephones where manufacturer="samsung" or manufacturer="apple";

select * from telephones where manufacturer in("samsung","apple");

select name,manufacturer from telephones where price>150 and price<200;

select name,manufacturer from telephones where price between 150 and 200;

select * from telephones order by price ASC;

select * from telephones order by price desc, manufacturer DESC;

select *, units_sold*price from telephones;

SELECT CONCAT(manufacturer," ",name) as nom,CONCAT(price,"€") as prix FROM telephones;

-- CREATE VIEW v_revenu_total AS SELECT name AS modele, manufacturer AS constructeur,price AS prix, units_sold AS unites_vendues, (price*units_sold) AS chiffre_affaire FROM telephones;

SELECT * FROM v_revenu_total;

SELECT DISTINCT(manufacturer) FROM telephones;

-- Total des ventes
SELECT SUM(units_sold)AS total_ventes FROM telephones;

-- Average sales
SELECT AVG(units_sold)AS moyenne_ventes FROM telephones;

-- Ventes les plus elevées
SELECT MAX(units_sold)AS ventes_plus_elevee FROM telephones;

-- Ventes les moins elevées
SELECT MIN(units_sold)AS ventes_moins_elevee FROM telephones;