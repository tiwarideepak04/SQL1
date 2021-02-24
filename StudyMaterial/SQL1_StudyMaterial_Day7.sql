use hr;
-- Joins
-- Fetch different data from diff table 
-- PK & FK must 
-- Duplicates
/*Inner 
Outer
	Right
	Left
	Full(Set Operators)
Cross
Self
Natural*/
use hr;
create table cons1 
(Sid int unique not null,
Sname varchar(30) Not null,
Age int check(age between 18 and 40),
Email varchar(30) Default 'N/A' );
desc cons1;
insert into cons1 values
(6,'N',30,DEFAULT);
insert into cons1 
(sid,age,sname)
values
(10,25,'ABC');
select * from cons1;
use hr;
desc departments;-- Multiple connectivity
select * from departments;
select * from employees;
desc employees;
select 
e.employee_id,
concat(first_name,' ',last_name) 
fullname,
e.department_id,
d.department_name 
from 
employees e join departments d 
on e.department_id=d.department_id;
select 
e.employee_id,
concat(first_name,' ',last_name) 
fullname,
e.department_id,
d.department_name 
from employees e ,departments d 
where e.department_id=d.department_id;

select 
e.employee_id,
concat(first_name,' ',last_name) 
fullname,
e.department_id,
d.department_name , l.city
from employees e ,departments d ,locations l
where (e.department_id=d.department_id) and 
(d.location_id=l.location_id);

select 
e.employee_id,
concat(first_name,' ',last_name) fullname,
e.department_id,
d.department_name,
l.city
from employees e join departments d join locations l
on e.department_id=d.department_id and d.location_id= l.location_id;

show tables;
-- ER diagram 
select 
e.employee_id,
concat(first_name,' ',last_name) 
fullname,
e.department_id,
d.department_name , l.city
from 
employees e join departments d join 
locations l
on (e.department_id=d.department_id )
and (d.location_id=l.location_id);

select 
e.employee_id,
concat(first_name,' ',last_name) 
fullname, l.city,
c.country_id,
e.department_id,
d.department_name 
from 
employees e join departments d 
on e.department_id=d.department_id join locations l on d.location_id = l.location_id join countries c on l.country_id = c.country_id ;

select e.employee_id,
concat(first_name,' ',last_name) 
fullname,
e.department_id,
d.department_name,
l.city
from 
employees e join departments d join locations l
on (e.department_id=d.department_id) and 
(d.location_id=l.location_id);

select 
e.employee_id,
concat(first_name,' ',last_name) 
fullname,
e.department_id, l.city,c.country_id,
d.department_name 
from 
employees e join departments d join locations l join countries c
on e.department_id=d.department_id and d.location_id=l.location_id and l.country_id=c.country_id;

select e.employee_id,
concat(first_name,' ',last_name) fname,
e.department_id,d.department_name,l.city,l.country_id
from employees e join departments d join locations l
on (e.department_id = d.department_id) and 
(d.location_id=l.location_id);
select e.employee_id,concat(first_name,' ',last_name) 
fname,e.department_id,d.department_name,
l.city,l.country_id from employees e join
departments d join locations l on 
(e.department_id = d.department_id) and 
(d.location_id=l.location_id);

select 
e.employee_id,
concat(first_name,' ',last_name) 
fullname,
e.department_id,
d.department_name,l.city,c.country_name
from 
employees e inner join departments d 
on e.department_id=d.department_id
inner join locations l on d.location_id=l.location_id
inner join countries c on c.country_id=l.country_id;
####################################################
select employee_id,
d.department_id,department_name,
concat(first_name,' ',last_name) fullname
from employees e left  join departments d on
e.department_id=d.department_id;

select employee_id,
department_name from 
employees e left join departments d 
on e.department_id=d.department_id;

select 
e.employee_id,
concat(first_name,' ',last_name) 
fullname,l.city,country_id,
e.department_id,
d.department_name 
from employees e ,departments d,locations l 
where (e.department_id=d.department_id)
and (d.location_id=l.location_id);
select department_name from departments;

select  d.department_name, count(*)
from departments d right join employees e 
on e.department_id=d.department_id
group by department_name;
#########################################
select department_name,employee_id
from employees e left join departments d on 
e.department_id=d.department_id
union
select department_name,employee_id
from employees e right join departments d on 
e.department_id=d.department_id;

select department_name,employee_id,count(*)
from employees e left join departments d on
e.department_id=d.department_id
group by department_name
union 
select department_name,employee_id,count(employee_id)
from employees e right join departments d on
e.department_id=d.department_id
group by department_name;

select department_name,count(employee_id) from (
select department_name,employee_id
from employees e left join departments d on 
e.department_id=d.department_id
union
select department_name,employee_id
from employees e right join departments d on 
e.department_id=d.department_id) a
group by department_name;
#######################################3
-- Inner - Outer right/left/full
-- Cross/CARTESIAN (Mutiple)
-- /Self/ Natural (TOMORROW)
###################################
-- 10*10=100
select employee_id,department_name
from employees e cross join departments;
select employee_id,department_name
from employees e , departments;
##################################
-- e-commerce,retails
create table p1 
(pid int ,pname varchar(20),price int );
insert into p1 values
(1,'AC',20000),(2,'WM',12000);
create table p2 
(pid int ,pname varchar(20),price int );
insert into  p2 values
(100,'Stab',2000),(101,'Remote',120);
select * , p1.price+p2.price  net
from p1,p2;
-- DBA speed / performance
-- table very big t1,t2
-- select * from t1,t2; cross join  
-- 100,100 10 min 
-- 1+1
###################################
/*For every branch find 
the sum of calculated profit 
after ignoring the loss.  */
Select branch, sum(revenue-cost)
From Bank_branch_PL
where revenue-cost > 0
Group by branch;
use inclass;
Select branch, product , 
sum(revenue-cost),
sum(estimated_profit )
From Bank_branch_PL
where revenue > cost
group by  branch, product
having sum(revenue-cost) >  
sum(estimated_profit ) ;

select branch, product,
 sum(revenue-cost) profit
 from bank_branch_pl
where revenue > cost 
 group by branch,product
 having profit>
 sum(Estimated_profit);
 
 select branch,product,
 sum(revenue-cost) profit 
 from bank_branch_pl
 where revenue>cost 
 group by product,branch 
 having profit> 
 sum(Estimated_profit);
 
Select branch,product,
sum(estimated_profit)  , sum(revenue-cost)
From Bank_branch_PL
group by  branch , product
having 
sum(estimated_profit)<1.1*sum(revenue-cost);

select product, sum(revenue - cost) profit from bank_branch_pl 
group by product having profit 
between 
(sum(Estimated_profit)-
(sum(Estimated_profit)*0.10)) 
and sum(Estimated_profit);
Select branch,product,
sum(estimated_profit) ,
sum(revenue- .7*cost)
From Bank_branch_PL
where revenue<cost
group by  branch , product
having sum(revenue- .7*cost)>sum(estimated_profit);

select branch, product, sum(revenue - (cost- 0.3*cost)) 
profit from bank_branch_pl 
group by branch, product having profit > sum(Estimated_profit);

###################################
use hr;
select department_name ,
employee_id
from employees e join departments d
on e.department_id=d.department_id
and department_name='Purchasing' ;
###################################
-- Self/Natural
-- Practice
####################################
-- Joins
####################################





 



