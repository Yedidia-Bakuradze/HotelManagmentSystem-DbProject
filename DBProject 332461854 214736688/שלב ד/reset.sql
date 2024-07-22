
-- Delete values
delete Employee;
delete Department;

-- Drop tables
drop table Employee;
drop table Department;

-- rename back to original
rename Department_1 to Department;
rename Employee_1 to Employee;

-- rename back to original the constraints
alter table Department rename Constraint pk_Department_1 to pk_Department;

alter table Employee rename Constraint pk_Employee_1 to pk_Employee;