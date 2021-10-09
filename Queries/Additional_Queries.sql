--- Additional query 

--- to know how many total active employee that still working
select * from employees e join 
dept_emp de on e.emp_no=de.emp_no
where de.to_date='9999-01-01'
--- 240,124



--- To save the last department number where the employee works and to know if the employee is still active
select distinct on (ut.emp_no) ut.emp_no,dept_no,to_date into TEMP employee_department
from unique_titles as ut 
left join dept_emp  as de  on ut.emp_no=de.emp_no 
order by emp_no,to_date desc 
--- 90398 rows

--- Inactive employee
select * from employee_department where to_date<>'9999-01-01'
--- 17940 rows


--- Active employee
select * from employee_department where to_date='9999-01-01'
--- 72458 rows

--- Active Employee that will be retiring (72458 employee) group by their department and titles 
select d.Dept_name,titles,count(*) 
into Active_retired_employee
from unique_titles ut
join employee_department ed  on ut.emp_no=ed.emp_no
join employees e on ut.emp_no=e.emp_no 
join departments as d on d.dept_no=ed.dept_no
where ed.to_date='9999-01-01'
group by d.Dept_name,titles 
order by d.Dept_name,titles ,count(*)

--- to make sure the data count is right and no duplication 
select sum(count) from Active_retired_employee
--72458 rows


--- Active Employee that will be retiring (72458 employee) group by their birth_date, department and titles
select extract (year from birth_date) as "year_retired", d.Dept_name,titles, count(*) 
into TEMP Active_retired_employee_byyear_temp
from unique_titles ut
join employee_department ed  on ut.emp_no=ed.emp_no
join employees e on ut.emp_no=e.emp_no 
join departments as d on d.dept_no=ed.dept_no
where ed.to_date='9999-01-01'
group by year_retired,d.Dept_name,titles 
order by year_retired, d.Dept_name,titles;


--- to make sure the data count is right and no duplication
select sum(count) from Active_retired_employee_byyear_temp
--72458 rows

---- Update year retired to know when will the employees will retire 

Update  Active_retired_employee_byyear_temp
set year_retired=1
where year_retired='1952';

-- 37 rows 

Update  Active_retired_employee_byyear_temp
set year_retired=2
where year_retired='1953';
-- 36 rows

Update  Active_retired_employee_byyear_temp
set year_retired=3
where year_retired='1954';
-- 36 rows

Update  Active_retired_employee_byyear_temp
set year_retired=4
where year_retired='1955';
-- 37 rows

-- to make the list is in the right order
select * 
into Active_retired_employee_byyear
from Active_retired_employee_byyear_temp  order by year_retired, dept_name,titles,count
--- 146 rows


-- mentorship eligibility group by department and titles
select dept_name,titles,count(*)
into mentorship_eligibility_dept_titles
from mentorship_eligibilty me 
join dept_emp de on me.emp_no=de.emp_no  
join departments d on de.dept_no=d.dept_no
where de.to_date='9999-01-01'
group by dept_name,titles
order by dept_name,titles
--- 35 rows

-- drop temporary table
drop table employee_department
drop table Active_retired_employee_byyear_temp