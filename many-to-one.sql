create table faculties(
	id serial primary key,
	title text
);

create table students(
	id serial primary key,
	name varchar(255),
	faculties_id int references faculties(id)
);