
/* Number of jobs available*/
select count(distinct(job_id)) 
from sample.tbl_employees;

/* Total salary*/
select sum(salary) 'Total Salary'
from sample.tbl_employees;

/* Minimum salary*/
select min(salary) 'Min Salary'
from sample.tbl_employees;

/*Max salary*/
select max(salary)
from sample.tbl_employees
where job_id='engineer';

/*Avg salary and no of employees in department id */
select avg(salary), count(*) 
from sample.tbl_employees
where department_id=19;

select round(max(salary),0), round(min(salary),0), round(sum(salary),0), round(avg(salary),0)
from sample.tbl_employees;

/*No of employees with same job*/
select job_id,count(*) 
from sample.tbl_employees
group by job_id;

/*Difference between max and min salary*/
select max(salary)-min(salary)
from sample.tbl_employees;

/* */
select manager_id, min(salary)
from sample.tbl_employees
group by manager_id
order by min(salary) desc;

/*Total salary for each department*/
select department_id, sum(salary)
from sample.tbl_employees
group by department_id;

/* average salary for each job*/
select job_id, round(avg(salary),0)
from sample.tbl_employees
where job_id <> 'engineer'
group by job_id;

/* job_id in the department 80*/
select job_id, sum(salary),max(salary), min(salary), round(avg(salary),0)
from sample.tbl_employees
where department_id='80'
group by job_id;

select job_id, max(salary)
from sample.tbl_employees
group by job_id
having max(salary) >= 4000;

select department_id, avg(salary), count(*)
from sample.tbl_employees
group by department_id
having count(*) > 10;

/* If aggregate function comes in condition, then having should be used.
if having is used, it should come after group by*/