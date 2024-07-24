-- -- Remove the NotNull
-- Alter Table Employee_1 modify City      VARCHAR2(35) NULL;
-- Alter Table Employee_1 modify Address   VARCHAR2(35) NULL;
-- Alter Table Employee_1 modify Email     VARCHAR2(45) NULL;
-- Alter Table Employee_1 modify LastName  VARCHAR2(35) NULL;
-- Alter Table Employee_1 modify Gender    VARCHAR2(35) NULL;
-- Alter Table Employee_1 modify PosId     NUMBER(9) NULL;

-- Add new columns
-- Alter table Employee_1 Add Salary INTEGER null;
-- Alter table Employee_1 Add WorkingHours INTEGER null;


-- insert into Employee_1 (
-- 	id,
-- 	FirstName,
-- 	Phone,
-- 	JoinDate,
-- 	Employee_1.salary,
-- 	Employee_1.WorkingHours,
-- 	DepartId
-- )

-- select
-- employeeid,
-- name,
-- phonenumber,
-- startwork,
-- salary,
-- workinghours,
-- deptid

-- from Employee e
-- where e.employeeid not in 
-- (
--       select ee.id
--       from Employee_1 ee
--       where ee.id = e.employeeid
-- );
