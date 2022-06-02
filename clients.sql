--  auth/Co
mysql -u root -- utls sans mdp
mysql -u root -p -- utls avec mdp

-- 1 list base de données
show databases; 


-- 2 base de données

Create database CoursSQL;
use CoursSQL;

-- 3 table clients

show tables;
create table clients(
    ID integer not null auto_increment primary key,
    Nom varchar(50) not null,
    mail varchar(70),
    tel varchar(16) not null unique
); 

Alter table clients add column postnom varchar(50) after tel;

Alter table clients modify column postnom varchar(70);

Alter table clients modify column postnom varchar(70) not null;

-- LMD

select * from clients;

insert into clients(Nom,mail,tel)
value("thomas","thom.m@fr","0654789");

alter table clients add column age integer(3) not null after postnom;

-- mise a jour

update clients set tel="55555555" where ID=3;

delete from clients where id=4;

-- ??????

SHOW VARIABLES LIKE 'sql_mode'

set sql_mode='STRICT_TRANS_TABLES';


Select * from clients where age<20 and nom="verilmickael";
Select * from clients where age>20 or nom="thom";

