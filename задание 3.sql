--=============== МОДУЛЬ 4. УГЛУБЛЕНИЕ В SQL =======================================
--= ПОМНИТЕ, ЧТО НЕОБХОДИМО УСТАНОВИТЬ ВЕРНОЕ СОЕДИНЕНИЕ И ВЫБРАТЬ СХЕМУ PUBLIC===========
SET search_path TO public;

--======== ОСНОВНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--База данных: если подключение к облачной базе, то создаёте новую схему с префиксом в --виде фамилии, название должно быть на латинице в нижнем регистре и таблицы создаете --в этой новой схеме, если подключение к локальному серверу, то создаёте новую схему и --в ней создаёте таблицы.

--Спроектируйте базу данных, содержащую три справочника:
--· язык (английский, французский и т. п.);
--· народность (славяне, англосаксы и т. п.);
--· страны (Россия, Германия и т. п.).
--Две таблицы со связями: язык-народность и народность-страна, отношения многие ко многим. Пример таблицы со связями — film_actor.
--Требования к таблицам-справочникам:
--· наличие ограничений первичных ключей.
--· идентификатору сущности должен присваиваться автоинкрементом;
--· наименования сущностей не должны содержать null-значения, не должны допускаться --дубликаты в названиях сущностей.
--Требования к таблицам со связями:
--· наличие ограничений первичных и внешних ключей.

--В качестве ответа на задание пришлите запросы создания таблиц и запросы по --добавлению в каждую таблицу по 5 строк с данными.
 
--СОЗДАНИЕ ТАБЛИЦЫ ЯЗЫКИ
create table "language"(
language_id serial primary key,
langauge varchar(50) unique not null
)


--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ ЯЗЫКИ
insert into language (langauge)
values ('Английский'),
('Французкий'),
('Русский')


--СОЗДАНИЕ ТАБЛИЦЫ НАРОДНОСТИ
create table "nationality"(
nationality_id serial primary key,
nationality varchar(255) unique not null
)


--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ НАРОДНОСТИ
insert into nationality (nationality)
values ('Англичанин'),
('Француз'),
('Русский')



--СОЗДАНИЕ ТАБЛИЦЫ СТРАНЫ
create table "countrys"(
county_id serial primary key,
country varchar(255) unique not null
)


--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ СТРАНЫ
insert into countrys (country)
values ('Англия'),
('Франция'),
('Россия')

--СОЗДАНИЕ ПЕРВОЙ ТАБЛИЦЫ СО СВЯЗЯМИ
create table lan_nat(
	language_id INTEGER,
	nationality_id INTEGER,
	primary key(language_id, nationality_id),
	FOREIGN KEY (language_id) REFERENCES "language"(language_id),
	FOREIGN KEY (nationality_id) REFERENCES "nationality"(nationality_id)
)


--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ СО СВЯЗЯМИ
insert into lan_nat(language_id, nationality_id) values
(1,1),
(2,2),
(3,3)

--СОЗДАНИЕ ВТОРОЙ ТАБЛИЦЫ СО СВЯЗЯМИ
create table nat_coun(
	nationality_id INTEGER,
	country_id INTEGER,
	primary key(nationality_id, country_id),
	FOREIGN KEY (nationality_id) REFERENCES "nationality"(nationality_id),
	FOREIGN KEY (country_id) REFERENCES "countrys"(county_id)
)


--ВНЕСЕНИЕ ДАННЫХ В ТАБЛИЦУ СО СВЯЗЯМИ
insert into nat_coun(nationality_id, country_id) values
(1,1),
(2,2),
(3,3)
