use hr;
-- Intro Derived 
-- Joins Introduce 
-- Inclass complete 
-- doubts
-- Inclass due date 3/4 10th Oct
#################################
-- Easy to perform ,syntax,limitation
-- Merge Data 
use bangaloreaug;
create table t1 (sno int ,sal int);
insert into t1 values
(1,499),(2,456),(3,345);
drop table t2;
create table t2 (roll int );
insert into t2 values
(1),(2),(4),(5);

select sno from t1
union all
select roll from t2;
use bangaloreaug;

create table t3 as 
select * from t1;

create table hr.t1 as 
select * from bangaloreaug.t1;
use hr;
insert into t1 values(1);
select sno from t1
union 
select department_id from employees;
####################################
use inclass;
create table new1 as 
select player_name,popularity,null 'Charisma'
from cricket_1
union
select player_name,charisma,charisma
from cricket_2;
select player_name,popularity,
ifnull(charisma,'NA') from new1;
-- * not a good practice
-- select * from employees where sal>9000;
-- column desired 
-- copy table empty
use hr;
select * from employees;
drop table t25;
create table t25
select * from employees 
where 1=2;
CREATE TABLE new_table
 LIKE employees;
desc t25;
select * from new_table;
select * from employees
where salary=0000;
################################
-- Derived Tables
select * from (
select employee_id,
hire_date,
datediff(current_date,hire_date)/365
tenure from employees)t
where tenure>25;
-- a=90;
show tables;
select employee_id,
hire_date,
datediff(current_date,hire_date)/365
tenure from employees 
having tenure>25;
select * from employees 
where salary>8000;
select * from employees 
having salary>8000;
###################################
/*
*
**
***
*/
create table t10
(star varchar(4));
insert into t10 values
('*'),('**'),('***');
select * from t10;
select '*' from dual
union 
select '**' from dual
union  
select '***' from dual;
-- loop i++
create table t122 (star varchar(5));
insert into t122 values (('*'));
insert into t122 values (('**'));
insert into t122 values (('***'));
select * from t122;
select (select count(*) from employees) emp,
(select count(*) from departments) dept from dual;
select count(employee_id) as emp,
 (select count(department_id) from
 departments) countt from employees;

select count(employee_id) emp from employees
union
select count(department_id) dept from departments;


select count(department_id),
coalesce(null,107) from departments
union
select count(employee_id), null from employees
limit 1;

select * from ((select count(*) emp  from employees)
 a,(select count(*) dept  from departments) b);

select (select count(*) from employees ) emp,
(select count(*) from departments) dept
from dual;
select (select count(*) from employees) emp,
(select count(*) from departments) dept from dual;

create table t_t(sno int,sal int );
insert into t_t values(1,230),
(2,890),(1,230);

select count(*) from( 
select distinct * from t_t)t;
select count(*) from t_t group by sno,sal limit 1;
Select month,sum(Purchase_cost ) , 
avg(estimated_sale_price ) 
from Bank_inventory_pricing Where month= 2;
SELECT round(AVG(estimated_sale_price),2)
FROM bank_inventory_pricing;

select Month,Product,count(*)
 from Bank_Inventory_pricing 
 where Month=1 group by Product having count(*)>1;

select Product,count(*) as count 
from Bank_Inventory_pricing 
where month=1
group by Product having count(*)>1;

select Product,count(Product)
 from Bank_Inventory_pricing 
 where purchase_cost>ifnull(estimated_sale_price,0)
 group by Product having count(Product)>1;
Select product , count(product) 
from Bank_inventory_pricing 
Where purchase_cost > ifnull(estimated_sale_price,0)
Group by product 
Having count(product ) > 1;

select Product,count(Product)
 from bank_inventory_pricing 
 where (Purchase_cost>
 IF(Estimated_sale_price IS NOT NULL,
 Estimated_sale_price, 0))
group by Product having count(Product)>1;
select sum(if(Purchase_cost is not null,
Purchase_cost,2000)) as
total_purchase_cost from 
bank_inventory_pricing;

Select sum(ifnull(purchase_cost , 2000) )
from Bank_Inventory_pricing;

select distinct Product, Quantity, Price,
purchase_cost, Estimated_sale_price 
from Bank_inventory_pricing;
-- ,not,<>,!=  
select avg(ifnull(purchase_cost,Estimated_sale_price))
 from Bank_inventory_pricing;
 
 Select count(distinct product ) 
 from Bank_inventory_pricing;
 select Product,
 (max(purchase_cost)-min(purchase_cost))
 from Bank_Inventory_pricing group by Product;
 Select product , avg(purchase_cost )
from Bank_inventory_pricing 
group by product 
having avg(purchase_cost ) > 6000;

Select product  , avg(purchase_cost ) , sum(purchase_cost)
from Bank_inventory_pricing
group by Product
having avg(purchase_cost ) < sum(purchase_cost);

select Product from Bank_Inventory_pricing group by Product having avg(purchase_cost)<sum(purchase_cost);

Select Product,avg(Estimated_sale_price )  
from   Bank_inventory_pricing
Where purchase_cost  is null 
group  by Product;

SELECT Product,
MAX(Estimated_sale_price ),
sum(Quantity)        	 
FROM `bank_inventory_pricing`
where purchase_cost is not null
GROUP BY
product
having sum(Quantity)  > 4;
Select Product, avg(purchase_cost)           
from    Bank_inventory_pricing
group  by Product
having ifnull(avg(purchase_cost ), 0 )  < 200;

SELECT Product,  
AVG(Estimated_sale_price )          as original_avg_estimate_price,
AVG(Estimated_sale_price) * 1.15 as new_avg_estimate_price
from bank_inventory_pricing
GROUP BY Product having AVG(purchase_cost)>AVG(Estimated_sale_price);

SELECT Product,  
AVG( ifnull(purchase_cost , greatest(price, estimated_sale_price) ))
from bank_inventory_pricing
Where product = 'BusiCard'
Group by Product;

select product , avg(price ) , count( distinct month ) 
from bank_inventory_pricing 
Group by product 
Having count(distinct month) > 2;
-- take 3/take home 4
use inclass;
select round(TotalAmount) from churn1 where PaymentMethod = 'Electronic check' 
order by TotalAmount desc limit 1; 
select round(MonthlyServiceCharges), round(TotalAmount) from churn1 where PaymentMethod = 'Electronic check' 
order by MonthlyServiceCharges asc, TotalAmount desc limit 1 ;
show tables;
/*
select round(MonthlyServiceCharges),
round(TotalAmount) r
from churn1 where PaymentMethod = 'Electronic check' 
order by MonthlyServiceCharges asc,r desc;
*/
############################3
-- Joins 
-- Extracting data from more than 
-- 1 table
-- PK-FK
-- two - pk - fk it's good 
#################################
-- n-1 (2 -1 ,4-3)
-- common columns are not always
-- Types
-- Inner/Equi
-- Outer 
	 -- Right
     -- Left
     -- Full(Not in MySQL-Union or Unions All )
-- Cross/Cartesian
-- Self
-- (Natural)
######################################
-- Joins-Multiply(Increase/BLOT/Duplicate)
-- Behaviour
-- Cast/Convert
#######################################










