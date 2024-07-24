SELECT PositionRole, AVG(Salary) AS AverageSalary
FROM Dept2_EmployeePositionDetails
GROUP BY PositionRole;
