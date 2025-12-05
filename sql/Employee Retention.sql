use hr_analysis_project;

SELECT COUNT(*) AS total_employees
FROM hr_1;

SELECT COUNT(Attrition) AS employees_working
FROM hr_1
WHERE Attrition = 'no';

SELECT COUNT(Attrition) AS employees_Left
FROM hr_1
WHERE Attrition = 'yes';

SELECT 
    ROUND(
        (SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS retention_rate
FROM hr_1;

SELECT 
    ROUND(
        (SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100,
        2
    ) AS attrition_rate
FROM hr_1;

SELECT 
    ROUND(AVG(age), 2) AS average_age
FROM hr_1;

#DEPARTMENT WISE EMPLOYESS_WORKING
SELECT 
    department,
    COUNT(*) AS employees_working
FROM hr_1
WHERE attrition = 'No'
GROUP BY department
ORDER BY employees_working DESC;

#DEPARTMENT WISE EMPLOYESS_LEFT
SELECT 
    department,
    COUNT(*) AS employees_left
FROM hr_1
WHERE attrition = 'yes'
GROUP BY department
ORDER BY employees_left DESC;

# EDUCATION FUELD WISE TPTAL_EMPLOYEE
SELECT 
    EducationField,
    COUNT(*) AS total_employees
FROM hr_1
GROUP BY EducationField
ORDER BY total_employees DESC;

#JOBROLE WISE EMPLOYEE _LEFT
SELECT 
    JobRole,
    COUNT(*) AS employees_left
FROM hr_1
WHERE attrition = 'Yes'
GROUP BY JobRole
ORDER BY employees_left DESC;

#AVREGE MONTHLY INCOME DEPARMENT WISE
SELECT 
    h1.department,
    ROUND(AVG(h2.MonthlyIncome), 2) AS avg_monthly_income
FROM hr_1 h1
JOIN hr_2 h2 
    ON h1.EmployeeNumber = h2.EmployeeID
GROUP BY h1.department;

#TOTAL EMPLOYEE WISE MARITALSTATUS
SELECT 
    MaritalStatus,
    COUNT(*) AS total_employees
FROM hr_1
GROUP BY MaritalStatus
ORDER BY total_employees DESC;