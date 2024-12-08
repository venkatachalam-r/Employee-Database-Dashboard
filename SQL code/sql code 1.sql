use employees_mod;


# Create a visualization that provides a breakdown between the male and female employees working in the company each year, starting from 1990. 
 
SELECT 
    YEAR(de.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no) AS employee_count
FROM 
    t_employees e
JOIN 
    t_dept_emp de ON de.emp_no = e.emp_no
WHERE 
    YEAR(de.from_date) >= 1990
GROUP BY 
    calendar_year, e.gender
ORDER BY 
    calendar_year ASC;
