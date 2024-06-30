--Creating all the tables
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;

--Creating the titles table
CREATE TABLE titles (
title_id VARCHAR (5) NOT NULL PRIMARY KEY,
title VARCHAR (20)
)


--Creating the employees table
CREATE TABLE employees (
emp_no INT NOT NULL PRIMARY KEY,
emp_title_id VARCHAR (5) NOT NULL,
birth_date DATE,
first_name VARCHAR (30),
last_name VARCHAR (30),
sex VARCHAR (1),
hire_date DATE,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

--Creating the departments table
CREATE TABLE departments (
	dept_no VARCHAR (5) NOT NULL PRIMARY KEY,
	dept_name VARCHAR (20)
)


--Creating the department employee table
CREATE TABLE dept_emp (
emp_no INT NOT NULL,
dept_no VARCHAR (5) NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
)


--Creating the department managers table
CREATE TABLE dept_manager (
dept_no VARCHAR (5) NOT NULL,
emp_no INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
)

--Creating the salaries table
CREATE TABLE salaries (
emp_no INT NOT NULL,
salary INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)







