use hr;
show tables;
-- where/operators
select * from employees
where first_name='Steven';
-- Functions
select * from t1;
select * from t1
where binary(name)='Namrata';
-- functions
-- import/export(date format)
-- Functions
-- reusability
-- Built in Functions 
-- Single row 
-- 1 row=1 answer (107)
-- Numerical
-- round(p (must),s(optional))
select round(87.67) as a
from DUAL;-- psedocolumn
select round(87.67);
select * from dual;
/*Dummy
-----
X*/
-- MySQL
select 
round(87.67,0),
round(87.67,1),
round(87.672,2),
round(33.67,-2),
round(633.67,-3);
select * from employees;
-- salary,incentives,tax,
-- petrol,diesel,sharemarket
-- factory
-- 1 box=12 chocolate
-- 1 box =15 chocolate  
-- 2 box
select round(67.23,1),
floor(67.23),ceil(67.23),
truncate(67.67,1);
-- String
select 
length('namrat a'),
char_length('Na**mrat   a');
select instr('Namrata','a');
select substr('Namrata',2);
select first_name,
length(first_name),
instr(first_name,'a'),
substr(first_name,1,3)
from employees;
-- Name(1 M ,fe ,ma)
-- Mr.abc xyz
-- Ms.sgsg dgdg
-- Mrs.dgdg gdgd
select 
('Ms.Namrata Thukral');
select substr('MS.xyv',1,2) ;
select 
substr('Mr. Namrata Thukral',
 1,3);
 
select ('Namrata Thukral');
select 
substr('RACHITAsgs
 dgdgdgdgdg',1,8)
, substr('Namrata#Thukral',9);
select substr('Namrata#thukral',1,
instr('Namrata#thukral','#')-1) fn,
substr('Namrata#thukral',
instr('Namrata#thukral','#')
+1) ln;
select instr('Namrata','a');
select instr('Namrata','a')
+instr(substr('Namrata',
instr('Namrata','a')+1),'a');
###############################
-- replace
select 
replace('BlaBlckBl','Bl','J');
select ('Namrata'),
trim('Namrata'),
trim('Namrata'),
trim('Namrata');

select 
trim('N' from 'NamNrataN');
-- Leading / Trailing
select 
upper('namrata'),
lower('NAMRATA'),
left('Namrata',2),
right('Namrata',2);
select 
left('Namrata thukral',
instr('Namrata thukral',' '));
select 
left('Namrata Thukral',instr('Namrata Thukral',' ')),
right('Namrata Thukral',
instr('Namrata Thukral',' '));
-- lower / upper
select * from employees
where trim(upper(first_name))
='NAMRATA';-- loop 
-- namrata=Namrata'
-- InitCap('namrata') Oracle
-- namrata
select 
concat(upper(substr('tejas',1,1)), 
substr('tejas',2));
-- rpad/lpad
select lpad('Namrata'
,10,'P'),rpad('Namrata'
,10,'P');
######################
/*lower,upper,length,
instr,lpad,rpad,trim,substr,
left,right,replace,concat*/
-- Date 
select current_date() ,
current_time(),now(),
current_timestamp();
select '2020-11-05',
adddate('2020-11-05',3) ans1,
subdate('2020-11-05',3) ans2,
datediff('2020-11-05',
'2019-11-05') ans3,
last_day('2020-11-01'),
period_diff(202009,201909);
-- timezone
select employee_id,
hire_date from employees;
-- tenure of each employees;

-- character at a position
-- second occurence
select employee_id,
hire_date,
datediff(now(),hire_date)
/365 years,round(datediff(now(),hire_date)
/365) y2,round(datediff(now(),hire_date)/365,2) y3  from employees;

-- date_format()
select hire_date,
date_format(hire_date,'%D-%M-%Y %w'),
date_format(now(),'%w %W'),
dayname(now()) from 
employees;
select * from example1;
select datediff(now(),dob);
desc example1;
SELECT 
datediff(current_date(), hire_date)/365 AS 'how_long'
from employees;
###########################
-- Multiple row 
-- group of rows= 1 answer
-- sum()
##########################
Create table Bank_Holidays (
						 Holiday  date ,
						 Start_time datetime ,
						 End_time timestamp);
desc Bank_Holidays;
insert into Bank_Holidays values
(current_date(),now(),
current_timestamp());
select * from Bank_Holidays;

update Bank_Holidays 
set Holiday=
adddate(Holiday,1);

Update bank_holidays 
set holiday = DATE_ADD(Holiday , INTERVAL 1 DAY);

Update Bank_Holidays 
set Start_time=
current_timestamp();

Update Bank_Holidays 
Set End_time = 
utc_timestamp();

select current_timestamp(),
utc_timestamp();
-- User defined(Yes Programming)
/*Update the End_time with UTC 
time(GMT Time)
 in the Bank_Holidays table.*/
/*Update the End_time 
with current european 
time in the Bank_Holidays 
table. */
select now(), 
date_format(now(),'%h');

Update Bank_Holidays set 
End_time= date_format(current_timestamp(),
'%D %Y');

-- convert/cast implicit conversion
-- date_format('4th 2020') '9999-09-09'
desc employees;
/*table 
dob date 
insert into table
 ('12-10-2020') search */
/*Inclass 1/Inclass 2
Take home1/Take home1 sunday
Inclass 3 */
create table bhavini
(d1 date ,d2 varchar(20));
insert into bhavini values
('2020-09-09','2020-10-09');
-- Implicit converion
select current_date,d1,datediff(current_date,d1)
,d2,datediff(current_date,d2)from bhavini;
-- char '1',1 yes
select 1+'1';
select 'Namrata'+1;
select 
'Namrata'+'Namrata'+'9';
-- +,concat,||

/*-- convert/cast
-- timezone
-- null
Multiple Function
Conditional
Null functions
Group by 1.5*/
