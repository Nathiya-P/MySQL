select * from sample.tbl_employees;

/*Alias name*/
select first_name as "First Name", last_name as "Last Name" from sample.tbl_employees;

/*Unique department id*/
select distinct department_id from sample.tbl_employees;

/* sort by first name*/
select * from sample.tbl_employees order by first_name desc;

/*Calculate PF and also no need to give as in the alias name*/
select first_name, last_name, salary, (salary * 0.15)  PF from sample.tbl_employees;

/*Ascending order of salary*/
select employee_id,first_name, last_name, salary from sample.tbl_employees order by salary;

/*Total salary payable to employee*/
select sum(salary) "Total Salary" from sample.tbl_employees;

/*Minimum and maximum salary*/
select min(salary) as "Minimum salary", max(salary) as "Max Salary" from sample.tbl_employees;

/*Avg of salary and count of employees (can also use count(*))*/
select avg(salary) as "Average_salary", count(employee_id) as "No of Employees" from sample.tbl_employees;

/*No of employees working in the company*/
select count(*) from sample.tbl_employees;

desc sample.tbl_employees;

/*No of jobs available in the company*/
select count(distinct job_id) from sample.tbl_employees;

/*Employees first name in upper case*/
select upper(first_name) from sample.tbl_employees;

/*First three characters in the first name using substring and length-char_length*/
select substring(first_name,1,3) from sample.tbl_employees;

/*calculate a value*/
select (171*214+625) Result;

/*Names from the employee table*/
select concat(first_name,' ',last_name) Name from sample.tbl_employees;

/*Removing white spaces from both sides of first name*/
select trim(first_name) from sample.tbl_employees;

/*length of employee's name */
select character_length(concat(first_name,' ',last_name)) from sample.tbl_employees;

/*length of employee's name*/
select first_name,last_name,length(first_name)+length(last_name) as "Length of Names" from sample.tbl_employees;

/*Check for field with numbers*/
select * from sample.tbl_employees where first_name regexp '[0-9]';


/*First 10 records*/
select * from sample.tbl_employees limit 10;

/*salary to 2 decimal values*/
select first_name,last_name,round((salary/12),2) as "Monthly salary"  from sample.tbl_employees;
