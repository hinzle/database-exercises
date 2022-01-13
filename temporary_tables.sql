-- 1
use innis_1652;

CREATE TEMPORARY TABLE employees_with_departments
	AS 
	SELECT de.emp_no, first_name, last_name, dept_no, dept_name
	FROM employees.employees
	JOIN employees.dept_emp de USING(emp_no)
	JOIN employees.departments d USING(dept_no)
LIMIT 100
;

SELECT Database();
SHOW TABLES;
DESCRIBE employees_with_departments;