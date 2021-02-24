# Use bank_inventory, cricket_1 and cricket_2 tables from Online_Day1_InClass and Online_Day2_InClass to solve the queries.

# # Question 1:
# Q1.Write MySQL query to find highest priced product

select * from bank_inventory;
select * from bank_inventory order by estimated_sale_price desc limit 1;

# Question 2:

# Q2.Write MySQL query to find third lowest run scorer.

select * from c_1 order by runs limit 2,1;
select * from c_2 order by runs limit 2,1; 
--  limit 2,1;

# Question 3:
# Q3. Write MySQL query to find player_ID and Player_name which contains “D”.

select player_id, player_name from c_1 where player_name like '%d%';

# Question 4:

# Q4.Write MySQL query to extract Player_Name whose name is having second character as 'R'

select player_name from c_2 where player_name like '_r%';

# Question 5:

# Q5.Write MySQL query to extract Player_Name whose name whose popularity is grater than 10 or charisma is greater than 50
# from tables cricket_1 and cricket_2 using set operator

use bank;
select Player_Name from c_1 where popularity > 10
union
select player_name from c_2 where charisma > 50;

/* Prerequisites */
-- Use the bank_inventory table from Online_Day1_Inclass file to answer the below questions
# Question 6:
# 6) Display the Geo_locations in capital letters from the table Bank_Holiday.

alter table bank_inventory rename column geo_location to GEO_LOCATION;
select * from bank_inventory;

# Question 7:
# 7) Display the position of occurance of the string ‘City’ in the column  Geo_location from the table Bank_Inventory.

select * from bank_inventory;

# Question 8:
# 8) Display the column Quantity from the table Bank_Inventory by applying the below formatting: 
-- a) convert the data type from numeric to character

desc bank_inventory;
alter table bank_inventory modify column quantity char(20);
 
-- b) Pad the column with 0's  

set sql_safe_updates = 0;
update bank_inventory set quantity = 0;
select * from bank_inventory;

# To answer 9th question there are few prerquisites to be followed
# PRE - REQUISITE:

Insert into bank_Inventory values ( 'MaxGain', 6 , 220.39, 4690.67, 4890, 'Riverdale-village' );
Insert into bank_Inventory values ( 'SuperSave', 7 , 290.30, NULL, 3200.13,'Victoria-Town') ;
select * from bank_inventory;

# Question 9:
# 9) Display the column Geo_location by replacing the underscores with spaces (" ").

select GEO_LOCATION as 'geo location' from bank_inventory;
alter table bank_inventory change column GEO_LOCATION `geo location` varchar(30);
select * from bank_inventory;

-- Use the cricket2 table to answer the below questions

# Question 10:

# Q10. Display the columns Player_Name, charisma and Runs by combining into a single comma seperated output. (Name the column as : 'Details')

use bank;
select player_name,Charisma, runs, concat(player_name,',',charisma,',',runs) as Details from c_2;