SELECT p.role, AVG(p.Salary) AS AvgSalary
FROM Employee e
JOIN Position p ON e.PosId = p.PosId
GROUP BY p.role
ORDER BY AvgSalary DESC
FETCH FIRST 10 ROWS ONLY;
