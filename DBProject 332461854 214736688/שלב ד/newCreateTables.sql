create table DEPARTMENT
(
  deptid      INTEGER not null,
  deptname    VARCHAR2(50) not null,
  budget      INTEGER not null,
  maxcapacity INTEGER not null,
  currentsize INTEGER not null
);

create table EMPLOYEE
(
  employeeid   INTEGER not null,
  name         VARCHAR2(50) not null,
  phonenumber  VARCHAR2(20) not null,
  startwork    DATE not null,
  salary       INTEGER not null,
  workinghours INTEGER not null,
  deptid       INTEGER not null
);

create table EQUIPMENT
(
  equipmentid   INTEGER not null,
  equipmentname VARCHAR2(50) not null,
  place         VARCHAR2(50) not null,
  purchasedate  DATE not null,
  deptid        INTEGER not null
);

create table LOCATION_
(
  locationid   INTEGER not null,
  floorid      INTEGER not null,
  areaid       VARCHAR2(15) not null,
  availability VARCHAR2(10) not null
);

create table MAINTENANCEREQUEST_
(
  requestid  INTEGER not null,
  urgency    VARCHAR2(10) not null,
  deptid     INTEGER not null,
  locationid INTEGER not null
);

create table TASK
(
  requestid INTEGER not null,
  startdate DATE not null,
  enddate   DATE not null,
  status    VARCHAR2(20) not null,
  deptid    INTEGER not null
);