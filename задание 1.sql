--=============== МОДУЛЬ 2. РАБОТА С БАЗАМИ ДАННЫХ =======================================
--= ПОМНИТЕ, ЧТО НЕОБХОДИМО УСТАНОВИТЬ ВЕРНОЕ СОЕДИНЕНИЕ И ВЫБРАТЬ СХЕМУ PUBLIC===========
SET search_path TO public;

--======== ОСНОВНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
select distinct city from city





--ЗАДАНИЕ №2
select distinct city from city where city like 'L%a' and city not like '% %'





--ЗАДАНИЕ №3
select * from payment p where payment_date between '2007-03-16 00:00:00' and '2007-03-20 23:59:59' and amount > 1.00
order by payment_date






--ЗАДАНИЕ №4
select * from payment p 
order by payment_date desc
limit 10





--ЗАДАНИЕ №5
select 
concat(first_name, ' ', last_name) as "И и Ф",
email as "ЭП",
character_length(email) as "дл ЭП",
date_trunc('day', last_update) as "дата"
from customer c 
order by last_update





--ЗАДАНИЕ №6
select 
LOWER(first_name) as first_name,
LOWER(last_name) as last_name,
active 
from customer c 
where first_name = 'Kelly' or (first_name = 'Willie' and active = 1)





--======== ДОПОЛНИТЕЛЬНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
select 
film_id,
title,
description,
rating,
rental_rate 
from 
film f 
where rating = 'PG-13' or rating = 'R' 
and rental_rate >= 0 and rental_rate <= 4.00
order by title 




--ЗАДАНИЕ №2
select 
title,
description 
from 
film f 
order by length(description) desc 
limit 3





--ЗАДАНИЕ №3
select 
customer_id,
email,
substring(email from 1 for position('@' in email) - 1),
substring(email from position('@' in email) + 1)
from 
customer c 
order by customer_id





--ЗАДАНИЕ №4
select 
customer_id,
email,
UPPER(
substring(
substring(email from 1 for position('@' in email) - 1)
from 1 for 1
)
)
||
substring(
substring(email from 1 for position('@' in email) - 1)
from 2 for length(substring(email from 1 for position('@' in email) - 1))
),
UPPER(
substring(
substring(email from position('@' in email) + 1)
from 1 for 1
)
)
||
substring(
substring(email from position('@' in email) + 1)
from 2 for length(substring(email from position('@' in email) + 1))
)
from 
customer c 
order by customer_id

.


