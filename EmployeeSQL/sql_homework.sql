CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE employees (
    emp_no int   NOT NULL,
    emp_title_id VARCHAR   NOT NULL REFERENCES titles.title_id,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE dept_emp (
    emp_no int   NOT NULL REFERENCES employees.emp_no,
    dept_no VARCHAR   NOT NULL REFERENCES departments.dept_no,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no,dept_no
     ) 
);

CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL REFERENCES departments.dept_no,
	emp_no int   NOT NULL REFERENCES employees.emp_no,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        dept_no,emp_no
     )
);


CREATE TABLE salaries (
    emp_no int   NOT NULL REFERENCES employees.emp_no,
    salary int   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
     )
);




SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
	left join salaries s
	on e.emp_no = s.emp_no
;


SELECT
	last_name, first_name, hire_date 
FROM
	employees 
WHERE 
	hire_date >= '1986-01-01' 
	AND
	hire_date < '1987-01-01'
;

SELECT m.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
	left join dept_manager m
	on e.emp_no = m.emp_no
	left join departments d
	on m.dept_no = d.dept_no
WHERE m.dept_no IS NOT NULL	
;

SELECT de.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
	left join dept_emp de
	on e.emp_no = de.emp_no
	left join departments d 
	on de.dept_no = d.dept_no
;

SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE '%B_____'
;

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e 
	left join dept_emp de
	on e.emp_no = de.emp_no 
	left join departments d
	on de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
;

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e 
	left join dept_emp de
	on e.emp_no = de.emp_no 
	left join departments d
	on de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development' 
;
	
SELECT e.last_name, COUNT(e.last_name) AS "frequency"
FROM employees e
GROUP BY e.last_name
ORDER BY "frequency" desc
; 