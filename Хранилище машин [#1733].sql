/*
1. Создать структуру данных в базе.
Таблицы.
   Кузов. Двигатель, Коробка передач.
*/

create table bodies(
	id serial primary key,
	name varchar(50)
);

create table engines(
	id serial primary key,
	name varchar(50)
);

create table transmissions(
	id serial primary key,
	name varchar(50)
);

-- 2. Создать структуру Машина. Машина не может существовать без данных из п.1.

create table cars(
	id serial primary key,
	model varchar(50),
	body_id int references bodies(id),
	engine_id int references engines(id),
	transmission_id int references transmissions(id)
);

-- 3. Заполнить таблицы через insert. 

insert into bodies (name) values
('Седан'),
('Универсал'),
('Хэтчбек'),
('Купе'),
('Лимузин');

insert into engines (name) values
('Бензин'),
('Дизель'),
('Гибрид');

insert into transmissions (name) values
('Механика'),
('Автомат'),
('Робот');

insert into cars 
(model, body_id, engine_id, transmission_id) 
values
('A1', 1, 1, 1),
('A2', 4, 1, 2),
('B1', 2, 2, 1),
('B2', 3, 3, 2),
('C1', 1, 2, 3),
('C2', 4, 3, 3),
('D1', 1, 1, 1),
('D2', 2, 2, 2);

-- 4. Вывести список всех машин и все привязанные к ним детали.

select 
c.model as model, 
b.name as body, 
e.name as engine, 
t.name as tranmission
from cars c 
join bodies b on c.body_id = b.id
join engines e on c.engine_id = e.id
join transmissions t on c.transmission_id = t.id;

-- 5. Вывести отдельно детали (1 деталь - 1 запрос), которые не используются НИ в одной машине, кузова, двигатели, коробки передач.

select b.name as body
from bodies b left join cars c
on c.body_id = b.id
where c.model is null;

select e.name as engine
from engines e left join cars c
on c.engine_id = e.id
where c.model is null;

select t.name as transmission
from transmissions t left join cars c
on c.transmission_id = t.id
where c.model is null;


