/*

� ������� ������ ������� 

product(id, name, type_id, expired_date, price)

type(id, name)

*/

-- �������.

-- 1. �������� ������ ��������� ���� ��������� � ����� "���"

select t.name as type, p.name, p.expired_date, p.price
from products p
join type t
on t.id = p.type_id
where t.name = '���';

-- 2. �������� ������ ��������� ���� ���������, � ���� � ����� ���� ����� "���������"

select name, expired_date, price from products
where name like '%���������%';

-- 3. �������� ������, ������� ������� ��� ��������, ���� �������� ������� ��� �����

select name, expired_date, price from products
where expired_date < current_date;

-- 4. �������� ������, ������� ������� ����� ������� �������.

select name, price from products
where price = (select max(price) from products);

-- 5. �������� ������, ������� ������� ��� ������� ���� ���������� ��������� � ���� �������������. � ���� ���_����, ����������

select t.name as type_name, count(p.name) from products p
join type t on t.id = p.type_id
group by t.name;

-- 6. �������� ������ ��������� ���� ��������� � ����� "���" � "������"

select t.name as type, p.name, p.expired_date, p.price
from products p
join type t
on t.id = p.type_id
where t.name = '���' or t.name = '������';

-- 7. �������� ������, ������� ������� ��� ���������, ������� �������� ������ 10 ����. ��� ����������� ��������������� ���������� ��������� ������������� ����. ��������, ���� ���� ��� "���" � �������� "��� ����������" � "��� ���������", ������� ��� �����������, �� ���������� ��������� ���� "���" ����� 2. 

select t.name from type t
join products p on t.id = p.type_id
group by t.name
having count(p.name) < 10;

-- 8. ������� ��� �������� � �� ���.

select t.name as type, p.name, p.expired_date, p.price
from products p
join type t on t.id = p.type_id;