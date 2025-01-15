--Emp #, last name, first name, sex, salary

SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no = s.emp_no
;

--first name, last name, hire date for hires in 1986

SELECT
	first_name,
	last_name,
	hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
;

--3. department managers, dep. #, dep name, employee name, employee #, last name,  first name

SELECT
	dm.dept_no,
	d.dept_name,
	e.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS d ON dm.dept_no = d.dept_no
INNER JOIN employees AS e ON dm.emp_no = e.emp_no
;
	
--4. dep #, employee #, last name, first name, department name

SELECT
	de.dept_no,
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON de.emp_no = e.emp_no
INNER JOIN departments AS d ON de.dept_no = d.dept_no
;

--5. first name, last name, sex: first_name Hercules, last name starts with B

SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'
;

--6. Sales employees: emp #, last name, first name

SELECT
	de.emp_no,
	e.last_name,
	e.first_name
FROM dept_emp AS de
INNER JOIN departments AS d ON de.dept_no = d.dept_no
INNER JOIN employees AS e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales'
;

--7. Sales and Development: employee #, last naem, first name, department name

SELECT
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON de.emp_no = e.emp_no
INNER JOIN departments as d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
;

--8. frequency counts in descending order of all employee last names

SELECT
	last_name,
	COUNT(*) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC
;

