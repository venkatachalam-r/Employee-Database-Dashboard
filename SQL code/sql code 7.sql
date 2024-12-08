# Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a certain salary range. 
# Let this range be defined by two values the user can insert when calling the procedure.

# Finally, visualize the obtained result-set in Tableau as a double bar chart. 

drop procedure if exists filetr_salary
delimiter $$
create procedure filter_salary (in p_min_salary float, in p_max_salary float)
begin
select e.gender,
d.dept_name,
avg(s.salary)as avg_salary
from
t_salaries s
join
t_employees e on s.emp_no = e.emp_no
join
t_dept_emp de on e.emp_no = de.emp_no
join
t_departments d on de.dept_no = d.dept_no
where s.salary between p_min_salary and p_max_salary
group by 
d.dept_no, e.gender;
end$$
delimiter ;

call filter_salary (50000,90000);

