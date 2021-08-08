create table posts(
	id serial primary key,
	post varchar(255)
);

create table workers(
	id serial primary key,
	name varchar(255)
);

create table worker_post(
	id serial primary key,
	worker_id int references workers(id),
	post_id int references posts(id)
);