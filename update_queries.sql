use sample;
show tables;
desc sample.tbl_employees;

select *from sample.tbl_employees;
truncate table sample.tbl_employees;


alter table sample.tbl_employees
add email varchar(20) after last_name;

show  index from sample.tbl_employees;

drop table sample.tbl_dup1_countries;

desc sample.tbl_department;
show index from sample.tbl_department;

alter table sample.tbl_department
drop primary key;

drop table sample.tbl_department;
drop table sample.tbl_employees;
drop table sample.tbl_jobs;

create table if not exists sample.tbl_employees(
employee_id int not null primary key auto_increment,
first_name varchar(20) not null,
last_name varchar(20) not null,
email varchar(40) not null,
phone_no decimal(10,0) not null,
hire_date date not null,
job_id varchar(20) not null,
salary decimal(10,0) default 8000,
commission_pct decimal(3,2) default 0.00,
manager_id  int,
department_id int );

insert into sample.tbl_employees
values (1,'Dev','Prakash','devp',9791122142,'29-08-2017','student',80000,8.00,1,19),
(2,'Dev','Rani','devp',9791122142,'27-08-2017','engineer',80000,0.10,1,110),
(3,'Rani','Perumal','hello',9791122142,'28-08-2017','engineer',80000,0.10,1,110),
(4,'Madhu','Kavi','hru',9791122142,'22-08-2017','student',80000,8.00,1,19),
(5,'Lalith','Madhu','dear',9791122142,'23-08-2017','student',80000,8.00,1,19);

select *from sample.tbl_employees;

/*single column update*/
update sample.tbl_employees
set email='not available';

/*Multiple column update*/
update sample.tbl_employees
set email='not available',commission_pct=0.10;

/*multiple column update with where clause*/
update sample.tbl_employees
set email='not available',commission_pct=0.10
where department_id=110;

insert into sample.tbl_employees
values (6,'Dev','Prakash','devp',9791122142,'29-08-2017','student',80000,8.00,1,80),
(7,'Dev','Rani','devp',9791122142,'27-08-2017','engineer',80000,0.10,1,80),
(8,'Rani','Perumal','hello',9791122142,'28-08-2017','engineer',80000,0.11,1,80),
(9,'Madhu','Kavi','hru',9791122142,'22-08-2017','student',80000,0.15,1,80),
(10,'Lalith','Madhu','dear',9791122142,'23-08-2017','student',80000,8.00,1,80 );

/*column update with multiple where conditions*/
update sample.tbl_employees
set email='not available'
where department_id=80 and commission_pct<0.20;

select * from sample.tbl_employees;

create table if not exists sample.tbl_departments(
department_id int not null primary key,
department_name varchar(30) not null,
manager_id int not null,
location_id int not null);

insert into sample.tbl_departments
values(80,'sports',1,100),(19,'admin',1,200),(110,'accounting',1,300);
select * from sample.tbl_departments;

select department_id from sample.tbl_departments where department_name ='accounting';

update sample.tbl_employees
set email='available'
where email='not available';

/*compare table for field retrival and update a column value*/
update sample.tbl_employees
set email='not available'
where department_id=(
select department_id from sample.tbl_departments where department_name ='accounting');

select * from sample.tbl_employees;

update sample.tbl_employees
set salary=4999
where employee_id=10;

update sample.tbl_employees
set salary=8000 
where salary<5000 and employee_id=10;

/* update with multiple conditions in where clause*/
update sample.tbl_employees
set job_id='SH_CLERK'
where employee_id=8 and department_id=80 and not job_id like 'SH%';

/*Update salary based on multiple conditions(like switch case)*/
update sample.tbl_employees set salary=case department_id
										when 19 then salary + (salary* .25)
										when 110 then salary + (salary*.15)
										when 80 then salary + (salary *.10)
										else salary
							end
	where department_id in (19,110,80);


create table if not exists sample.tbl_jobs(
job_id varchar(40) not null primary key,
job_title varchar(40) not null,
min_salary int not null,
max_salary int not null);

insert into sample.tbl_jobs values
('PU_CLERK', 'clerk',8000, 15000);

insert into sample.tbl_employees
values (20,'Dev','Prakash','devp',9791122142,'29-08-2017','PU_CLERK',80000,8.00,1,80);


update sample.tbl_employees
set salary=10000
where job_id='PU_CLERK';

select *from sample.tbl_employees;

/*Update multiple table values in single query*/
update sample.tbl_jobs,sample.tbl_employees
set sample.tbl_jobs.min_salary=sample.tbl_jobs.min_salary+2000,
sample.tbl_jobs.max_salary=sample.tbl_jobs.max_salary+2000,
sample.tbl_employees.salary=sample.tbl_employees.salary +(sample.tbl_employees.salary*.20),
sample.tbl_employees.commission_pct=sample.tbl_employees.commission_pct +.10
where sample.tbl_jobs.job_id='PU_CLERK' and sample.tbl_employees.job_id='PU_CLERK';

select *from sample.tbl_jobs;