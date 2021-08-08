create table vk(
	id serial primary key,
	user_id varchar(255)
);

create table users(
	id serial primary key,
	name varchar(255),
	user_id int references vk(id) unique
);