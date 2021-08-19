-- Таблица company

CREATE TABLE company
(
    id integer NOT NULL,
    name character varying,
    CONSTRAINT company_pkey PRIMARY KEY (id)
);

-- Таблица person

CREATE TABLE person
(
    id integer NOT NULL,
    name character varying,
    company_id integer references company(id),
    CONSTRAINT person_pkey PRIMARY KEY (id)
);

insert into company (id, name) values (1, 'Thoughtblab');
insert into company (id, name) values (2, 'Vidoo');
insert into company (id, name) values (3, 'Linklinks');
insert into company (id, name) values (4, 'Oyope');
insert into company (id, name) values (5, 'Vinder');
insert into company (id, name) values (6, 'Realblab');
insert into company (id, name) values (7, 'Ooba');
insert into company (id, name) values (8, 'Oyoyo');

insert into person (id, name, company_id) values (1, 'Sapphira Heifer', 2);
insert into person (id, name, company_id) values (2, 'Granthem Goodale', 2);
insert into person (id, name, company_id) values (3, 'Lars O''Kieran', 5);
insert into person (id, name, company_id) values (4, 'Joelly Dyott', 6);
insert into person (id, name, company_id) values (5, 'Betta Broune', 3);
insert into person (id, name, company_id) values (6, 'Christabel Firmager', 5);
insert into person (id, name, company_id) values (7, 'Allyn Henzer', 4);
insert into person (id, name, company_id) values (8, 'Tierney Ousley', 1);
insert into person (id, name, company_id) values (9, 'Aguistin Fuentez', 1);
insert into person (id, name, company_id) values (10, 'Aluin Willock', 5);

/*
1. В одном запросе получить:
- имена всех person, которые не состоят в компании с id = 5;
- название компании для каждого человека.
*/

select p.name, c.name as company 
from person p
join company c 
on c.id = p.company_id
where p.company_id != 5;

/*
2. Необходимо выбрать название компании с максимальным 
количеством человек + количество человек в этой компании.
*/

select c.name as company, count(p.name) as quantity
from company c 
join person p on p.company_id = c.id
group by c.name
order by quantity desc
limit 1;
