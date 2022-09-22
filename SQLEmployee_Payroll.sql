--UC1-Created database
create database Payroll_service

--UC2-Created Table of Employee_Payroll
--here id is set to auto incremented using identity(1,1) it will increase by 1 every time
create table employee_payroll(id int identity(1,1) primary key,name varchar(200), salary bigint,startdate date)

--UC3--insert

insert into employee_payroll values('Hemant',50000,'2022-10-04','M'),('Sonali',30000,'2022-10-05','F'),('Panu',30000,'2022-10-06','M')

--UC4 Ability to Retrive all the employee payroll data	 
select*from employee_payroll 

--UC5 retrive salary data for a particular employee  and joined date

select*from employee_payroll where  name='Hemant'
select*from employee_payroll where startdate between cast('2022-10-05' as date) and Getdate();

--UC6 Ability to add Gender column and reflect it in table

alter table employee_payroll add gender varchar(10)
update employee_payroll set Gender='M' where name='hemant'

--UC7 Ability to use database Functions
--Function Count
select Count(id) as TotalEmpoyee from employee_payroll

alter table employee_payroll add gender varchar(10)
update employee_payroll set salary=50000 where name='sonu'
--Function min
select min(salary) as TotalSum from employee_payroll
--Function max
select max(salary) as TotalSum from employee_payroll
--Function avg
select avg(salary) as TotalSum from employee_payroll
--Function sum
select name ,sum(salary) as totalavg from employee_payroll group by name
--Group by gender
select sum(salary) as totalsum from employee_payroll where gender='F' group by gender


--UC8 Ability to extend Employee Payroll data info like phone,address,department
alter table employee_payroll add 
phoneNumber bigint,
Address varchar(200) not null default 'Address Unavailable',
Department varchar(200) not null default 'General Department'

--UC9 Ability to extend table to Basic pay,Deduction,Taxable pay,Income tax,Net pay
alter table employee_payroll add BasicPay float,Deduction float,TaxablePay float,IncomeTax float,NetPay float

--UC10 Make Hemant as a part of Sales and Marketing Department

update employee_payroll set
phoneNumber=7798051897,
Address='Bhandara',
Department='Sales and Marketing',
BasicPay=20000,
Deduction=2000,
TaxablePay=1000,
IncomeTax=200,
NetPay=18000 where name='Hemant'


select name from employee_payroll order by name desc

