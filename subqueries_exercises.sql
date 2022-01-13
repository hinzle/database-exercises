-- 1
SELECT concat(e.first_name,' ',e.last_name) namessa
	FROM employees e	
	WHERE e.hire_date LIKE 
 		(
 		SELECT hire_date
 		FROM employees
		WHERE emp_no = 101010
		)
 	AND e.emp_no IN
 		(
 		SELECT emp_no
 		FROM dept_emp
 		WHERE to_date>NOW()
 		)
;

-- 2
SELECT *
	FROM titles t	
	WHERE emp_no IN
		(
		SELECT emp_no
		FROM employees
		WHERE first_name='Aamod'
		)
		AND	 emp_no IN
		(
		SELECT emp_no
		FROM dept_emp
		WHERE to_date>NOW()
		)
;

-- 3
-- 85108
SELECT *
FROM employees 
WHERE emp_no IN
	(
	SELECT emp_no
	FROM dept_emp
	WHERE to_date <NOW()
	)	
;

-- 4
/* Isamu Legleitner
Karsten Sigstam
Leon DasSarma
Hilary Kambil */

SELECT concat(e.first_name,' ',e.last_name) namessa
FROM employees e
WHERE emp_no IN
	(
	SELECT emp_no
	FROM dept_manager
	WHERE to_date >NOW()
	)
	AND gender LIKE 'f'
	
;

-- 5
-- 154543
SELECT *
FROM salaries
WHERE salary>
	(
	SELECT AVG(salary)
	FROM salaries
	)
AND 
to_date >NOW()
;

-- 6
-- 
-- SELECT (count(max(salary)-stddev(salary)))/(count(salary))
-- FROM salaries
-- WHERE to_date >now()
-- ;

-- WHERE salary >
-- 	(
-- 	SELECT count(max(salary)-stddev(salary))
-- 	FROM salaries
-- 	)
-- AND 
-- to_date >NOW()
-- ;

-- (
-- SELECT count(salary)
-- FROM salaries
-- )
-- ;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name',
       d.dept_name AS 'Department Name',
       CONCAT(man.first_name, ' ', man.last_name) AS 'Manager Name'
  FROM employees AS man
    JOIN dept_manager as dm
      ON man.emp_no = dm.emp_no
    JOIN departments AS d
      ON dm.dept_no = d.dept_no
    JOIN dept_emp AS de
      ON d.dept_no = de.dept_no
    JOIN employees AS e
      ON de.emp_no = e.emp_no
  WHERE de.to_date LIKE '9%'
    AND dm.to_date LIKE '9%'
;