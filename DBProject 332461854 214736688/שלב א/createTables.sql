CREATE TABLE Shift (
    StartTime      TIMESTAMP NOT NULL,
    EndTime        TIMESTAMP NOT NULL,
    SpecialShift   VARCHAR2(35),
CONSTRAINT pk_Shift PRIMARY KEY (StartTime),
CONSTRAINT check_time CHECK (StartTime < EndTime))
/


CREATE TABLE Department (
    DepartId       NUMBER(5) NOT NULL,
    DepartName     VARCHAR2(35) NOT NULL,
CONSTRAINT pk_Department PRIMARY KEY (DepartId))
/

CREATE TABLE Position (
    PosId          NUMBER(9) NOT NULL,
    DepartId       NUMBER(5) NOT NULL,
    Salary         DECIMAL(5, 2) NOT NULL,
    Role           VARCHAR2(30) NOT NULL,
CONSTRAINT pk_Position PRIMARY KEY (PosId,DepartId),
CONSTRAINT fk_Position FOREIGN KEY (DepartId)
    REFERENCES Department (DepartId)
    ON DELETE CASCADE)
/


CREATE TABLE Employee (
    Id             NUMBER(9) NOT NULL,
    City           VARCHAR2(35) NOT NULL,
    Address        VARCHAR2(35) NOT NULL,
    Phone          VARCHAR2(35) NOT NULL,
    Email          VARCHAR2(45) NOT NULL,
    FirstName      VARCHAR2(35) NOT NULL,
    LastName       VARCHAR2(35) NOT NULL,
    Gender         VARCHAR2(35) NOT NULL,
    JoinDate       DATE NOT NULL,
    PosId          NUMBER(9) NOT NULL,
    DepartId       NUMBER(5) NOT NULL,
CONSTRAINT pk_Employee PRIMARY KEY (Id),
CONSTRAINT fk_Employee FOREIGN KEY (PosId,DepartId)
    REFERENCES Position (PosId,DepartId)
    ON DELETE CASCADE)
/

CREATE TABLE Manager (
    Id             NUMBER(9) NOT NULL,
    AccessType     VARCHAR2(1) NOT NULL,
CONSTRAINT pk_Manager PRIMARY KEY (Id),
CONSTRAINT fk_Manager2 FOREIGN KEY (Id)
    REFERENCES Employee (Id))
/

CREATE TABLE Training (
    EntreyLevel    VARCHAR2(35) NOT NULL,
    TrainingId     NUMBER(9) NOT NULL,
    TrainingName   VARCHAR2(35) NOT NULL,
    TrainerId      NUMBER(9),
    Unique(TrainingName,TrainerId,TrainingId),
CONSTRAINT pk_Tranning PRIMARY KEY (TrainingId),
CONSTRAINT fk_Tranning FOREIGN KEY (TrainerId)
    REFERENCES Employee (Id))
/

CREATE TABLE LeaveRequest (
    StartDate      DATE NOT NULL,
    EndDate        DATE NOT NULL,
    LeaveType      VARCHAR2(35) NOT NULL,
    RequestId      NUMBER(5) NOT NULL,
    Status         VARCHAR2(35) NOT NULL,
    EmpId          NUMBER(9) NOT NULL,
CONSTRAINT pk_LeaveRequest PRIMARY KEY (RequestId),
CONSTRAINT fk_LeaveRequest FOREIGN KEY (EmpId)
    REFERENCES Employee (Id),
CONSTRAINT check_dates CHECK (StartDate < EndDate)) 
/

CREATE TABLE EmployeeShift (
    EmpId          NUMBER(9) NOT NULL,
    StartTime      TIMESTAMP NOT NULL,
CONSTRAINT pk_EmployeeShift PRIMARY KEY (EmpId,StartTime),
CONSTRAINT fk_EmployeeShift FOREIGN KEY (EmpId)
    REFERENCES Employee (Id)
    ON DELETE CASCADE,
CONSTRAINT fk_EmployeeShift2 FOREIGN KEY (StartTime)
    REFERENCES Shift (StartTime))
/

CREATE TABLE EmployeeTraining (
    TrainedId      NUMBER(9) NOT NULL,
    TrainingId     NUMBER(5) NOT NULL,
CONSTRAINT pk_EmployeeTranning PRIMARY KEY (TrainedId,TrainingId),
CONSTRAINT fk_EmployeeTranning FOREIGN KEY (TrainedId)
    REFERENCES Employee (Id)
    ON DELETE CASCADE,
CONSTRAINT fk_EmployeeTranning2 FOREIGN KEY (TrainingId)
    REFERENCES Training (TrainingId))
/


GRANT ALL ON Shift TO public
/
GRANT ALL ON Department TO public
/
GRANT ALL ON Position TO public
/
GRANT ALL ON Employee TO public
/
GRANT ALL ON Manager TO public
/
GRANT ALL ON Training TO public
/
GRANT ALL ON LeaveRequest TO public
/
GRANT ALL ON EmployeeShift TO public
/
GRANT ALL ON EmployeeTraining TO public
/