# Compare the average salary of female versus male employees in the entire company until year 2002, and add a filter allowing you to see that per each department.

use employees_mod;

select
e.gender,
d.dept_name,
round(avg(s.salary)) as Avg_salary,
year ( s.from_date )  as calendar_date
from 
t_employees e
join
t_salaries s on e.emp_no = s.emp_no
join
t_dept_emp de on e.emp_no = de.emp_no
join
t_departments d on de.dept_no = d.dept_no
where
s.to_date <= '2002-01-01'
group by
d.dept_name, e.gender, calendar_date
order by
d.dept_name, e.gender, calendar_date;
