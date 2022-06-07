-- database crée dans phpmyadmin

create table orders(
    id integer not null auto_increment primary key,
    typepresta varchar(50) not null,
    designation varchar(50) not null,
    clientid integer not null,
    nbdays integer not null,
    unitprice integer not null,
    totalExcludeTaxe integer not null,
    totalWithTaxe integer not null,
    state integer 
);

insert into orders(typepresta,designation,clientid,nbdays,unitprice,totalExcludeTaxe,totalWithTaxe,state)
value("formation","angular init","2","3","1200","3600","4320","0"),
("formation","react avance","2","3","1000","3000","3600","2"),
("coaching","react techlead","1","20","900","1800","21600","2"),
("coaching","nest.js techlead","1","50","800","40000","48000","1"),
("coaching","react teachlead","3","10","1600","5500","7320","2"),
("coaching","jakarta EE","3","5","1800","9600","8820","1"),
("coaching","angular teachlead","4","20","1200","5500","4920","2"),
("coaching","angular basic","2","6","1200","4600","7320","0"),
("formation","java","3","6","1800","4600","7320","2"),
("coaching","angular basic","4","6","1200","6600","9320","1");

select *, unitprice*nbdays from orders;

select *, (unitprice*nbdays)*1.2 as totalpriceTVA from orders;

create view viewtva as select *, (unitprice*nbdays)*1.2 as totalpriceTVA from orders;

create table clients(
    id integer not null auto_increment primary key,
    compagnyName varchar(50) not null,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    email varchar(50) not null,
    phone varchar(50) not null,
    address varchar(50) not null,
    zipcode varchar(50) not null,
    city varchar(50) not null,
    country varchar(50) not null,
    state integer
);

insert into clients(compagnyName,firstname,lastname,email,phone,address,zipcode,city,country,state)
value("capgemini","fabrice","martin","martin@mail.com","0656896433","xxxxxxxxxxx","xxxxx","nantes","france",0),
("m2if","julien","lamar","lamrjul@mail.com","0658996433","xxxxxxxxxxx","xxxxx","nantes","france",0),
("ESNATOS","bob","martin","martin@mail.com","065776433","xxxxxxxxxxx","xxxxx","nantes","france",0),
("Soprasteria","alex","dupont","martin@mail.com","0636896433","xxxxxxxxxxx","xxxxx","nantes","france",0);



alter table orders add foreign key(clientid) references clients(id); -- on delete restrict


select clients.compagnyName, orders.typepresta from clients join orders on clients.id=orders.clientid where compagnyName="m2if"

select clients.firstname, clients.lastname, clients.email, orders.typepresta from orders join clients on clients.id=orders.clientid where typepresta="coaching"

select clients.firstname, clients.lastname, clients.email, orders.typepresta, orders.designation from orders join clients on clients.id=orders.clientid where typepresta="coaching" and designation="react techlead"

SELECT typePresta, designation, (unitPrice * nbDays) AS prix_UHT, (1.2 * unitPrice * nbDays) AS prix_TTC FROM clients JOIN orders ON clients.id=orders.clientId WHERE orders.typePresta="formation"

SELECT typePresta, designation, (1.2 * unitPrice * nbDays) AS prix_TTC FROM clients JOIN orders ON clients.id = orders.clientId WHERE (1.2 * unitPrice * nbDays) > 30000 AND orders.state = 2;


create table tab3(
    id integer not null auto_increment primary key,
    col1 varchar(50) not null,
    col2 varchar(50) not null,
    col3 varchar(50) not null    
);

insert into tab3(col1,col2,col3) value("xxx","zzz","yyy"),("aaaa","bbbb","ccc"),("uuu","iii","yyy")

alter table tab3 add colomn clientid not null;
alter table tab3 add foreign key(clientid) references clients(id);

select orders.typePresta, clients.compagnyName, tab3.col1 from orders join clients join tab3 on clients.id=orders.clientid=tab3.clientid


-- suite du cours --


-- Nombre de ventes pour tous les fabricant
SELECT manufacturer,SUM(units_sold) FROM telephones GROUP BY manufacturer;

-- CA par fabricant
SELECT manufacturer,SUM(price*units_sold) as chiffre_affaire FROM telephones GROUP BY manufacturer;

-- CA par fabricant dans l'ordre decroissant des CA
SELECT manufacturer,SUM(price*units_sold) as chiffre_affaire FROM telephones GROUP BY manufacturer ORDER BY chiffre_affaire DESC;

SELECT manufacturer,SUM(price*units_sold) as chiffre_affaire FROM telephones GROUP BY manufacturer HAVING chiffre_affaire>20000000;

SELECT name, price FROM telephones WHERE price<(SELECT AVG(price) FROM telephones) ORDER BY price DESC;


