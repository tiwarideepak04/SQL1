-- Single row functions
select DOB,floor(datediff(now(),
str_to_date(DOB, '%d-%m-%Y'))/365)
age from Example_h;
use bangaloreaug;
select * from example1;
desc example1;-- 'yyyy-mm-dd'
alter table example1
modify dob date;
-- Multiple row + Group 
-- Null / Conditional
use hr;
select * from employees;
select employee_id,
salary,commission_pct,
ifnull(commission_pct,1),
salary + (salary * ifnull(commission_pct,0)) net
from employees;
-- any calculation with NULL=NULL
-- NOT NULL
select commission_pct,manager_id,
ifnull(commission_pct,manager_id),
coalesce(commission_pct,manager_id,0)
from employees;
select * from employees;
select coalesce(NULL,NULL,null,2); 

select employee_id,
salary,commission_pct,
ifnull(commission_pct,1),
salary + (salary * ifnull(commission_pct,0)) net,
salary+(salary*coalesce(commission_pct,0)) net2
from employees;
select * from employees;
select employee_id,
coalesce(commission_pct,'NA'),
salary+(salary*coalesce(commission_pct,0)) net 
from employees 
where first_name like 'S%';
##############################
-- 500 
-- loop
select * from employees
where commission_pct is null;
select ifnull(col1,0);
##############################
-- if(),case
-- advance / sql2 / logics/pivot(arrangements)
select salary,
if(salary between 20000 and 25000,1,0),
if (salary between 10000 and 19000,2,0)
from employees;
select salary,
case 
when salary between 20000 and 25000 then 1 
when salary between 10000 and 19000 then 2
else 3 
end output from employees;
select * from employees;
/*MGR manager
CLERK clerk
'None'*/
select job_id,
case 
when job_id like '%mgr%' then 'Manager'
when job_id='clerk%' then 'Clerk'
else 'None' end output
from employees;
######################################
-- Multiple row function
-- sum,avg,count,max,min
-- find out maxi,min 
select salary
from employees
order by salary asc
limit 1;
select salary from employees 
order by salary desc limit 1 ;
select salary from employees 
order by salary desc limit 1;

select sum(salary),
avg(salary),sum(salary+salary)/107 avg, 
avg(commission_pct),
sum(commission_pct)/107,
max(salary),min(salary),
count(*),count(employee_id),
count(commission_pct)
from employees;
select * from employees;
select sum(9+9) ,sum(9-9) from dual;
select (1 and null),
(1 or null) from dual;
-- 10000 1 namrata
-- 10001 2 namrata
-- rownum Oracle
select department_id,job_id,count(*),
sum(salary)
from employees;-- error
select department_id,sum(salary)
from employees
group by department_id;-- unique
-- total salary each dept,
-- avg,total no employees;
select department_id, 
avg(salary), count(employee_id),
sum(salary) from employees group by department_id 
order by department_id  ;

select department_id,
avg(salary),
max(salary),
min(salary),
sum(salary),
count(employee_id)
from employees
group by department_id;

select department_id , 
avg(salary), sum(salary)
from employees group by 
department_id;

select department_id,
ifnull(job_id,'NA'),
count(employee_id) c
from employees 
group by department_id,job_id
with rollup 
order by department_id desc,
job_id desc;

-- alias in group by ,having error 
-- MySQL diff alogorithm / compatible
-- windows / mac 
select * from employees;
-- total employee in each job
select job_id,first_name,
count(employee_id)
from employees
where job_id like 'Sh_Clerk%'
group by job_id,first_name;
-- sh_clerk

select job_id,first_name,count(*) 
from employees where 
job_id='Sh_Clerk'
group by job_id,first_name;

SELECT job_id,
 COUNT(*)
 FROM employees GROUP BY 
 job_id;

-- Inclass3 
-- Set operators
-- total no of empl 
-- in dept=50 and 80

select department_id,
count(employee_id)
from employees
where department_id in (50,80)
group by department_id
having count(*)>40;
select department_id,
count(employee_id)
from employees
where department_id in (50,80)
group by department_id;
select department_id,
count(employee_id)
from employees
group by department_id
having count(*)>40;
-- diff where / having 
select job_id,count(*)
from employees 
where job_id in ('IT_PROG','AD_VP')
group by job_id;
select job_id,count(*)
from employees 
group by job_id
having count(*)>2 and 
job_id in ('IT_PROG','AD_VP');

select * from employees;
/*no of emplo which are 
hire on same date*/

select department_id d,
job_id j from employees
group by d,j;-- not in other dbs

select hire_date,count(hire_date)
from employees
group by hire_date;
################################
-- Inclass 3 
-- Inclass 1 / Takehome 1
-- Inclass 2 / Takehome 2
#########################
-- Inclass 3 / Takehome 3
-- Joins important / Takehome 4
###################################
select upper(player_name), 
Coalesce(charisma,0)
from new_cricket 
order by player_name;


select salary, 
if (salary >= 20000 and salary <= 25000,1,3) from 
employees;
-- then else end case
-- if(if(if()))
use bangaloreaug;
desc new_cricket;
select `Player_Name_[0]` from new_cricket;
select * from new_cricket;
-- DDLconstraint 
select `player_id_[0]`,
`player_name_[0]` from new_cricket;
-- job_id (it_prog,ad_vp)

-- Set Operators complete
-- Joins Introduce 
-- Inclass complete 
-- doubts

select * from employees
where first_name like 'S%';

use hr;
select * from 
employees where salary<8000;





