/*Not between*/
select first_name,last_name, salary 
from sample.tbl_employees 
where salary not between 10000 and 15000;

/*department_id is 30 or 100 and in ascending order*/
select first_name,last_name, department_id 
from sample.tbl_employees 
where department_id in (30,100) 
order by department_id asc;

select *from sample.tbl_employees;

/* two conditions in where clause*/
select first_name,last_name, salary 
from sample.tbl_employees 
where salary not between 10000 and 15000 and department_id in (19,110);

/* year portion*/
select first_name,last_name, hire_date
from sample.tbl_employees
where year(hire_date) like '1987%';

/* Name having 'b' and 'c'*/
select first_name
from sample.tbl_employees
where first_name like '%c%' and first_name like '%b%';

/* job_id should be student or engineer, salary  should not be 4500,10000,15000*/
select last_name,job_id, salary
from sample.tbl_employees
where job_id in ('student','engineer') and
salary not in (4500, 10000,15000);

/* last name matches 6 characters*/
select last_name
from sample.tbl_employees
where last_name like '______';

/* last name with 3rd character as e*/
select last_name
from sample.tbl_employees
where last_name like '__e%';

/*Jobs available*/
select distinct job_id
from sample.tbl_employees;

/* Display PF with some fields*/
select first_name,last_name, salary, (salary * 0.15) PF
from sample.tbl_employees;

/*Last name matches certain names */
select * 
from sample.tbl_employees
where last_name in ('BLAKE','Prakash','FORD');

