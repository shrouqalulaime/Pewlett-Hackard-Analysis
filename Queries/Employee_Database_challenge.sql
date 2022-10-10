--Deliverable 1: The Number of Retiring Employees by Title

SELECT e.emp_no, e.first_name, e.last_name,
		t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no=t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--Use DISTINCT ON to remove duplicates
--Exclude employees that have already left the company

SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name,
		t.title, dm.to_date
INTO unique_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no=t.emp_no
INNER JOIN dept_emp as dm
ON e.emp_no=dm.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (dm.to_date='9999-01-01')
ORDER BY e.emp_no, dm.to_date DESC;


--Retrieve the number of employees by their recent job title who about to retire
SELECT * FROM unique_titles;

SELECT title, COUNT(emp_no) as retiring_count
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY retiring_count DESC;

SELECT * FROM retiring_titles;


-- Deliverable 2: The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as dm
ON e.emp_no=dm.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no, dm.to_date;








