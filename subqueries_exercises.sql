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
SELECT (count(max(salary)-stddev(salary)))/(count(salary))
FROM salaries
WHERE to_date >now()
;

WHERE salary >
	(
	SELECT count(max(salary)-stddev(salary))
	FROM salaries
	)
AND 
to_date >NOW()
;

(
SELECT count(salary)
FROM salaries
)
;


