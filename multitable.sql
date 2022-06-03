


create database coursSQL2;
use coursSQL2;


create table clients(
    ID integer not null auto_increment primary key,
    Nom varchar(50) not null,
    prenom varchar(70),
    email varchar(16) not null unique,
    telephone varchar(20)
); 

alter table clients drop column telephone

insert into clients(nom,prenom,email)
value ("alex","jim","jam@tomy"), ("jul","bob","AAA@tomy"), ("Pat","uim","lam@tomy")


create table telephones(
    id integer not null auto_increment primary key,
    numero varchar(20) not null,
    id_client integer,
    foreign key(id_client) references clients(id)
);

INSERT INTO telephones(numero,id_client) values("0636363336",1),("0637363336",1),("0736363336",1)

-- affichage et requetes multiples

select clients.prenom,client.email,telephones.numero from clients join telephones on clients.id=telephones.id_client

SELECT CONCAT(clients.prenom," ",clients.nom) AS nom, clients.email,telephones.numero 
FROM clients JOIN telephones ON clients.id=telephones.id_client;