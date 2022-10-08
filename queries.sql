-- View table data
SELECT * FROM employees limit 2;

-- Select employees that are born between 52 to 55 and hired between 85 and 88
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1952-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');