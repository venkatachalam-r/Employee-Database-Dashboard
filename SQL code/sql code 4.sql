# Use a subquery that cross-joins the employees table (with an alias e) with the dept_manager, departments, and employees tables (with aliases dm, d, and ee, respectively). 
# This subquery should be part of an outer query that retrieves data from the following five subquery columns: 
# department name (dept_name)
# gender (gender)
# employee number (emp_no)
# start date (from_date)
# and end date (to_date).



use employees_mod;
select 
subquerry.dept_name,
subquerry.gender,
subquerry.emp_no,
subquerry.from_date,
subquerry.to_date,
case when subquerry.to_date >= '2024-01-01' then 1 else 0 end as currently_active
from
(select 
d.dept_name,
ee.gender,
ee.emp_no,
dm.from_date,
dm.to_date
from t_employees ee
join
t_dept_manager dm on dm.emp_no = ee.emp_no
join
t_departments d on dm.dept_no = d.dept_no

)as subquerry
order by 
subquerry.emp_no desc;