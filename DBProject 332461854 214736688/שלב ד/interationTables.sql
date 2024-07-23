  prompt PL/SQL Developer Export Tables for user C##Yedidia
prompt Created by admin on יום חמישי 11 יולי 2024
set feedback off
set define off

prompt Creating DEPARTMENT...
create table DEPARTMENT
(
  deptid      INTEGER not null,
  deptname    VARCHAR2(50) not null,
  budget      INTEGER not null,
  maxcapacity INTEGER not null,
  currentsize INTEGER not null
)
;
alter table DEPARTMENT
  add constraint PK_DEPARTMENT primary key (DEPTID)
  using index 
;

prompt Creating EMPLOYEE...
create table EMPLOYEE
(
  employeeid   INTEGER not null,
  name         VARCHAR2(50) not null,
  phonenumber  VARCHAR2(20) not null,
  startwork    DATE not null,
  salary       INTEGER not null,
  workinghours INTEGER not null,
  deptid       INTEGER not null
)
;
alter table EMPLOYEE
  add constraint PK_EMPLOYEE primary key (EMPLOYEEID)
  using index 
;
alter table EMPLOYEE
  add constraint FK_EMPLOYEE_DEPT foreign key (DEPTID)
  references DEPARTMENT (DEPTID);
alter table EMPLOYEE
  add constraint PHONE_FORMAT
  check (
    REGEXP_LIKE(PhoneNumber, '^(\d{3}-\d{3}-\d{4})$'));

prompt Creating EQUIPMENT...
create table EQUIPMENT
(
  equipmentid   INTEGER not null,
  equipmentname VARCHAR2(50) not null,
  place         VARCHAR2(50) not null,
  purchasedate  DATE not null,
  deptid        INTEGER not null
)
;
alter table EQUIPMENT
  add constraint PK_EQUIPMENT primary key (EQUIPMENTID)
  using index 
;
alter table EQUIPMENT
  add constraint FK_EQUIPMENT_DEPT foreign key (DEPTID)
  references DEPARTMENT (DEPTID);

prompt Creating LOCATION_...
create table LOCATION_
(
  locationid   INTEGER not null,
  floorid      INTEGER not null,
  areaid       VARCHAR2(15) not null,
  availability VARCHAR2(10) not null
)
;
alter table LOCATION_
  add constraint PK_LOCATION primary key (LOCATIONID)
  using index 
;

prompt Creating MAINTENANCEREQUEST_...
create table MAINTENANCEREQUEST_
(
  requestid  INTEGER not null,
  urgency    VARCHAR2(10) not null,
  deptid     INTEGER not null,
  locationid INTEGER not null
)
 ;
alter table MAINTENANCEREQUEST_
  add constraint PK_MAINTENANCEREQUEST primary key (REQUESTID)
  using index 
  ;
alter table MAINTENANCEREQUEST_
  add constraint FK_MAINTENANCEREQUEST_DEPT foreign key (DEPTID)
  references DEPARTMENT (DEPTID);
alter table MAINTENANCEREQUEST_
  add constraint FK_MAINTENANCEREQUEST_LOCATION foreign key (LOCATIONID)
  references LOCATION_ (LOCATIONID);

prompt Creating TASK...
create table TASK
(
  requestid INTEGER not null,
  startdate DATE not null,
  enddate   DATE not null,
  status    VARCHAR2(20) not null,
  deptid    INTEGER not null
)
 ;
alter table TASK
  add constraint PK_TASK primary key (REQUESTID)
  using index 
;
alter table TASK
  add constraint FK_TASK_DEPT foreign key (DEPTID)
  references DEPARTMENT (DEPTID);
alter table TASK
  add constraint FK_TASK_MAINTENANCEREQUEST foreign key (REQUESTID)
  references MAINTENANCEREQUEST_ (REQUESTID);

prompt Disabling triggers for DEPARTMENT...
alter table DEPARTMENT disable all triggers;
prompt Disabling triggers for EMPLOYEE...
alter table EMPLOYEE disable all triggers;
prompt Disabling triggers for EQUIPMENT...
alter table EQUIPMENT disable all triggers;
prompt Disabling triggers for LOCATION_...
alter table LOCATION_ disable all triggers;
prompt Disabling triggers for MAINTENANCEREQUEST_...
alter table MAINTENANCEREQUEST_ disable all triggers;
prompt Disabling triggers for TASK...
alter table TASK disable all triggers;
prompt Disabling foreign key constraints for EMPLOYEE...
alter table EMPLOYEE disable constraint FK_EMPLOYEE_DEPT;
prompt Disabling foreign key constraints for EQUIPMENT...
alter table EQUIPMENT disable constraint FK_EQUIPMENT_DEPT;
prompt Disabling foreign key constraints for MAINTENANCEREQUEST_...
alter table MAINTENANCEREQUEST_ disable constraint FK_MAINTENANCEREQUEST_DEPT;
alter table MAINTENANCEREQUEST_ disable constraint FK_MAINTENANCEREQUEST_LOCATION;
prompt Disabling foreign key constraints for TASK...
alter table TASK disable constraint FK_TASK_DEPT;
alter table TASK disable constraint FK_TASK_MAINTENANCEREQUEST;
prompt Deleting TASK...
delete from TASK;
commit;
prompt Deleting MAINTENANCEREQUEST_...
delete from MAINTENANCEREQUEST_;
commit;
prompt Deleting LOCATION_...
delete from LOCATION_;
commit;
prompt Deleting EQUIPMENT...
delete from EQUIPMENT;
commit;
prompt Deleting EMPLOYEE...
delete from EMPLOYEE;
commit;
prompt Deleting DEPARTMENT...
delete from DEPARTMENT;
commit;
prompt Loading DEPARTMENT...-

