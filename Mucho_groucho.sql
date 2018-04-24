USE sakila;

#1a
select first_name, last_name from actor;
#1b
ALTER TABLE actor
add COLUMN Actor_name varchar(90) not null after last_name;
UPDATE actor SET Actor_name = concat(first_name, ' ', last_name);
update actor set Actor_name = upper(Actor_name);

#2a
select actor_id, first_name, last_name from actor
where first_name = "Joe";
#2b
select actor_id, first_name, last_name from actor where last_name like "%GEN%"; 
#2c
select last_name, first_name from actor where last_name like "%LI%";
#2d
select country_id, country from country
where country IN ("Afghanistan", "Bangladesh", "China");

#3a
alter table actor add column middle_name varchar(45) not null after first_name;
#3b
alter TABLE actor modify column middle_name blob;
#3c
alter table actor drop COLUMN middle_name;

#4a
select last_name, count(last_name) as same_name_count from actor
group by last_name;
#4b
select last_name, count(last_name) as more_than_2 from actor
group by last_name having more_than_2 >= 2;
#4c
#select  Actor_name, first_name, last_name from actor where Actor_name = "groucho williams"; #check the result
update actor set first_name = "HARPO" where first_name = "GROUCHO";
#update actor set Actor_name = "HARPO WILLIAMS" where Actor_name = "groucho williams";
#4d
update actor set first_name = if (first_name = "HARPO", "GROUCHO", if(first_name = "GROUCHO", "MUCHO GROUCHO",
if(first_name = "MUCHO GROUCHO", "HARPO", first_name)));
#4d v.2
update actor set first_name = case when first_name = "HARPO" then "GROUCHO" when first_name = "GROUCHO" then "MUCHO GROUCHO"
when first_name = "MUCHO GROUCHO" then "HARPO" else first_name end;




select * from country;
select * from actor;