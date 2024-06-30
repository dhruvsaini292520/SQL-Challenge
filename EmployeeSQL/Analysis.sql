--List the employee number, last name, first name, sex, and salary of each employee.

SELECT
    e.emp_no AS EmployeeNumber,
    e.last_name AS LastName,
    e.first_name AS FirstName,
    e.sex AS Sex,
    s.salary AS Salary
FROM
    Employees e
JOIN
    Salaries s ON e.emp_no = s.emp_no;



--List the first name, last name, 
--and hire date for the employees who were hired in 1986.

SELECT
    first_name AS FirstName,
    last_name AS LastName,
    hire_date AS HireDate
FROM
    Employees
WHERE
    hire_date >= '1986-01-01' 
	AND hire_date < '1987-01-01';


--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.

SELECT
    d.dept_no AS DepartmentNumber,
    d.dept_name AS DepartmentName,
    dm.emp_no AS EmployeeNumber,
    e.last_name AS LastName,
    e.first_name AS FirstName
FROM
    dept_manager dm
JOIN
    departments d ON dm.dept_no = d.dept_no
JOIN
    employees e ON dm.emp_no = e.emp_no;

--List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department name.

SELECT
    e.emp_no AS EmployeeNumber,
    e.last_name AS LastName,
    e.first_name AS FirstName,
    de.dept_no AS DepartmentNumber,
    d.dept_name AS DepartmentName
FROM
    Employees e
JOIN
    Dept_emp de ON e.emp_no = de.emp_no
JOIN
    Departments d ON de.dept_no = d.dept_no;


--List first name, last name, and sex of each employee whose first 
--name is Hercules and whose last name begins with the letter B.


SELECT  first_name AS FirstName,
		last_name AS LastName,
		sex AS Sex
FROM employees emp
WHERE emp.first_name = 'Hercules'
	AND emp.last_name LIKE 'B%';


--List each employee in the Sales department, 
--including their employee number, last name, and first name.
SELECT
    e.emp_no AS EmployeeNumber,
    e.last_name AS LastName,
    e.first_name AS FirstName
FROM
    Employees e
JOIN
    Dept_emp de ON e.emp_no = de.emp_no
JOIN
    Departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';


--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT
    e.emp_no AS EmployeeNumber,
    e.last_name AS LastName,
    e.first_name AS FirstName,
    d.dept_name AS DepartmentName
FROM
    Employees e
JOIN
    Dept_emp de ON e.emp_no = de.emp_no
JOIN
    Departments d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');



--List the frequency counts, in descending order, of all the 
--employee last names (that is, how many employees share each last name).

SELECT
    last_name AS LastName,
    COUNT(*) AS Frequency
FROM
    Employees
GROUP BY
    last_name
ORDER BY
    Frequency DESC;
