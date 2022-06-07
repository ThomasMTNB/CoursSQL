
create database cours3sql
use cours3sql

CREATE TABLE IF NOT EXISTS clients(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(20) NOT NULL,
    prenom VARCHAR(20) NOT NULL,
    adresse_email VARCHAR(50) NOT NULL UNIQUE
);



CREATE TABLE IF NOT EXISTS produits(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    designation VARCHAR(50) NOT NULL,
    prixUHT FLOAT NOT NULL,
    prixTTC FLOAT GENERATED ALWAYS AS (prixUHT*1.2) STORED,
    quantite_stock INT
);


CREATE TABLE IF NOT EXISTS achats(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_client INT,
  id_produit INT NOT NULL,
  FOREIGN KEY(id_client) REFERENCES clients(id) ON UPDATE CASCADE ON DELETE SET NULL,
  FOREIGN KEY(id_produit) REFERENCES produits(id) ON UPDATE CASCADE ON DELETE RESTRICT
);

insert into clients (id, nom, prenom, adresse_email) values (1, 'Barthel', 'Kerner', 'bkerner0@cloudflare.com');
insert into clients (id, nom, prenom, adresse_email) values (2, 'Quentin', 'Lettington', 'qlettington1@liveinternet.ru');
insert into clients (id, nom, prenom, adresse_email) values (3, 'Fidela', 'Duncan', 'fduncan2@elegantthemes.com');
insert into clients (id, nom, prenom, adresse_email) values (4, 'Nert', 'Zorzini', 'nzorzini3@ovh.net');

insert into produits (id, designation, prixUHT, quantite_stock) values (1, 'Marsala - Sperone, Fine, D.o.c.', 66, 511);
insert into produits (id, designation, prixUHT, quantite_stock) values (2, 'Chocolate Bar - Coffee Crisp', 69, 425);
insert into produits (id, designation, prixUHT, quantite_stock) values (3, 'Pork - Side Ribs', 183, 795);
insert into produits (id, designation, prixUHT, quantite_stock) values (4, 'Wine - Sauvignon Blanc', 115, 600);
insert into produits (id, designation, prixUHT, quantite_stock) values (5, 'Wine - Semi Dry Riesling Vineland', 238, 331);
insert into produits (id, designation, prixUHT, quantite_stock) values (6, 'Potatoes - Pei 10 Oz', 108, 934);
insert into produits (id, designation, prixUHT, quantite_stock) values (7, 'Cut Wakame - Hanawakaba', 159, 354);
insert into produits (id, designation, prixUHT, quantite_stock) values (8, 'Coffee - Egg Nog Capuccino', 262, 881);
insert into produits (id, designation, prixUHT, quantite_stock) values (9, 'Lemonade - Natural, 591 Ml', 294, 587);
insert into produits (id, designation, prixUHT, quantite_stock) values (10, 'Red Snapper - Fresh, Whole', 269, 77);


SELECT * FROM clients JOIN achats ON clients.id=achats.id_client JOIN produits ON achats.id_produit=produits.id;

SELECT CONCAT(clients.prenom," ",clients.nom) as client, produits.designation 
FROM clients JOIN achats ON clients.id=achats.id_client JOIN produits ON achats.id_produit=produits.id;