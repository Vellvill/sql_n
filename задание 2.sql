--=============== МОДУЛЬ 3. ОСНОВЫ SQL =======================================
--= ПОМНИТЕ, ЧТО НЕОБХОДИМО УСТАНОВИТЬ ВЕРНОЕ СОЕДИНЕНИЕ И ВЫБРАТЬ СХЕМУ PUBLIC===========
SET search_path TO public;

--======== ОСНОВНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
select 
concat(first_name, ' ', last_name) as "Customer name",
a.address,
cc.city,
country
from 
customer c 
inner join address a on a.address_id = c.address_id 
inner join city cc on a.city_id = cc.city_id 
inner join country c2 on cc.country_id = c2.country_id 





--ЗАДАНИЕ №2
select 
store_id as "ID store",
count(store_id) as "Count of customers"
from
customer c 
group by 
store_id




select 
store_id as "ID store",
count(store_id) as "Count of customers"
from
customer c 
group by 
store_id
having count(store_id) > 300






select 
c.store_id as "ID store",
count(c.store_id) as "Count of customers",
concat(s.first_name,' ', s.last_name) as name,
c2.city
from
customer c 
right join staff s on s.store_id = c.store_id 
right join store s2 on s.store_id = s2.store_id 
right join address a on s2.address_id = a.address_id 
right join city c2 on c2.city_id = a.city_id 
group by
c.store_id, s.first_name, s.last_name, c2.city 
having count(c.store_id) > 300 





--ЗАДАНИЕ №3
select c.customer_id,
concat(c.first_name,' ',c.last_name) as name,
count(r.customer_id) 
from customer c
inner join rental r ON r.customer_id = c.customer_id 
group by 
c.customer_id
order by 
count(r.customer_id) desc
limit 5






--ЗАДАНИЕ №4
select
concat(c.first_name,' ',c.last_name) as "Фамилия и имя покупателя",
count(r.customer_id) as "Количество фильмов",
count(p.amount) as "Общая стоимость платежей",
min(p.amount) as "Минимальная стоимость платежа",
max(p.amount) as "Максимальна стоимость платежа"
from customer c
inner join rental r ON r.customer_id = c.customer_id
full outer join payment p on r.rental_id = p.rental_id 
group by 
c.customer_id
order by 
count(p.amount) desc 







--ЗАДАНИЕ №5
select distinct 
c.city, 
c2.city
from city c 
cross join city c2 
where c.city != c2.city

 




--ЗАДАНИЕ №6
select
r.customer_id,
round(avg(date_part('day', r.return_date - r.rental_date)::numeric), 2)
from rental r
group by
r.customer_id
order by customer_id 
 




--======== ДОПОЛНИТЕЛЬНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--Посчитайте для каждого фильма сколько раз его брали в аренду и значение общей стоимости аренды фильма за всё время.





--ЗАДАНИЕ №2
--Доработайте запрос из предыдущего задания и выведите с помощью запроса фильмы, которые ни разу не брали в аренду.





--ЗАДАНИЕ №3
--Посчитайте количество продаж, выполненных каждым продавцом. Добавьте вычисляемую колонку "Премия".
--Если количество продаж превышает 7300, то значение в колонке будет "Да", иначе должно быть значение "Нет".







