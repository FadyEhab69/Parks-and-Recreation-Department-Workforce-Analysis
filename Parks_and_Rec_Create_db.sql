CREATE DATABASE `Parks_and_Recreation`;
USE `Parks_and_Recreation`;



CREATE TABLE employee_demographics (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE
);

CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);


INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1,'Leslie', 'Knope', 44, 'Female','1979-09-25'),
(3,'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
(4, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
(5, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
(6, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
(7, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
(8, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
(9, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
(10, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
(11, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
(12, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Leslie', 'Knope', 'Deputy Director of Parks and Recreation', 75000,1),
(2, 'Ron', 'Swanson', 'Director of Parks and Recreation', 70000,1),
(3, 'Tom', 'Haverford', 'Entrepreneur', 50000,1),
(4, 'April', 'Ludgate', 'Assistant to the Director of Parks and Recreation', 25000,1),
(5, 'Jerry', 'Gergich', 'Office Manager', 50000,1),
(6, 'Donna', 'Meagle', 'Office Manager', 60000,1),
(7, 'Ann', 'Perkins', 'Nurse', 55000,4),
(8, 'Chris', 'Traeger', 'City Manager', 90000,3),
(9, 'Ben', 'Wyatt', 'State Auditor', 70000,6),
(10, 'Andy', 'Dwyer', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Mark', 'Brendanawicz', 'City Planner', 57000, 3),
(12, 'Craig', 'Middlebrooks', 'Parks Director', 65000,1);



CREATE TABLE parks_departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name varchar(50) NOT NULL,
  PRIMARY KEY (department_id)
);

INSERT INTO parks_departments (department_name)
VALUES
('Parks and Recreation'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');

select 
occupation , avg(salary) as avg_salary
from 
employee_salary
group by occupation;

select 
occupation, avg(salary) as avg_salary
from
employee_salary
where occupation like '%manager%'
group by occupation 
having avg_salary > 50000
order by avg_salary asc;

select * from employee_demographics ;

select * from employee_demographics as dem 
join employee_salary as sal 
on dem.employee_id = sal.employee_id; 

select 
dem.employee_id 
employee_salary
from 
dem.employee_id  as dem 
join 
employee_salary as sal 
on 
dem.employee_id = sal.employee_salary
and sal.employee_salary > 50000 ;

select * from 
employee_salary as sal 
left join 
employee_demographics as dem on sal.employee_id = dem.employee_id ; 

select * from 
employee_salary as sal 
right join 
employee_demographics as dem on sal.employee_id = dem.employee_id ; 

SELECT employee_id, first_name, 'age' AS category
FROM employee_demographics
WHERE age > 50
union all
select employee_id, first_name, 'top salary' AS category
FROM employee_salary
WHERE salary > 10000

select 
first_name,
last_name,
age,
case 
when age <=30 then 'young'
when age between 31 and 50 then 'bit old'
when age > 50 then 'old'
end as age_bracket
from 
employee_demographics;

SELECT 
  first_name, 
  last_name, 
  salary,
  (SELECT AVG(salary) FROM employee_salary) AS avg_salary
FROM employee_salary
WHERE salary > (SELECT AVG(salary) FROM employee_salary);

SELECT 
  dept_id,
  first_name, 
  last_name, 
  salary
FROM employee_salary e
WHERE salary > (SELECT AVG(salary) FROM employee_salary
where dept_id = e.dept_id);




 