create table roles(
	id serial primary key,
	role varchar(255)
);

create table rules(
	id serial primary key,
	description text
);

create table categories(
	id serial primary key,
	category text
);

create table users(
	id serial primary key,
	name varchar(255),
	role_id int references roles(id)
);

create table role_rules(
	id serial primary key,
	role_id int references roles(id),
	rule_id int references rules(id)
);


create table states(
	id serial primary key,
	state varchar(5),
	check (state in ('Open', 'Close'))
);

create table items(
	id serial primary key,
	item text,
	user_id int references users(id),
	category_id int references categories(id),
	state_id int references states(id)
);

create table item_comments(
	id serial primary key,
	comment text,
	item_id int references items(id)
);

create table attachs(
	id serial primary key,
	path text,
	item_id int references items(id)
);