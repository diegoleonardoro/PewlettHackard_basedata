CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    birth_date DATE,
    first_name VARCHAR (30) NOT NULL,
    last_name VARCHAR (30) NOT NULL,
    gender VARCHAR (30) NOT NULL ,
    hire_date DATE
    );
	
select *
from titles;
	

CREATE TABLE titles (
	id SERIAL PRIMARY KEY,
    emp_no INT NOT NULL,
    title VARCHAR (30),
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) 
    );
	
	
CREATE TABLE salaries ( 
    emp_no INT NOT NULL,
    salary INT NOT NULL, 
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) 
    );
	
	
CREATE TABLE dept_emp ( 
    emp_no INT NOT NULL,
    dept_no VARCHAR (30) NOT NULL, 
    from_date DATE NOT NULL,
	to_date DATE NOT NULL, 
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
    );
	

CREATE TABLE dept_manager ( 
    dept_no VARCHAR (30) NOT NULL, 
    emp_no INT NOT NULL, 
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
    );


CREATE TABLE department ( 
    dept_no VARCHAR (30) NOT NULL, 
    dept_name VARCHAR (30) NOT NULL
    );
	


	
SELECT * FROM employees;
SELECT * FROM salaries;

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e 

LEFT JOIN salaries s
ON e.emp_no = s.emp_no




SELECT * FROM employees
WHERE hire_date between '1986-01-30' and '1986-12-30';





SELECT * FROM department;
SELECT * FROM dept_manager;
SELECT * FROM employees;  

SELECT d.dept_no, d.from_date, d.to_date, de.dept_name, e.last_name, e.first_name
FROM dept_manager d

LEFT JOIN department de 
ON d.dept_no  = de.dept_no

LEFT JOIN employees e 
ON e.emp_no  = d.emp_no; 




SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM department;

SELECT de.dept_no, e.last_name , e.first_name, d.dept_name
FROM dept_manager de

LEFT JOIN employees e
ON e.emp_no = de.emp_no

LEFT JOIN department d
ON d.dept_no = de.dept_no




SELECT * FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%'; 




SELECT e.first_name, e.last_name, e
FROM employees e

WHERE emp_no IN 
(
	SELECT emp_no
    FROM dept_manager
    WHERE dept_no IN
	(
		SELECT dept_no 
        FROM department 
        WHERE dept_name =  'Sales'
	)
)





	
	
	