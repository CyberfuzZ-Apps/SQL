create table students(
	id serial primary key,
	name varchar,
	birthdate date,
	course smallint
);

insert into students(name, birthdate, course) values('Evgeniy Zaytsev', '1982-04-02', 2);

select * from students;

update students set course = 3;

select * from students;

delete from students;

select * from students;