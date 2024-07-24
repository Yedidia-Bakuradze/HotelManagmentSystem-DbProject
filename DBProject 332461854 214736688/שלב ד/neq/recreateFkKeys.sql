-- Remove the old one
-- alter table task
-- drop CONSTRAINT fk_Task_Dept;

-- -- Create a new one for the updated table
-- ALTER TABLE task
-- ADD CONSTRAINT fk_Task_Dept
-- FOREIGN KEY (DEPTID)
-- REFERENCES DEPARTMENT_1(DepartId);


-- --Remove the old one
-- alter table EQUIPMENT
-- drop CONSTRAINT FK_EQUIPMENT_DEPT;

-- -- Create a new one for the updated table
-- ALTER TABLE EQUIPMENT
-- ADD CONSTRAINT FK_EQUIPMENT_DEPT
-- FOREIGN KEY (DEPTID)
-- REFERENCES DEPARTMENT_1(DepartId);

-- --Remove the old one
-- alter table MAINTENANCEREQUEST_
-- drop CONSTRAINT FK_MAINTENANCEREQUEST_DEPT;

-- -- Create a new one for the updated table
-- ALTER TABLE MAINTENANCEREQUEST_
-- ADD CONSTRAINT FK_MAINTENANCEREQUEST_DEPT
-- FOREIGN KEY (DEPTID)
-- REFERENCES DEPARTMENT_1(DepartId);

