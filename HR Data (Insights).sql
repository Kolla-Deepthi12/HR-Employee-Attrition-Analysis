CREATE DATABASE HR_Employee_Attritube;

CREATE TABLE Employee_data (
Age INT,
Department VARCHAR(20),
EducationField VARCHAR(20),
Gender VARCHAR(20),
JobSatisfaction INT,
Attrition VARCHAR(5),
MonthlyIncome INT,
YearsAtCompany INT
);

SELECT * FROM employee_data;
-- total no.of employee in the company
SELECT COUNT(*) AS TotalEmployee FROM employee_data; 

-- attrition rate if yes total is 5 out of 15 then attrition rate is 5 * 100 / 15
SELECT 
CONCAT(ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END ) * 100 / COUNT(*) ), 0), '%')
 AS AttritionRate
FROM employee_data;

-- ATTRIBUTION BY DEPARTMENT 

SELECT Department, COUNT(*) AS Employees,
  SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS LeftEmployees,
  ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS AttritionPercent
FROM employee_data
GROUP BY Department;

-- Attribution by JobSatisfaction
SELECT Department, AVG(JobSatisfaction) AS AvgJobSatisfaction
FROM employee_data
GROUP BY Department;

-- Attribution by Gender
SELECT Gender, COUNT(*) AS Total, 
  SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS LeftEmployees
FROM employee_data
GROUP BY Gender;





