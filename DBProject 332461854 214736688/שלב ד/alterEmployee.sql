-- Remove the NotNull
Alter Table Employee_1 modify Id        NUMBER(9) NULL;
Alter Table Employee_1 modify City      VARCHAR2(35) NULL;
Alter Table Employee_1 modify Address   VARCHAR2(35) NULL;
Alter Table Employee_1 modify Phone     VARCHAR2(35) NULL;
Alter Table Employee_1 modify Email     VARCHAR2(45) NULL;
Alter Table Employee_1 modify FirstName VARCHAR2(35) NULL;
Alter Table Employee_1 modify LastName  VARCHAR2(35) NULL;
Alter Table Employee_1 modify Gender    VARCHAR2(35) NULL;
Alter Table Employee_1 modify JoinDate  DATE NULL;
Alter Table Employee_1 modify PosId     NUMBER(9) NULL;
Alter Table Employee_1 modify DepartId  NUMBER(5) NULL;


-- Insert new columns
ALTER TABLE Employee_1 ADD Salary Integer;
ALTER TABLE Employee_1 ADD StartWork Date;
ALTER TABLE Employee_1 ADD WorkingHours Integer;

