use hr;
-- Date datatypes
-- Create/alter/drop/truncate/rename
-- insert/update/delete
-- Date 'yyyy-mm-dd'
-- datetime 
-- '2020-11-03 09:39:30'
-- 'yyyy-mm-dd hh:mm:ss' 
-- timestamp+timezone
-- '20201103093930'timezone 
use bangaloreaug;
create table t5 
(d1 date,d2 datetime,d3 timestamp);
desc t5;
insert into t5 values
('2020-11-03',
'2020-11-03 03:30:30',
'2020-11-03');
select * from t5;
-- Date
-- Date and Time
select d2,date(d2),
time(d2) from t5;
############################
-- Constraints rules (SQL2)
drop table std;
create table std
(sid int primary key,-- not null+unique
sname varchar(30),
fees int,
age int 
check(age>18 and age<50)
not null,
email varchar(20)
default 'N/A');
desc std;
insert into std values
(133,'hjj',4547,30,default);
-- NAN/Null UNKNOWN
select * from std;
-- age 
-- sid +ve
-- auto increment
-- N/A / Null
-- 1000,1001,2029
create table std2
(sid int primary key 
auto_increment ,sal int);
desc std2;
desc std;
insert into std2 
(sal)values(3738);
select * from std2;
insert into std 
(age,sid,sname)values
(23,2,'shsh');
select * from std;
select * from std2;
alter table std2
auto_increment=100;
insert into std2 (sal)
values (74883);
insert into std2 (sal)
values (7474),(3536),(53535);
-- MySQL Specific
/*
Not Null
Check
default 
Unique
Primary key */
desc t1;
create table t6
(sid int unique not null);
insert into t6 values(4);
-- unique / pk u+null
select * from t1;
-- truncate/delete(DML)
-- unique,not null,
-- primary Key
-- truncate is faster
-- then delete
delete from t1 where
sno=-39;
select * from t1;
truncate t1 ;
-- drop/truncate autocommit
-- /delete DML
-- DML insert/delete/
-- update 
###########################
-- create/alter/drop/
-- truncate/rename
-- insert/auto increment/
-- constraint
##############################
-- transactional tables
-- data increasing 
-- sql developer
-- insert loop 
-- truncate/delete 
-- DBA 
-- document wiki pedia 
############################
-- 2 hrs - inclass 1 
-- set sql_safe_updates=0;
select * from t1;
desc t1;
insert into t1 values
(2,100,'english',2666,
'abc');
desc t1;
Alter table t1 
rename column rollno 
to aakash;
-- companies -- 
-- add new column
select * from t_1;
rename table t1 to t_1;
-- age int 
alter table t_1 
add age int;
desc t_1;
select * from t_1;
update t_1
set age=24 where aakash=1 ;
select * from t_1;
update t_1
set age=25 
where aakash=1;
delete from t_1 where aakash=2;
update t_1
set sal=null;
-- DDL
-- create/alter/drop/truncate/rename
-- insert/delete/update 
-- alter (modify,rename,drop)
-- DQL (SELECT)
set sql_safe_updates=0;
-- Print / select
-- tables (Physical)
use hr;
show tables;
-- bank schema ,inclass takehome
use hr;
show tables;
select * from employees;
select * from departments;
select * from locations;
select * from countries;
select * from regions;
select * from jobs;
select * from job_history;
use hr;
select * from employees;
-- * all data column+rows
desc employees;

select employee_id,
first_name,department_id,
salary from employees;
-- alias
select 
first_name emp_name,
first_name as emp_name,
first_name "emp$$name",
salary,salary+1000 net
from employees;
-- 25000
-- security/hide
desc employees; 
select 
concat(first_name,' ',last_name)
fullname
,salary from employees;
-- ||
SELECT CONCAT(first_name,', ',last_name) AS full_name
FROM employees;
select 
concat(first_name,
' your department is ',
department_id )output from employees;
select first_name 
from employees;-- 107
-- alias ,computed column,concat
select * from employees;
-- distinct  unique values
create table t1
(sno int ,sal int);
insert into t1 values
(1,8990),(2,8990),(3,8242),
(1,8990);
select * from t1;
select distinct * from t1;
select distinct sal from t1;
select distinct sno,sal 
from t1;
select distinct(sno) from t1;
select distinct * from t1;
-- joins duplicates
-- select alias,distinct
-- order by ,
-- limit 
-- where + operators
-- Inclass 
-- saurabh group by

