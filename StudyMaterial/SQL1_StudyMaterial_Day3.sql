use hr;
select * from employees;
-- select alias,distinct
-- order by ,
-- limit 
-- where + operators
-- Inclass 
set autocommit=0;
select * from employees;
delete from employees
where employee_id=100;
update employees
set salary=25000
where employee_id=100;
alter table employees
drop column salary;

desc employees;
-- 34.56 int 35
##########################
-- alias,distinct
-- order by ,limit,
-- order by arrange the data 
-- in a way asc/desc as column
select employee_id,
first_name,salary
from employees
order by first_name asc;

select employee_id,
first_name,salary
from employees
order by salary desc,
first_name desc ;
select employee_id,
first_name,salary
from employees
order by 2 desc,3 ;
-- dummy - 10 M 
-- 30 
-- Data
select * from dummy; 
-- 3 hrs
select * from employees
limit 12;

select * from employees
limit 5 ;
-- first_name,salary 
-- highest salary
select distinct salary
from employees order by 
salary desc limit 3,1;

select first_name,salary
from employees order by 
salary desc ;
select distinct salary from employees
order by salary limit 2,1;

select distinct salary,first_name
from employees 
order by salary asc
limit 2,1 ;
-- Execution Order By 
select  concat(first_name,
' ',last_name) fullname,
salary from employees
order by salary desc 
limit 10;
/*
From
Where
select 
order by 
limit
*/
-- where  and operators
-- Filter the rows
/*
Relational:->=,<=
Airth +,-,/,*,%
Logical and ,or ,not
conditional if,case
Comparison >,<,=,(!=,<>)
Between
In
Like
*/
select * from employees
where salary>8000;
-- BODMAS 
select * from employees
where (department_id=50 or 
department_id=80) and 
salary>8000;
select * from employees
where department_id
in(50,80) and salary>8000;

select * from employees
where salary >=15000
 and salary <= 25000;

-- >=15000 and <=25000 
select * from employees
where salary between 15000
and 25000;
select * from employees;
-- 'IT_Prog',>5000,deptid=60;
select * from employees
where job_id='IT_PROG'
and salary>15000 
and department_id=60;
select * from employees 
where (job_id ='IT_Prog')
and (salary > 5000) and 
(dept_id = 60);

select job_id, salary, 
department_id from
employees where 
(job_id = 'IT_PROG'and  
salary > 5000 and
department_id = 60);
############################
-- Like 
-- Inclass
select distinct salary, 
first_name from employees
order by salary;-- subqueries
select first_name from 
employees 
limit 2,3;
select concat('Your name: '
,first_name,' ',last_name)
as Fullname,salary from 
employees where 
salary<20000 and
department_id in (50,80,20) order by salary desc limit 5;
select * from employees;
-- Limit MySQL
-- Oracle etc TOP and Bottom
select top 5 from employees;
select bottom 5 from employees;
-- decimal(9,2)
-- Pattern Matching
-- first_name='Namrata'
-- like operator 
-- wild card characters _,%
-- _ (1 character),% 0 or more than 1 
select first_name 
from employees where
first_name like '%L___'; 
drop table t1;
create table t1
(name varchar(20) );
insert into t1 values
('Nam%rata');
select * from t1
where name like '___\_%';

select name from t1 
where name like '___\_%';

select * from t1
where name like '___\%%';

select * from t1
where name like '%\_%';
##########################
select * from cricket_12;
CREATE DATABASE bank;
Create table Bank_Inventory(
Product CHAR(10) , 
Quantity INT,
Price Real,
purchase_cost Decimal(6,2),
estimated_sale_price  Float);

Alter table Bank_Inventory 
add Geo_Location 
Varchar(20);

-- is null/is not null
-- Functions
-- Takehome please leave function q
Update Bank_inventory
set Geo_Location = 
'Delhi-City' 
where Geo_Location is null;

ALTER TABLE 
Bank_Inventory
modify COLUMN 
Product varchar(10);
update Bank_Inventory 
set Quantity=10 where
Product='PayCard';
Create table Bank_Holidays 
 ( Holiday  date ,
 Start_time datetime ,
End_time timestamp);
set sql_safe_updates=0;
-- group by, joins



