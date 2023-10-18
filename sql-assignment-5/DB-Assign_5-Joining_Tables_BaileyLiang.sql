--BAILEY LIANG	ASSIGNMENT 5 JOINING TABLES
--Put your answers on the lines after each letter. E.g. your query for question 1A should go on line 5; your query for question 1B should go on line 7...
--1 
-- A
select `sales`.date, `stock_items`.item from `sales` 
inner join `stock_items` on `sales`.item = `stock_items`.`id` 
where `sales`.item = 1014;
-- B
select `sales`.item, `sales`.`employee`, `stock_items`.`item`, `stock_items`.`category` from `sales` 
inner join `stock_items` on `sales`.item = `stock_items`.`id` 
where `sales`.`item` = 1003;

--2
-- A
select `sales`.date, `employees`.`first_name`, `employees`.`last_name`, `sales`.`item` from `sales` 
inner join `employees` on `employees`.id = `sales`.`employee` 
where `employees`.`id` = 111;
-- B
select `sales`.date, `employees`.`first_name`, `employees`.`last_name`, `sales`.`item` from `sales`
right join `employees` on `employees`.id = `sales`.`employee`
where `employees`.`sin` like '258%' or `employees`.`sin` like '456%' or `employees`.`sin` like '753%';

--3
-- A
select sales.date, sales.item, employees.first_name from `sales`
inner join employees on employees.id = sales.employee
-- You asked for 'this year', but there are no entries in 2023, although
-- if there was, this would be the statement to get it.
-- where sales.date >= '2023-06-12' and sales.date <= '2023-06-18';
where sales.date >= '2021-06-12' and sales.date <= '2021-06-18';

-- B
select a.total, employees.first_name, employees.last_name
from (select count(sales.employee) as 'total', sales.employee from sales 
      group by sales.employee) as a
inner join employees on employees.id = a.employee
order by a.total desc;

--4
-- A (employee 114 had the most sales based on 3B)
select b.date, b.item, b.price, b.category, employees.first_name
from (select a.date, stock_items.item, stock_items.price, stock_items.category, a.employee 
      from (select sales.date, sales.item, sales.employee 
            from sales 
            where sales.employee = 114) as a
      inner join stock_items on stock_items.id = a.item) as b
inner join employees on b.employee = employees.id;
-- B
--this is my best guess as to what you might've been asking for in Pt4-B
select a.most_recent_sale_date, stock_items.id, stock_items.item, stock_items.price, stock_items.category
from (select max(sales.item) as item, max(sales.date) as most_recent_sale_date 
      from sales 
      group by sales.item) as a
right join stock_items on a.item = stock_items.id
order by stock_items.id asc;