mysql -u root
create database Sales;
use Sales;

create table telephones(
    id integer not null auto_increment prmary key,
    name varchar(50) not null,
    manufacturer varchar(50) not null,
    price float(10),
    units_sold integer
);

insert into telephones(name,manufacturer,price,units_sold)
value("Iphone 4", "Apple", 399, 9436),
("N1280", "Nokia", 199, 1925),
("Galaxy S 5", "Samsung", 299, 2359),
("S5620 Monte", "Samsung", 250, 2385),
("N8", "Nokia", 150, 7543),
("Droid", "Motorola", 150, 8395),
("Iphone 13 Pro Max", "Apple", 1300, 12849),
("Galaxy Note 20", "Samsung", 1100, 10353);

