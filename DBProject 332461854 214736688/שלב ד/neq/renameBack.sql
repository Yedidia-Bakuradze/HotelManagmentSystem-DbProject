-- Rename the original tables to a different name
rename  Department_1 to Department ;
rename  Employee_1 to Employee ;

alter table Department rename Constraint pk_Department_1  to pk_Department ;
alter table Employee rename Constraint pk_Employee_1  to pk_Employee ;
ALTER INDEX PK_DEPARTMENT_1 RENAME TO PK_DEPARTMENT;
ALTER INDEX PK_EMPLOYEE_1 RENAME TO PK_EMPLOYEE;