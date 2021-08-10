/*

В системе заданы таблицы 

product(id, name, type_id, expired_date, price)

type(id, name)

*/

-- Задание.

-- 1. Написать запрос получение всех продуктов с типом "СЫР"

select t.name as type, p.name, p.expired_date, p.price
from products p
join type t
on t.id = p.type_id
where t.name = 'СЫР';

-- 2. Написать запрос получения всех продуктов, у кого в имени есть слово "мороженое"

select name, expired_date, price from products
where name like '%мороженое%';

-- 3. Написать запрос, который выводит все продукты, срок годности которых уже истек

select name, expired_date, price from products
where expired_date < current_date;

-- 4. Написать запрос, который выводит самый дорогой продукт.

select name, price from products
where price = (select max(price) from products);

-- 5. Написать запрос, который выводит для каждого типа количество продуктов к нему принадлежащих. В виде имя_типа, количество

select t.name as type_name, count(p.name) from products p
join type t on t.id = p.type_id
group by t.name;

-- 6. Написать запрос получение всех продуктов с типом "СЫР" и "МОЛОКО"

select t.name as type, p.name, p.expired_date, p.price
from products p
join type t
on t.id = p.type_id
where t.name = 'СЫР' or t.name = 'МОЛОКО';

-- 7. Написать запрос, который выводит тип продуктов, которых осталось меньше 10 штук. Под количеством подразумевается количество продуктов определенного типа. Например, если есть тип "СЫР" и продукты "Сыр плавленный" и "Сыр моцарелла", которые ему принадлежат, то количество продуктов типа "СЫР" будет 2. 

select t.name from type t
join products p on t.id = p.type_id
group by t.name
having count(p.name) < 10;

-- 8. Вывести все продукты и их тип.

select t.name as type, p.name, p.expired_date, p.price
from products p
join type t on t.id = p.type_id;