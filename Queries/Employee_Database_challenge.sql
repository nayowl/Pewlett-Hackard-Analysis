-- DELIVERABLE 1


---Create retirement titles
select e.emp_no,e.first_name,e.last_name,
t.titles,t.from_date,t.to_date
into retirement_titles
from employees e
left join titles t on e.emp_no=t.emp_no 
where (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp_no
--- 133776 rows

---Create unique titles 
select distinct on (emp_no) emp_no, first_name,last_name,titles
into unique_titles
from retirement_titles
order by emp_no,to_date desc
--- 90398 rows

--- Count retiring titles
select count(emp_no),titles
into retiring_titles
from unique_titles
group by titles
order by count(emp_no) desc
--- 7 rows



-- DELIVERABLE 2

--- Mentorship Eligibility
SELECT 
distinct on(e.emp_no) e.emp_no, e.first_name, e.last_name,e.birth_date,
de.from_date,de.to_date,
t.titles
INTO mentorship_eligibilty
FROM 
employees as e join dept_emp as de on e.emp_no=de.emp_no 
join titles as t on e.emp_no=t.emp_no
where de.to_date='9999-01-01'
and e.birth_date between '1965-01-01' and '1965-12-31' 
order by emp_no
--- 1549 rows




