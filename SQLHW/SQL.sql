--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT 
e.emp_no, e.last_name, e.first_name , e.sex, s.salary 
FROM employee as e 
inner join salaries as s
ON e.emp_no = s.emp_no



--List first name, last name, and hire date for employees who were hired in 1986.

SELECT 
 e.first_name , e.last_name , e.hire_date
FROM employee as e 
WHERE hire_date 
BETWEEN '1986-01-01' AND '1986-12-31'



--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT 
dm.dept_no, dp.dept_name, dm.emp_no, e.last_name, e.first_name 
FROM employee as e 
inner join dept_manager as dm
ON e.emp_no = dm.emp_no
inner join departments as dp
on dm.dept_no = dp.dept_no





--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT 
e.emp_no, e.last_name, e.first_name , dm.dept_no
FROM employee as e 
inner join dept_manager as dm
ON e.emp_no = dm.emp_no




--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
 e.first_name , e.last_name , e.sex
FROM employee as e 
WHERE first_name = 'Hercules'
AND last_name::text LIKE 'B%'


--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
 
FROM employee as e 
inner join departments as d
ON e.emp_no = dm.emp_no

SELECT 
d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employee as e 
inner join dept_manager as dm
ON e.emp_no = dm.emp_no
inner join departments as d
on dm.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'



--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM employee as e 
inner join dept_manager as dm
ON e.emp_no = dm.emp_no
inner join departments as d
on dm.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
OR d.dept_name = 'Development'


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name ,
COUNT(e.last_name) as total_count
FROM employee as e
GROUP BY e.last_name
ORDER BY e.last_name -- To ensure the order is a, b, c, d

