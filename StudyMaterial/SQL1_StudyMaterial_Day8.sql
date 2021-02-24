use hr;
select * from employees;
-- Self/Natural
-- Doubts
#####################################
-- Inner/Outer/Cross
-- Logics
drop table t1;
create table t1 
(sno int ,city varchar(20));
insert into t1 values
(1,'Delhi'),(2,'Delhi'),(3,'Bang');
select * from t1;

select a.sno,a.city 
from t1 a join t1 b 
on a.city=b.city and 
a.sno<>b.sno;
select * from employees;
-- first_name,employee_id,hire_date
-- same date
select * from t1;
insert into t1 values
(1,'Delhi');

select e1.first_name,e2.first_name,
e1.employee_id,e2.employee_id,e1.hire_date,
e2.hire_date from employees e1 
inner join 
employees e2 on e1.hire_date=e2.hire_date
and e1.employee_id!=e2.employee_id;
select distinct a.first_name,
a.employee_id,a.hire_date
from employees a join employees b
where a.employee_id<>b.employee_id
and a.hire_date=b.hire_date
order by hire_date;
select distinct e.first_name, 
e.employee_id,e.hire_date
from employees e join employees d
on e.hire_date=d.hire_date and
e.employee_id != d.employee_id;
select distinct e1.first_name, e1.employee_id,e1.hire_date
from employees e1 
join employees e2 on
e1.hire_date=e2.hire_date 
and e1.employee_id<>e2.employee_id;

select distinct e1.first_name 
Name_1,e2.first_name Name2,
e1.employee_id,e1.hire_date
from employees e1 join employees e2
on e1.hire_date = e2.hire_date
and e1.employee_id<>e2.employee_id;
-- Pending 
####################################
select sno,city ,
count(*) no_records 
from t1
group by sno,city
having count(*)>1;
###################################
select * from t1;
-- rownum Oracle
###########################
select * from t1;
select sno,city,count(*) from t1
group by sno,city
having count(*)>1 ;
#############################
select sno ,City,rownum from t1
where sno=1;
#############################
-- Subquery
-- distinct *,distinct sno ,
-- derived table , group by 
create table t2 as 
select * from t1 
union 
select * from t1;
select * from t2;
show tables;
select * from p1,p2;
select * from p1 cross join p2;
select * from p1 join p2;
select * from p1 inner join p2;
select * from 
employees e natural join departments d;
#########################################
create table dummy 
(sno int ,roll varchar(20));
insert into dummy values
(10,'namrata');
select *,sno+roll net  from dummy;
select count(*)+count(*) ;
select 'namrata'+'namrata';
#################################
-- Joins Takehome 4  
################################
select date_format(hire_Date, 
'%Y-%m') from employees;
use inclass;
select bad.customer_id,
 bad.account_number, 
 bad.balance_amount,
 bat.transaction_amount , bat.Transaction_Date 
from bank_account_details bad join bank_account_transaction bat on bad.account_number = bat.account_number 
where month(bat.Transaction_Date) != 3;

Select ba.Customer_id, ba.Account_Number, Balance_amount, Transaction_amount, Transaction_Date
from Bank_Account_Details ba  
Left join bank_account_transaction bat
on ba.account_number = bat.account_number
where date_format(Transaction_Date , '%Y-%m') != "2020-03" ;



SELECT	ba.Customer_id, ba.Account_Number,  account_type, 
Case when Transaction_Amount < 0 then Balance_amount+transaction_amount 
else balance_amount
end  as deducted_balance_amount
FROM Bank_Account_Details ba
LEFT JOIN bank_account_transaction bat 
ON ba.account_number = bat.account_number 
WHERE Relationship_type = "P";
######################################
use hr;
select employee_id,
first_name from employees;

select e.employee_id 
,e.first_name employee_name,
m.employee_id manager_id,
m.first_name manager_name
from employees e join employees m
on e.manager_id=m.employee_id;

select * from employees
where manager_id=103;

select e.employee_id ,e.first_name,
e.manager_id,
(select first_name from employees
 where employee_id=e.manager_id)
 manager_name
from employees e join employees d
on e.manager_id=d.manager_id
group by e.employee_id,e.first_name;



select distinct e1.employee_id,
e1.first_name e_name,e2.manager_id
manager_id,
e2.first_name manager_name
from employees e1 
join employees e2 on 
e1.manager_id=e2.employee_id;

select  a.employee_id, a.first_name,
b.employee_id,b.first_name 
from employees a 
join employees b
where a.employee_id=b.manager_id;

SELECT department_name,first_name,
last_name,region_name 
FROM departments d 
LEFT JOIN employees e 
ON d.manager_id=e.employee_id
JOIN Locations l 
ON d.location_id=l.location_id
JOIN Countries c 
ON l.country_id=c.country_id
JOIN Regions r 
ON c.region_id=r.region_id
WHERE lower(r.region_name)='americas';

select e.first_name,
 e.`department_id` 
 from employees e 
 join departments d 
 on d.manager_id= e.employee_id
 join  `locations` l 
 on d.location_id = l.location_id 
 where l.country_id = 'US';
###################################
/*10 min 
takehome*/
select d.department_id ,
m.employee_id manager_id ,
m.first_name manager_name,
c.country_id,r.region_name 
from employees as m , 
departments as d ,countries as c , 
regions as r where m.manager_id=d.manager_id 
and c.region_id=r.region_id 
and c.country_name="Americas" ;
-- 10 min 
-- Takehome
##################################
use th4;
show tables;
Select 	Sum(Case when Dayname(Transaction_date) ='FRIDAY' then abs(transaction_Amount) else 0  END) as 'Friday_transaction',
    Sum(Case when Dayname(Transaction_date) !='FRIDAY' then abs(transaction_Amount)  else 0	END) as  'Other_Day_transaction'
From bank_Account_Details ba
join bank_account_transaction bat
on ba.Account_number=bat.Account_Number
where ba.Account_type LIKE '%CREDIT%';

use inclass;
Select 	Sum(Case when Dayname(Transaction_date) ='FRIDAY' then abs(transaction_Amount) else 0  END) as 'Friday_transaction',
Sum(Case when Dayname(Transaction_date) !='FRIDAY' then abs(transaction_Amount)  else 0	END) as  'Other_Day_transaction'
From bank_Account_Details ba
join bank_account_transaction bat
on ba.Account_number=bat.Account_Number
where ba.Account_type LIKE '%CREDIT%';
##############################

select ba.Account_number,
Sum(If (bat.Transaction_date =bh.Holiday,abs(transaction_Amount), 0)) as 'Holiday_amt',
Sum(If (bat.Transaction_date =bh.Holiday,0,abs(transaction_Amount))) as 'Non_Holiday_amt'
from Bank_account_transaction bat
Left JOIN bank_Account_Details ba
on bat.Account_number=ba.Account_number
Left JOIN bank_holidays bh
ON bat.Transaction_Date=bh.Holiday
Where ba.Account_Type LIKE '%CREDIT%'
GROUP BY ba.Account_number;


SELECT 	ba.Account_Number ,
 ba.Account_type,
 bat.Transaction_Date, 
 "Happy Holiday" as message
FROM  	bank_Account_Details ba
JOIN bank_account_transaction bat
ON   ba.Account_Number = bat.Account_Number
JOIN Bank_holidays
On holiday =transaction_Date
where   month(holiday)=3;


Select br.account_number,br.Account_type,sum(transaction_Amount*interest_rate)
FROM bank_Account_Details ba
JOIN bank_account_relationship_details br
ON   ba.Account_Number = br.Linking_Account_Number
JOIN bank_interest_rate bir
ON   bir.account_type = br.Account_type
Join bank_account_transaction bat 
ON   br.Account_Number = bat.Account_Number
Where br.Account_type =   'RECURRING DEPOSITS'
group by  br.account_number, br.Account_type
having current_Date()
-min(transaction_Date) >30;


SELECT	ba.Account_Number as savings_account_number, ba.Account_type  as savings_account_type,
	br.Account_Number as Credit_cardt_account_number, br.Account_type as	CreditCard_account_type, count(bat.transaction_date)  as Count_credit_card_trsanctions
FROM bank_Account_Details ba
LEFT JOIN bank_account_relationship_details br
ON  ba.Account_Number = br.Linking_Account_Number
LEFT JOIN bank_account_transaction bat
ON br.Account_Number = bat.Account_Number
Where br.Account_type like '%Credit%'    
group by ba.Account_Number, ba.Account_type,br.Account_Number, br.Account_type  
having count(bat.transaction_date) > 1;

select ba.Account_number,
Sum(If (bat.Transaction_date =bh.Holiday,abs(transaction_Amount), 0)) as 'Holiday_amt',
Sum(If (bat.Transaction_date =bh.Holiday,0,abs(transaction_Amount))) as 'Non_Holiday_amt'
from Bank_account_transaction bat
Left JOIN bank_Account_Details ba
on bat.Account_number=ba.Account_number
Left JOIN bank_holidays bh
ON bat.Transaction_Date=bh.Holiday
Where ba.Account_Type LIKE '%CREDIT%'
GROUP BY ba.Account_number;
SELECT ba.Account_Number as savings_account_number, ba.Account_type as  savings_account_type,
	br.Account_Number as Credit_cardt_account_number, br.Account_type  as 	CreditCard_account_type, count(bat.transaction_date) as Count_credit_card_trsanctions
FROM bank_Account_Details ba
LEFT JOIN  bank_account_relationship_details br
ON  ba.Account_Number = br.Linking_Account_Number
LEFT JOIN  bank_account_transaction bat
ON  br.Account_Number = bat.Account_Number
WHERE  br.Account_type like '%Add-on Credit%'    
group by ba.Account_Number,ba.Account_type  ,br.Account_Number,br.Account_type  
having count(bat.transaction_date) >= 1;

select b1.account_number,b1.account_type 
from bank_account_relationship_details as b1,
 bank_account_transaction as b2 where b1.account_type
 like "%Credit%"  having count(b2.account_number)>=1 ;

Select  distinct customer_id, length(customer_id) 
from  bank_customer_export 
natural join   bank_customer;

Select  distinct bc.customer_id ,  	bce.customer_name
from  bank_customer_export bce 
natural join   bank_customer  bc
where bce.customer_id   = bc.customer_id;
####################################




