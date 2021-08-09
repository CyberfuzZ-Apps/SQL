create table band(
	id serial primary key,
	name varchar(255),
	since int2
);

create table song(
	id serial primary key,
	title text,
	album text,
	band_id int references band(id)
);

insert into band(name, since) values 
('Metallica', 1981),
('Black Sabbath', 1968),
('Deep Purple', 1968);

insert into song(title, album, band_id) values
('Smoke on the water', 'Machine Head', 3),
('Highway star', 'Machine Head', 3),
('Strange Kind of Woman', 'Fireball', 3),
('Fireball', 'Fireball', 3),
('War Pigs', 'Paranoid', 2),
('Iron man', 'Paranoid', 2),
('N.I.B', 'Black Sabbath', 2),
('Black Sabbath', 'Black Sabbath', 2),
('Enter Sandman', 'The Black Album', 1),
('Nothing Else Matters', 'The Black Album', 1),
('Atlas, Rise', 'Hardwired… to Self-Destruct', 1),
('Moth into flame', 'Hardwired… to Self-Destruct', 1);


select b.name, b.since, s.title, s.album 
from band as b join song as s 
on since = 1981 and album like '%Album';

select b.name, b.since, s.title, s.album 
from band as b join song as s 
on b.id = s.band_id
order by name desc;

select b.name, b.since, s.title, s.album 
from band as b join song as s 
on b.id = 3 and s.title like 'S%';

