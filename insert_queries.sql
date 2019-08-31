use sample;
show tables;
desc sample.tbl_countries;

/*Removing primary key from table*/
alter table sample.tbl_countries
drop primary key;

show index from sample.tbl_countries;
/*To remove primary key, find the index name using above command, remove using index_name here country_id) */
alter table sample.tbl_countries
drop index country_id;

/*Try removing primary key on the country_id (But converted to unique)*/
alter table sample.tbl_countries
change country_id country_id varchar(2);

/* to remove any key/index use the index command */

/*Remove not null from a column*/
alter table sample.tbl_countries
change region_id region_id decimal(10,0);

Insert into sample.tbl_countries values('A1','India',10);


Insert into sample.tbl_countries (country_id,country_name)
values('A2','Canada');

select * from sample.tbl_countries;

/*create duplicate table with structure and data*/
create table sample.tbl_countries_new as select * from sample.tbl_countries;

select * from sample.tbl_countries_new;

/*3 rows insertion*/
Insert into sample.tbl_countries  
values('A3','Africa',NULL),('A3','Africa',NULL),('A3','Africa',NULL);

/*Delete data from table*/
delete from sample.tbl_countries; /*need to disable safe mode*/
truncate table sample.tbl_countries;

/*Copy data from one table to another*/
insert into sample.tbl_countries 
select * from sample.tbl_countries_new;

desc sample.tbl_jobs;

/*To make a column to accept non duplicate- make it unique*/
insert into sample.tbl_jobs 
(job_id) values('1002');

truncate table sample.tbl_jobs ; /*failed due to foreign key constraint*/

delete from sample.tbl_jobs ; /*failed due to safe update mode*/
select *from sample.tbl_jobs;

/*Adding primary key combination to countries table*/
alter table sample.tbl_countries
change country_id country_id varchar(2) not null, 
change region_id region_id decimal(10,0) not null,
add primary key(country_id,region_id);

desc sample.tbl_countries;
truncate table sample.tbl_countries;
select *from sample.tbl_countries;

insert into sample.tbl_countries
values(1,'India',10);

/*adding unique and auto increment to the country_id*/
alter table sample.tbl_countries
change country_id country_id integer not null unique auto_increment;

insert into sample.tbl_countries (country_name,region_id)
values('Canada',10);

/*setting default values*/
alter table sample.tbl_countries
change country_name country_name varchar(35) default 'N/A';

desc sample.tbl_countries;

insert into sample.tbl_countries (region_id)
values(40);

select *From sample.tbl_countries;

/*foreign key constraint*/
desc sample.tbl_job_histry;

select *from sample.tbl_job_histry;

/*inserting date without single quote will enter 0000-00-00*/
insert into sample.tbl_job_histry
values (2, '2018-08-14','2019-08-28', 1002, 10); 

/*delete should not use (*) from */
delete from sample.tbl_job_histry where employee_id=1;

desc sample.tbl_employees;

desc sample.tbl_department;
select *from sample.tbl_department;
insert into sample.tbl_department
values(1,'Software products',19,100);

/*foreign key addition and using after*/
alter table sample.tbl_employees
add department_id decimal(4,0) not null after commission,
add manager_id decimal(6,0) not null,
add foreign key (department_id,manager_id) references sample.tbl_department(department_id,manager_id);


insert into sample.tbl_employees
values(1,'Nathiya','Perumal',1002,100000,9000,1,19);

/*foreign key constraints fails as the value 2,19 does not exists in department table*/
insert into sample.tbl_employees
values(2,'Nathiya','Perumal',1002,100000,9000,2,19);

select * from sample.tbl_employees;

desc sample.tbl_employees;

s







