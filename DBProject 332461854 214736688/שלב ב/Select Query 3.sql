SELECT Month, DepartName, NumEmployeesWithLeave
FROM (
  SELECT d.DepartName, EXTRACT(MONTH FROM l.StartDate) AS Month, COUNT(DISTINCT e.Id) AS NumEmployeesWithLeave
  FROM Department d
  JOIN Employee e ON d.DepartId = e.DepartId
  JOIN LeaveRequest l ON e.Id = l.EmpId AND l.Status = 'Approved'
  GROUP BY d.DepartName, EXTRACT(MONTH FROM l.StartDate)
)  subquery
WHERE (Month, NumEmployeesWithLeave) IN (
  SELECT Month, MAX(NumEmployeesWithLeave)
  FROM (
    SELECT d.DepartName, EXTRACT(MONTH FROM l.StartDate) AS Month, COUNT(DISTINCT e.Id) AS NumEmployeesWithLeave
    FROM Department d 
    JOIN Employee e ON d.DepartId = e.DepartId
    JOIN LeaveRequest l ON e.Id = l.EmpId AND l.Status = 'Approved'
    GROUP BY d.DepartName, EXTRACT(MONTH FROM l.StartDate)
  )  subquery2
  GROUP BY Month
)
ORDER BY Month;
