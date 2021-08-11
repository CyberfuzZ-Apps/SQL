-- 1. Создать таблицы и заполнить их начальными данными


create table departments (
	id serial primary key,
	name VARCHAR(50)
);

create table emploees (
	id serial primary key,
	name VARCHAR(50),
	department_id int references departments(id)
);


insert into departments (name) values ('Engineering');
insert into departments (name) values ('Sales');
insert into departments (name) values ('Product Management');
insert into departments (name) values ('Research and Development');
insert into departments (name) values ('Marketing');
insert into departments (name) values ('Support');
insert into departments (name) values ('Services');


insert into emploees (name, department_id) values ('Martyn Limpkin', 3);
insert into emploees (name, department_id) values ('Nixie Flacknell', 4);
insert into emploees (name, department_id) values ('Ninon Purton', 1);
insert into emploees (name, department_id) values ('Jessamyn Loram', 2);
insert into emploees (name, department_id) values ('Hans Stendall', 6);


-- 2. Выполнить запросы с left, rigth, full, cross соединениями


select * from departments d left join emploees e
on d.id = e.department_id;

select * from departments d right join emploees e
on d.id = e.department_id;

select * from departments d full join emploees e
on d.id = e.department_id;

select * from departments d cross join emploees e;


-- 3. Используя left join найти департаменты, у которых нет работников


select * from departments d left join emploees e
on d.id = e.department_id
where e.id is null;


-- 4. Используя left и right join написать запросы, которые давали бы одинаковый результат.


select * from departments d left join emploees e
on d.id = e.department_id;

select * from emploees e right join departments d
on d.id = e.department_id;


-- 5. Создать таблицу teens с атрибутами name, gender и заполнить ее. Используя cross join составить все возможные разнополые пары


create table teens(
	id serial primary key,
	name varchar(50),
	gender char(1),
	check (gender in ('F', 'M'))
);


insert into teens (name, gender) values
('Alex', 'M'),
('Ivan', 'M'),
('Evgeniy', 'M'),
('Maria', 'F'),
('Elena', 'F'),
('Sofia', 'F');


select a.name, b.name from teens a cross join teens b
where a.gender != b.gender;

