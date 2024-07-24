-- Rename the original tables to a different name
rename Department to Department_1;
rename Employee to Employee_1;

alter table Department_1 rename Constraint pk_Department to pk_Department_1;
alter table Employee_1 rename Constraint pk_Employee to pk_Employee_1;
ALTER INDEX PK_DEPARTMENT RENAME TO PK_DEPARTMENT_1;
ALTER INDEX PK_EMPLOYEE RENAME TO PK_EMPLOYEE_1;