-- 
-- View for section 1: Maintenance Requests and Their Locations
CREATE VIEW Dept1_MaintenanceDetails AS
SELECT 
    mr.RequestID, 
    mr.Urgency, 
    l.AreaID, 
    l.Availability
FROM 
    MaintenanceRequest_ mr
JOIN 
    Location_ l ON mr.LocationID = l.LocationID;

-- View for section 2: Employees and Their Positions
CREATE VIEW Dept2_EmployeePositionDetails AS
SELECT 
    e.Id AS EmployeeID, 
    e.FirstName || ' ' || e.LastName AS EmployeeName, 
    p.Role AS PositionRole, 
    p.Salary
FROM 
    Employee e
JOIN 
    position p ON e.PosId = p.PosId AND e.DepartId = p.DepartId;

