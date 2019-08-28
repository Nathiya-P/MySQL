show databases;
use sample;
show tables;

drop table sample.tbl_dup_countries;
drop table sample.tbl_countries;
drop table tbljobs;

create table if not exists sample.tbl_countries (
country_id varchar(10),
country_name varchar(25) NOT NULL,
region_id decimal(10,0)); 

desc sample.tbl_countries;

insert into sample.tbl_countries values ('2','Pakistan',10);
select *from sample.tbl_countries;

/*to create the structure of a table dup_countries similar to countries */
create table if not exists sample.tbl_dup_countries like sample.tbl_countries;

desc sample.tbl_dup_countries;
select *from sample.tbl_dup_countries;

/*to create a duplicate copy of countries table including structure and data by name dup_countries */
create table if not exists sample.tbl_dup1_countries as select *from sample.tbl_countries;
desc sample.tbl_dup1_countries;
select *from sample.tbl_dup1_countries;
 

alter table sample.tbl_countries
change country_id country_id varchar(10) not null;
  
alter table sample.tbl_countries
change region_id region_id decimal(10,0) not null;
desc sample.tbl_countries;

/*check constraint */
create table if not exists sample.tbl_jobs (
job_id varchar(10), 
job_title varchar(25), 
min_salary decimal(6, 0),
max_salary decimal(6,0)
check (max_salary <= 25000) );

drop table sample.tbl_jobs;

alter table sample.tbl_jobs
change job_id job_id varchar(10) not null,
change job_title job_title varchar(25) not null;

/*Make sure no countries except Italy, China and India will be entered into countries*/

create table if not exists sample.tbl_countries (
country_id varchar(10),
country_name varchar(25)  
check(country_name in ('Italy','China','India')),
region_id decimal(10,0)); 

drop table sample.tbl_countries;

create table if not exists sample.tbl_job_histry ( 
employee_id decimal(10,0) not null, 
start_date date not null, 
end_date date not null check( end_date like '--/--/----' ),
job_id varchar(10) not null,
department_id decimal(4,0) not null);

desc sample.tbl_job_histry;

drop table sample.tbl_job_histry;

/*adding unique constraints*/
alter table sample.tbl_countries
add constraint unique(country_id);

desc sample.tbl_countries;

/* adding default constraints */
create table if not exists sample.tbl_jobs (
job_id varchar(10) not null unique, 
job_title varchar(25) not null default '', 
min_salary decimal(6,0) default 8000,
max_salary decimal(6,0) default null );

desc sample.tbl_jobs;

/*primary key*/
create table if not exists sample.tbl_countries (
country_id varchar(10) not null unique primary key,
country_name varchar(25) NOT NULL,
region_id decimal(10,0) not null); 
desc sample.tbl_countries;

drop table sample.tbl_countries;

/*autoincrement*/
create table if not exists sample.tbl_countries (
country_id int not null  auto_increment primary key,
country_name varchar(25) NOT NULL,
region_id decimal(10,0) not null); 
desc sample.tbl_countries;

/*Primary key combination*/
create table if not exists sample.tbl_countries (
country_id varchar(10) not null unique default '',
country_name varchar(25)  default null,
region_id decimal(10,0) not null,
primary key(country_id, region_id)
); 
desc sample.tbl_countries;

/*Foreign key should be put in bracket*/
create table if not exists sample.tbl_job_histry ( 
employee_id decimal(10,0) not null primary key, 
start_date date not null, 
end_date date not null,
job_id varchar(10) not null,
department_id decimal(4,0) not null,
foreign key (job_id) references sample.tbl_jobs(job_id));

desc sample.tbl_job_histry;
drop table sample.tbl_job_histry;

 
drop table sample.tbl_employees;
/* multiple foreign key references with on update cascade and on delete restrict */
create table if not exists sample.tbl_employees (
employee_id decimal(6,0) not null primary key, 
first_name varchar(50) not null, 
last_name varchar(50) not null, 
email varchar(50) not null, 
phone_number decimal(10,0) not null, 
hire_date date not null, 
job_id varchar(10) not null, 
salary decimal(7,0) not null, 
commission decimal(4,0) default null, 
manager_id decimal(6,0) not null default 0,
department_id decimal(4,0) not null default 0,
foreign key (department_id,manager_id) references sample.tbl_department(department_id,manager_id),
foreign key (job_id) references sample.tbl_jobs(job_id) on update cascade on delete restrict);

/* multiple foreign key references with on update restrict and on delete cascade */
create table if not exists sample.tbl_employees (
employee_id decimal(6,0) not null primary key, 
first_name varchar(50) not null, 
last_name varchar(50) not null, 
email varchar(50) not null, 
phone_number decimal(10,0) not null, 
hire_date date not null, 
job_id varchar(10) not null, 
salary decimal(7,0) not null, 
commission decimal(4,0) default null, 
manager_id decimal(6,0) not null default 0,
department_id decimal(4,0) not null default 0,
foreign key (department_id,manager_id) references sample.tbl_department(department_id,manager_id),
foreign key (job_id) references sample.tbl_jobs(job_id) on update restrict on delete cascade);


/*foreign key reference with on update set null and on delete set null */
create table if not exists sample.tbl_employees (
employee_id decimal(6,0) not null primary key, 
first_name varchar(50) not null, 
last_name varchar(50) not null, 
job_id varchar(10), 
salary decimal(7,0) not null, 
commission decimal(4,0) default null, 
foreign key (job_id) references sample.tbl_jobs(job_id) on update set null on delete set null);

/*foreign key reference with on update no action and on delete no action */
create table if not exists sample.tbl_employees (
employee_id decimal(6,0) not null primary key, 
first_name varchar(50) not null, 
last_name varchar(50) not null, 
job_id varchar(10), 
salary decimal(7,0) not null, 
commission decimal(4,0) default null, 
foreign key (job_id) references sample.tbl_jobs(job_id) on update no action on delete no action);

use sample;
show tables;
desc sample.tbl_department;
desc sample.tbl_employees;
show create table  sample.tbl_department;
show create table sample.tbl_employees;

create table if not exists sample.tbl_department (
department_id decimal(4,0) not null default 0,
department_name varchar(30) not null,
manager_id decimal(6,0) not null default 0,
location_id decimal(4,0) ,
primary key(department_id,manager_id));

desc sample.tbl_department;
drop table sample.tbl_department;

desc sample.tbl_jobs;
