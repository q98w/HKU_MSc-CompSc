#Q1
select min(WeekPrice)
from Pricing P, Season S
where P.CodeSeason=S.CodeSeason
 and NameSeason='Full Season' and typeCabin=6;

#Q2
select P.CodeVillage, NameVillage
from Pricing P, Season S, Village V
where P.CodeSeason = S.CodeSeason
 and V.CodeVillage = P.CodeVillage
 and NameSeason='Full Season' and typeCabin=6
 and WeekPrice= (select min(WeekPrice)
from Pricing P, Season S
where P.CodeSeason=S.CodeSeason
 and NameSeason='Full Season' and typeCabin=6);

#Q3
select C.CodeVillage, NameVillage
from CompoVillage C, Cabin Ca, Village V
where C.TypeCabin = Ca.TypeCabin
 and V.CodeVillage=C.CodeVillage and Capacity = 6
group by C.CodeVillage , NameVillage
having count(*) = (select count(*) from Cabin where Capacity = 6);

#Q4 a
SELECT NAMEVILLAGE,TYPECABIN
FROM compovillage c, village v
WHERE c.CODEVILLAGE = v.CODEVILLAGE
  and CABINCOUNT>=4;

#Q4 b
SELECT max(CAPACITY)
FROM cabin c, village v, compovillage co
WHERE c.TYPECABIN = co.TYPECABIN
  and co.CODEVILLAGE = v.CODEVILLAGE
  and NAMEVILLAGE = 'Prémanon';

#Q4 c
SELECT NAMEVILLAGE
FROM village v, activillage a
WHERE a.CODEVILLAGE = v.CODEVILLAGE
  and PRICEACTIVITY > (
      SELECT max(PRICEACTIVITY)
      FROM activillage a,village v
      WHERE a.CODEVILLAGE = v.CODEVILLAGE
        and v.NAMEVILLAGE = 'Prémanon')
group by NAMEVILLAGE;

#Q4 d
SELECT NAMEVILLAGE
FROM activity a, activillage av, village v
WHERE v.CODEVILLAGE = av.CODEVILLAGE
  and a.NUMACTIVITY = av.NUMACTIVITY
group by NAMEVILLAGE
having count(*) > (
    SELECT count(*)
    FROM activity a, activillage av, village v
    WHERE v.CODEVILLAGE = av.CODEVILLAGE
      and a.NUMACTIVITY = av.NUMACTIVITY
      and v.NAMEVILLAGE = 'Vendes');

#Q4 e
SELECT NAMEACTIVITY
FROM activity a, activillage av, village v
WHERE v.CODEVILLAGE = av.CODEVILLAGE
  and a.NUMACTIVITY = av.NUMACTIVITY
  and LOCATION = 'Mountain'
group by NAMEACTIVITY
having count(*) > 1;

#Q4 f
SELECT TYPECABIN
FROM cabin
WHERE TYPECABIN NOT IN(
    SELECT c.TYPECABIN
    FROM cabin c, compovillage co, village v
    WHERE v.CODEVILLAGE = co.CODEVILLAGE
      and c.TYPECABIN = co.TYPECABIN
      and LOCATION = 'Mountain'
    group by c.TYPECABIN
);


#Q4 g
SELECT NAMEVILLAGE,IF(TYPEACTIVITY = 'Culture',count(*),0)
FROM activity a, activillage av, village v
WHERE a.NUMACTIVITY = av.NUMACTIVITY
  and v.CODEVILLAGE = av.CODEVILLAGE
GROUP BY NAMEVILLAGE;

#Q4 a
SELECT NAMEVILLAGE,TYPECABIN
FROM compovillage c, village v
WHERE c.CODEVILLAGE = v.CODEVILLAGE
  and CABINCOUNT>=4;

#Q4 b
SELECT max(CAPACITY)
FROM cabin c, village v, compovillage co
WHERE c.TYPECABIN = co.TYPECABIN
  and co.CODEVILLAGE = v.CODEVILLAGE
  and NAMEVILLAGE = 'Prémanon';

#Q4 c
SELECT NAMEVILLAGE
FROM village v, activillage a
WHERE a.CODEVILLAGE = v.CODEVILLAGE
  and PRICEACTIVITY > (
      SELECT max(PRICEACTIVITY)
      FROM activillage a,village v
      WHERE a.CODEVILLAGE = v.CODEVILLAGE
        and v.NAMEVILLAGE = 'Prémanon')
group by NAMEVILLAGE;

#Q4 d
SELECT NAMEVILLAGE
FROM activity a, activillage av, village v
WHERE v.CODEVILLAGE = av.CODEVILLAGE
  and a.NUMACTIVITY = av.NUMACTIVITY
group by NAMEVILLAGE
having count(*) > (
    SELECT count(*)
    FROM activity a, activillage av, village v
    WHERE v.CODEVILLAGE = av.CODEVILLAGE
      and a.NUMACTIVITY = av.NUMACTIVITY
      and v.NAMEVILLAGE = 'Vendes');

#Q4 e
SELECT NAMEACTIVITY
FROM activity a, activillage av, village v
WHERE v.CODEVILLAGE = av.CODEVILLAGE
  and a.NUMACTIVITY = av.NUMACTIVITY
  and LOCATION = 'Mountain'
group by NAMEACTIVITY
having count(*) > 1;

#Q4 f
SELECT TYPECABIN
FROM cabin
WHERE TYPECABIN NOT IN(
    SELECT c.TYPECABIN
    FROM cabin c, compovillage co, village v
    WHERE v.CODEVILLAGE = co.CODEVILLAGE
      and c.TYPECABIN = co.TYPECABIN
      and LOCATION = 'Mountain'
    group by c.TYPECABIN
);


#Q4 g
SELECT NAMEVILLAGE,IF(TYPEACTIVITY = 'Culture',count(*),0)
FROM activity a, activillage av, village v
WHERE a.NUMACTIVITY = av.NUMACTIVITY
  and v.CODEVILLAGE = av.CODEVILLAGE
GROUP BY NAMEVILLAGE;

create database homework001;

use homework001;

CREATE TABLE ACTIVITY
(
    NUMACTIVITY	varchar(300),
    NAMEACTIVITY varchar(300),
    TYPEACTIVITY varchar(300)
);

CREATE TABLE VILLAGE
(
    CODEVILLAGE	varchar(300),
    NAMEVILLAGE varchar(300),
    LOCATION varchar(300)
);

CREATE TABLE CABIN
(
    TYPECABIN varchar(300),
    NAME varchar(300),
    CAPACITY int
);

CREATE TABLE PRICING
(
    CODEVILLAGE	varchar(300),
    TYPECABIN varchar(300),
    CODESEASON varchar(300),
    WEEKPRICE int
);

CREATE TABLE SEASON
(
    CODESEASON varchar(300),
    NAMESEASON varchar(300)
);

CREATE TABLE COMPOVILLAGE
(
    CODEVILLAGE	varchar(300),
    TYPECABIN	varchar(300),
    CABINCOUNT 	int
);

CREATE TABLE ACTIVILLAGE
(
    CODEVILLAGE	varchar(300),
    NUMACTIVITY	varchar(300),
    PRICEACTIVITY varchar(300)
);

insert into ACTIVITY(NUMACTIVITY,NAMEACTIVITY,TYPEACTIVITY) value ('1','Swimming','Sport');
insert into ACTIVITY(NUMACTIVITY,NAMEACTIVITY,TYPEACTIVITY) value ('2','Hiking','Culture');
insert into ACTIVITY(NUMACTIVITY,NAMEACTIVITY,TYPEACTIVITY) value ('3','Trekking','Nature');
insert into ACTIVITY(NUMACTIVITY,NAMEACTIVITY,TYPEACTIVITY) value ('4','Horse riding','Sport');
insert into ACTIVITY(NUMACTIVITY,NAMEACTIVITY,TYPEACTIVITY) value ('5','Bike','Nature');
insert into ACTIVITY(NUMACTIVITY,NAMEACTIVITY,TYPEACTIVITY) value ('6','Museum','Culture');
insert into ACTIVITY(NUMACTIVITY,NAMEACTIVITY,TYPEACTIVITY) value ('7','Boat','Nature');
insert into ACTIVITY(NUMACTIVITY,NAMEACTIVITY,TYPEACTIVITY) value ('8','Kayak','Sport');
insert into ACTIVITY(NUMACTIVITY,NAMEACTIVITY,TYPEACTIVITY) value ('9','Tennis','Sport');
insert into ACTIVITY(NUMACTIVITY,NAMEACTIVITY,TYPEACTIVITY) value ('10','Climbing','Sport');

insert into VILLAGE(CODEVILLAGE,NAMEVILLAGE,LOCATION) value ('1','Prémanon','NULL');
insert into VILLAGE(CODEVILLAGE,NAMEVILLAGE,LOCATION) value ('2','Lélex','Mountain');
insert into VILLAGE(CODEVILLAGE,NAMEVILLAGE,LOCATION) value ('3','Saint-Lary','Mountain');
insert into VILLAGE(CODEVILLAGE,NAMEVILLAGE,LOCATION) value ('4','Le Grand Lioran','Mountain');
insert into VILLAGE(CODEVILLAGE,NAMEVILLAGE,LOCATION) value ('5','Obernai','Plaine');
insert into VILLAGE(CODEVILLAGE,NAMEVILLAGE,LOCATION) value ('6','Vendes','NULL');
insert into VILLAGE(CODEVILLAGE,NAMEVILLAGE,LOCATION) value ('7','Sainte Suzanne','NULL');
insert into VILLAGE(CODEVILLAGE,NAMEVILLAGE,LOCATION) value ('8','Port-Bail','Sea');
insert into VILLAGE(CODEVILLAGE,NAMEVILLAGE,LOCATION) value ('9','Ars-en-Ré','Sea');
insert into VILLAGE(CODEVILLAGE,NAMEVILLAGE,LOCATION) value ('10','Veules-les-Roses','Sea');
insert into VILLAGE(CODEVILLAGE,NAMEVILLAGE,LOCATION) value ('11','Argol','NULL');
insert into VILLAGE(CODEVILLAGE,NAMEVILLAGE,LOCATION) value ('12','Sarzeau','Sea');

insert into CABIN(TYPECABIN,NAME,CAPACITY) value ('1','Evasion','2');
insert into CABIN(TYPECABIN,NAME,CAPACITY) value ('2','Eden','4');
insert into CABIN(TYPECABIN,NAME,CAPACITY) value ('3','Azur','4');
insert into CABIN(TYPECABIN,NAME,CAPACITY) value ('4','Rêve','4');
insert into CABIN(TYPECABIN,NAME,CAPACITY) value ('5','Palace','6');
insert into CABIN(TYPECABIN,NAME,CAPACITY) value ('6','Détente','6');

insert into PRICING(CODEVILLAGE,TYPECABIN,CODESEASON,WEEKPRICE) value ('1','3','LS','250');
insert into PRICING(CODEVILLAGE,TYPECABIN,CODESEASON,WEEKPRICE) value ('1','3','FS','550');
insert into PRICING(CODEVILLAGE,TYPECABIN,CODESEASON,WEEKPRICE) value ('2','4','LS','350');
insert into PRICING(CODEVILLAGE,TYPECABIN,CODESEASON,WEEKPRICE) value ('2','4','FS','550');
insert into PRICING(CODEVILLAGE,TYPECABIN,CODESEASON,WEEKPRICE) value ('3','6','LS','500');
insert into PRICING(CODEVILLAGE,TYPECABIN,CODESEASON,WEEKPRICE) value ('3','6','FS','680');
insert into PRICING(CODEVILLAGE,TYPECABIN,CODESEASON,WEEKPRICE) value ('4','1','LS','200');
insert into PRICING(CODEVILLAGE,TYPECABIN,CODESEASON,WEEKPRICE) value ('4','1','FS','370');
insert into PRICING(CODEVILLAGE,TYPECABIN,CODESEASON,WEEKPRICE) value ('4','6','LS','280');

insert into SEASON(CODESEASON,NAMESEASON) value ('LS','Low Season');
insert into SEASON(CODESEASON,NAMESEASON) value ('FS','Full Season');

INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('1', '3', '6');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('1', '5', '2');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('2', '4', '20');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('3', '6', '5');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('4', '1', '5');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('4', '4', '20');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('4', '6', '10');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('5', '5', '15');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('5', '6', '20');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('6', '2', '10');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('6', '6', '10');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('7', '2', '5');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('7', '3', '5');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('7', '4', '10');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('8', '1', '5');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('8', '4', '10');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('8', '5', '10');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('8', '6', '10');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('9', '4', '10');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('9', '5', '10');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('9', '6', '10');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('10', '4', '6');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('11', '5', '2');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('11', '6', '3');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('12', '2', '5');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('12', '4', '5');
INSERT INTO COMPOVILLAGE (CODEVILLAGE,TYPECABIN,CABINCOUNT) VALUES ('12', '6', '5');


INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('1', '1', '0');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('1', '3', '2');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('1', '5', '5');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('1', '10', '8');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('2', '2', '10');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('2', '4', '8');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('2', '5', '4');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('2', '10', '6');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('3', '1', '0');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('3', '2', '12');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('3', '4', '6');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('3', '5', '3');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('3', '9', '2');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('3', '10', '8');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('4', '2', '10');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('4', '5', '4');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('4', '10', '9');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('5', '1', '0');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('5', '6', '2');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('6', '1', '0');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('6', '5', '3');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('6', '6', '8');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('7', '2', '6');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('7', '3', '3');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('8', '1', '2');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('8', '7', '12');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('8', '8', '3');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('8', '9', '4');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('9', '1', '1');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('9', '5', '3');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('9', '7', '8');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('10', '1', '2');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('10', '2', '12');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('10', '8', '5');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('11', '2', '4');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('11', '10', '8');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('12', '1', '0');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('12', '7', '10');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('12', '8', '6');
INSERT INTO ACTIVILLAGE (CODEVILLAGE,NUMACTIVITY,PRICEACTIVITY) VALUES ('12', '9', '2');
