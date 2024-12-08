# How many female employees have signed their contracts before January 1, 1998 according to the data in the dept_emp table? Also, determine the relevant number for male employees.
# Assign the column names as provided in the following screenshot containing the output you should obtain if you correctly solve the given task:
# Assign 'before' to all employees who have started before the suggested date; otherwise assign 'on or after'.

SELECT 
    CASE 
        WHEN de.from_date < '1998-01-01' THEN 'before'
        ELSE 'on or after'
    END AS jan_1_1998,
     e.gender,
    COUNT(*) AS num_of_employees
FROM 
    t_employees e
JOIN 
    t_dept_emp de ON e.emp_no = de.emp_no
GROUP BY 
    e.gender,
    jan_1_1998
    ORDER BY 
    jan_1_1998 ASC;

