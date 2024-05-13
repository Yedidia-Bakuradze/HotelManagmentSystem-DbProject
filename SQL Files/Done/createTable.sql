CREATE TABLE WorkShift (
    start_time     TIMESTAMP NOT NULL,
    end_time       TIMESTAMP NOT NULL,
CONSTRAINT pk_WorkShift PRIMARY KEY (start_time))
/

CREATE TABLE Person (
    F_Name         VARCHAR2(30) NOT NULL,
    L_Name         VARCHAR2(30) NOT NULL,
    City           VARCHAR2(30) NOT NULL,
    Address        VARCHAR2(30) NOT NULL,
    Id             NUMBER(9) NOT NULL,
    Email          VARCHAR2(34) NOT NULL,
    birthday       DATE NOT NULL,
CONSTRAINT pk_Person PRIMARY KEY (Id))
/

CREATE TABLE Deparment (
    departId       NUMBER(3) NOT NULL,
    departName     VARCHAR2(30) NOT NULL,
CONSTRAINT pk_Deparment PRIMARY KEY (departId))
/

CREATE TABLE Profession (
    profId         NUMBER(3) NOT NULL,
    departId       NUMBER(3) NOT NULL,
    profTitle      VARCHAR2(30) NOT NULL,
CONSTRAINT pk_Profession PRIMARY KEY (profId,departId),
CONSTRAINT fk_Profession FOREIGN KEY (departId)
    REFERENCES Deparment (departId)
    ON DELETE CASCADE)
/

CREATE TABLE Employee (
    Id             NUMBER(9) NOT NULL,
    joinDate       DATE NOT NULL,
    salaryPerHour  NUMBER(3,2) NOT NULL,
    empRole        VARCHAR2 NOT NULL,
    profId         NUMBER(3) NOT NULL,
    departId       NUMBER(3) NOT NULL,
CONSTRAINT pk_Employee PRIMARY KEY (Id),
CONSTRAINT fk_Employee2 FOREIGN KEY (Id)
    REFERENCES Person (Id),
CONSTRAINT fk_Employee FOREIGN KEY (profId,departId)
    REFERENCES Profession (profId,departId)
    ON DELETE CASCADE)
/

CREATE TABLE Set_On_Shift (
    Id             NUMBER(9) NOT NULL,
    start_time     TIMESTAMP NOT NULL,
CONSTRAINT pk_Set_On_Shift PRIMARY KEY (Id,start_time),
CONSTRAINT fk_Set_On_Shift FOREIGN KEY (Id)
    REFERENCES Employee (Id)
    ON DELETE CASCADE,
CONSTRAINT fk_Set_On_Shift2 FOREIGN KEY (start_time)
    REFERENCES WorkShift (start_time))
/

CREATE TABLE Recruter (
    Id             NUMBER(9) NOT NULL,
CONSTRAINT pk_Recruter PRIMARY KEY (Id),
CONSTRAINT fk_Recruter FOREIGN KEY (Id)
    REFERENCES Employee (Id))
/

CREATE TABLE Manager (
    Id             NUMBER(9) NOT NULL,
    managedDepartId NUMBER(3) NOT NULL,
CONSTRAINT pk_Manager PRIMARY KEY (Id),
CONSTRAINT fk_Manager2 FOREIGN KEY (Id)
    REFERENCES Employee (Id),
CONSTRAINT fk_Manager FOREIGN KEY (managedDepartId)
    REFERENCES Deparment (departId))
/

CREATE TABLE FutureEmployee (
    fEmpId         NUMBER(9) NOT NULL,
    recId          NUMBER(9) NOT NULL,
    dateOfPositionPlacement DATE NOT NULL,
CONSTRAINT pk_FutureEmployee PRIMARY KEY (fEmpId),
CONSTRAINT fk_FutureEmployee2 FOREIGN KEY (fEmpId)
    REFERENCES Person (Id),
CONSTRAINT fk_FutureEmployee FOREIGN KEY (recId)
    REFERENCES Recruter (Id)
    ON DELETE CASCADE)
/

CREATE TABLE Willing_To_Work_At (
    Id             NUMBER(9) NOT NULL,
    profId         NUMBER(3) NOT NULL,
    departId       NUMBER(3) NOT NULL,
CONSTRAINT pk_Willing_To_Work_At PRIMARY KEY (Id,profId,departId),
CONSTRAINT fk_Willing_To_Work_At FOREIGN KEY (Id)
    REFERENCES FutureEmployee (fEmpId)
    ON DELETE CASCADE,
CONSTRAINT fk_Willing_To_Work_At2 FOREIGN KEY (profId,departId)
    REFERENCES Profession (profId,departId))
/

GRANT ALL ON WorkShift TO public
/
GRANT ALL ON Person TO public
/
GRANT ALL ON Deparment TO public
/
GRANT ALL ON Profession TO public
/
GRANT ALL ON Employee TO public
/
GRANT ALL ON Set_On_Shift TO public
/
GRANT ALL ON Recruter TO public
/
GRANT ALL ON Manager TO public
/
GRANT ALL ON FutureEmployee TO public
/
GRANT ALL ON Willing_To_Work_At TO public
/

exit;

