# Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range. 
# Let this range be defined by two values the user can insert when calling the procedure.

# Finally, visualize the obtained result-set in Tableau as a double bar chart. 


select
e.gender,
d.dept_name,
round (avg(s.salary)) as Avg_Salary,
case when de.from_date < '1998-01-01' then 'before' else 'on or after' end as Jan_1_1998
from 
employees e
join 
salaries s on e.emp_no = s.emp_no
and s.from_date >= '1990-01-01'
join
dept_emp de on e.emp_no = de.emp_no
join
departments d on de.dept_no = d.dept_no
group by 
d.dept_no, 
e.gender,
Jan_1_1998
order by
d.dept_no asc;