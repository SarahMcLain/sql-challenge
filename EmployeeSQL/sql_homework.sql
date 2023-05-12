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