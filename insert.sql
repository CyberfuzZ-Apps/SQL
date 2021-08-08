insert into roles(role) values
('Admin'),
('User'),
('Guest');

insert into rules(description) values
('All'),
('Read_Write'),
('Read');

insert into categories(category) values
('Bug'),
('Upgrage');

insert into users(name, role_id) values
('Evgeniy', 1),
('Ivan', 3);

insert into states(state) values
('Open'),
('Close');

insert into items(item, user_id, category_id, state_id) 
values
('Fix this bug', 1, 1, 1),
('Upgrade app', 1, 2, 2);

insert into item_comments(comment, item_id) values
('as soon as possible', 1),
('completed', 2);

insert into attachs(path, item_id) values
('C:\Program Files\app1.exe', 1),
('C:\Program Files\app2.exe', 2);