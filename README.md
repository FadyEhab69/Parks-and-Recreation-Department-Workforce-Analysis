# Data Analysis Report: Parks and Recreation Department Workforce Analysis

#  Overview
As a data analyst, I performed a detailed analysis of the Parks_and_Recreation database to optimize workforce management and resource allocation within a fictional Parks and Recreation department. Utilizing SQL queries on the employee_demographics, employee_salary, and parks_departments tables, I addressed key business questions to uncover insights into employee performance, salary distribution, and departmental efficiency. This report highlights my analytical process, key findings, and recommendations 

# Data Analysis Process
# Dataset Description
Tables Analyzed:
employee_demographics: Contains employee_id, first_name, last_name, age, gender, and birth_date.
employee_salary: Includes employee_id, first_name, last_name, occupation, salary, and dept_id.
parks_departments: Features department_id and department_name.
Objective: Enhance workforce planning, salary optimization, and departmental alignment based on employee data.
# Analytical Questions and Insights
1/ Average Salary by Occupation:
Queried SELECT occupation, AVG(salary) AS avg_salary FROM employee_salary GROUP BY occupation to assess compensation trends.
Insight: City Manager roles averaged the highest salary ($90,000), while Shoe Shiner and Musician roles were the lowest ($20,000), indicating varied value assignments.
2/ Managerial Salary Analysis:
Analyzed with SELECT occupation, AVG(salary) AS avg_salary FROM employee_salary WHERE occupation LIKE '%manager%' GROUP BY occupation HAVING avg_salary > 50000 ORDER BY avg_salary ASC.
Insight: Office Managers averaged $55,000, suggesting equitable pay within this role despite different employees.
3/ Employee Age Distribution:
Explored with SELECT first_name, last_name, age, CASE WHEN age <= 30 THEN 'young' WHEN age BETWEEN 31 AND 50 THEN 'bit old' WHEN age > 50 THEN 'old' END AS age_bracket FROM employee_demographics.
Insight: Most employees fall in the "bit old" (31-50) bracket, with Jerry Gergich (61) as the only "old" employee, highlighting an aging workforce.
4/ Above-Average Salary Employees:
Identified with SELECT first_name, last_name, salary, (SELECT AVG(salary) FROM employee_salary) AS avg_salary FROM employee_salary WHERE salary > (SELECT AVG(salary) FROM employee_salary).
Insight: Employees like Leslie Knope ($75,000) and Chris Traeger ($90,000) exceed the average salary of $56,364, indicating high performers or critical roles.
5/ Departmental Salary Comparison:
Assessed with SELECT dept_id, first_name, last_name, salary FROM employee_salary e WHERE salary > (SELECT AVG(salary) FROM employee_salary WHERE dept_id = e.dept_id).
Insight: Leslie Knope ($75,000) and Ron Swanson ($70,000) in Dept 1 (Parks and Recreation) outperform their departmental average, suggesting leadership premium.
6/ Employee Matching Across Tables:
Joined tables with SELECT * FROM employee_demographics AS dem JOIN employee_salary AS sal ON dem.employee_id = sal.employee_id to verify data consistency.
Insight: Most employees align across tables, though Ron Swanson (employee_id 2) lacks demographic data, indicating a data gap.

# Data Management Process
Database Creation: Designed and populated Parks_and_Recreation database with employee_demographics, employee_salary, and parks_departments tables.
Data Insertion: Populated tables with 12 employee records, ensuring primary key integrity and departmental linkage.
Query Validation: Used LEFT and RIGHT joins to confirm complete employee coverage and identify missing data (e.g., Ron Swanson).
# Key Findings
Salary Disparity: Significant variation exists, with managerial roles commanding higher pay than support roles.
Age Demographics: The workforce skews toward 31-50 years, with potential retirement planning needed for older employees.
Departmental Performance: Parks and Recreation (Dept 1) has high earners, reflecting key leadership roles.
Data Integrity: Minor inconsistencies (e.g., missing demographic data for Ron Swanson) require attention.
# Recommendations
Salary Review: Standardize pay for similar roles (e.g., Office Managers) and consider raises for low-paid roles like Shoe Shiner and Musician.
Workforce Planning: Develop succession plans for older employees (e.g., Jerry Gergich) and recruit younger talent.
Departmental Focus: Invest in Parks and Recreation leadership training to sustain high performance.
Data Completion: Update demographic records for all employees to ensure comprehensive analysis.
# Analytical Skills Demonstrated
Database Design: Created and structured a relational database with appropriate tables and relationships.
SQL Proficiency: Executed complex queries using JOIN, GROUP BY, HAVING, CASE, and subqueries for deep insights.
Data Validation: Used joins and unions to ensure data accuracy and completeness.
Insight Generation: Derived actionable recommendations from salary and demographic trends.
Problem-Solving: Addressed data gaps and proposed solutions for workforce optimization.

# Conclusion
This analysis of the Parks_and_Recreation database demonstrates my ability to design, query, and interpret employee data using SQL, delivering insights that enhance workforce management. The process highlights my skills in database management, analytical querying, and strategic recommendation. Future work could include integrating performance metrics to further refine salary and staffing decisions.
