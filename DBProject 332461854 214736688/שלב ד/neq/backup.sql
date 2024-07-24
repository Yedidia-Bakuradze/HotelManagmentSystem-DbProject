prompt PL/SQL Developer Export Tables for user C##HR@XE
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
prompt Loading DEPARTMENT...
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (1, 'Engineering', 100000, 50, 30);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (2, 'Human Resources', 50000, 10, 7);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (3, 'Maintenance', 75000, 20, 15);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (4, 'Engineering', 100000, 50, 30);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (5, 'Painting', 60848, 67, 42);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (6, 'Carpentry', 40066, 21, 73);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (7, 'Plumbing', 19068, 66, 89);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (8, 'Plumbing', 97034, 26, 85);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (9, 'Plumbing', 37308, 81, 11);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (10, 'HVAC', 13105, 21, 29);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (11, 'Fire Safety', 73043, 14, 43);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (12, 'Landscaping', 63049, 97, 48);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (13, 'Fire Safety', 75925, 11, 73);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (14, 'Fire Safety', 69905, 17, 75);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (15, 'Plumbing', 26211, 42, 93);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (16, 'Plumbing', 53129, 50, 65);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (17, 'Roofing', 81216, 15, 34);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (18, 'Appliance Repair', 72981, 95, 71);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (19, 'Landscaping', 23011, 23, 23);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (20, 'Appliance Repair', 99289, 34, 63);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (21, 'Fire Safety', 43664, 56, 56);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (22, 'Carpentry', 15704, 15, 13);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (23, 'Painting', 66937, 64, 72);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (24, 'Plumbing', 73467, 100, 20);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (25, 'Roofing', 89983, 59, 85);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (26, 'Appliance Repair', 14832, 12, 92);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (27, 'Plumbing', 68476, 66, 84);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (28, 'Appliance Repair', 97390, 89, 60);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (29, 'Roofing', 33896, 15, 34);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (30, 'Roofing', 18122, 44, 14);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (31, 'Painting', 22663, 27, 84);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (32, 'Painting', 94916, 86, 56);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (33, 'Roofing', 8149, 56, 100);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (34, 'Security Systems', 83240, 28, 65);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (35, 'Painting', 31301, 59, 47);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (36, 'Carpentry', 89343, 10, 64);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (37, 'Electrical', 90177, 26, 70);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (38, 'HVAC', 86162, 59, 98);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (39, 'Fire Safety', 13727, 52, 41);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (40, 'Electrical', 74321, 96, 89);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (41, 'Landscaping', 81152, 89, 65);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (42, 'Landscaping', 37536, 80, 69);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (43, 'Landscaping', 83024, 92, 36);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (44, 'Security Systems', 70112, 17, 46);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (45, 'Carpentry', 9265, 23, 27);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (46, 'Electrical', 93707, 27, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (47, 'Appliance Repair', 44309, 87, 79);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (48, 'Painting', 25848, 31, 81);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (49, 'Fire Safety', 69988, 18, 89);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (50, 'Plumbing', 67139, 48, 74);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (51, 'Electrical', 46429, 77, 37);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (52, 'Plumbing', 14589, 48, 48);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (53, 'Carpentry', 22880, 27, 24);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (54, 'Carpentry', 71215, 88, 70);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (55, 'Electrical', 99216, 22, 27);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (56, 'HVAC', 51536, 33, 12);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (57, 'Fire Safety', 79328, 92, 27);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (58, 'Appliance Repair', 74375, 59, 83);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (59, 'Landscaping', 72720, 56, 38);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (60, 'HVAC', 80131, 47, 43);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (61, 'Landscaping', 54312, 29, 67);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (62, 'Roofing', 67928, 11, 55);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (63, 'Security Systems', 7129, 96, 18);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (64, 'Electrical', 8088, 63, 37);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (65, 'Carpentry', 54019, 17, 88);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (66, 'Appliance Repair', 10692, 70, 80);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (67, 'Security Systems', 32956, 94, 17);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (68, 'HVAC', 35396, 89, 75);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (69, 'Electrical', 91870, 36, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (70, 'Appliance Repair', 23658, 16, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (71, 'Appliance Repair', 51093, 62, 28);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (72, 'Roofing', 80629, 29, 36);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (73, 'Roofing', 75283, 58, 88);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (74, 'Roofing', 9964, 33, 46);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (75, 'Landscaping', 36858, 33, 28);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (76, 'Painting', 30509, 61, 47);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (77, 'Carpentry', 75546, 92, 83);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (78, 'Carpentry', 64955, 46, 75);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (79, 'Plumbing', 66374, 77, 16);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (80, 'Roofing', 13866, 20, 24);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (81, 'Appliance Repair', 37918, 75, 66);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (82, 'Fire Safety', 73562, 67, 59);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (83, 'Painting', 20957, 16, 38);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (84, 'Plumbing', 6426, 93, 70);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (85, 'Appliance Repair', 34545, 75, 78);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (86, 'Roofing', 37212, 54, 76);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (87, 'Carpentry', 17097, 98, 47);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (88, 'Carpentry', 96270, 76, 98);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (89, 'Carpentry', 33021, 60, 37);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (90, 'Carpentry', 76582, 14, 71);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (91, 'Plumbing', 37242, 82, 36);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (92, 'Carpentry', 27421, 74, 75);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (93, 'Plumbing', 28538, 11, 79);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (94, 'Landscaping', 17017, 35, 97);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (95, 'Appliance Repair', 17375, 13, 37);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (96, 'Carpentry', 7385, 52, 61);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (97, 'Painting', 58315, 80, 53);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (98, 'Painting', 50502, 45, 26);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (99, 'Security Systems', 99080, 65, 31);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (100, 'Appliance Repair', 80749, 42, 51);
commit;
prompt 100 records committed...
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (101, 'Carpentry', 50296, 94, 63);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (102, 'Roofing', 60357, 44, 15);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (103, 'Roofing', 28536, 74, 76);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (104, 'HVAC', 6564, 15, 23);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (105, 'Roofing', 17946, 63, 100);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (106, 'Fire Safety', 98380, 62, 86);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (107, 'Carpentry', 41549, 50, 33);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (108, 'Plumbing', 85160, 55, 53);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (109, 'HVAC', 55096, 69, 29);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (110, 'Landscaping', 34980, 51, 44);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (111, 'Roofing', 90472, 90, 55);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (112, 'Painting', 95078, 62, 91);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (113, 'Plumbing', 49479, 50, 80);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (114, 'Electrical', 96474, 77, 80);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (115, 'Landscaping', 53103, 21, 68);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (116, 'Appliance Repair', 99993, 25, 15);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (117, 'HVAC', 87890, 31, 23);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (118, 'HVAC', 98698, 98, 92);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (119, 'HVAC', 98697, 16, 81);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (120, 'HVAC', 84256, 100, 63);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (121, 'Fire Safety', 46683, 53, 10);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (122, 'Appliance Repair', 34093, 19, 27);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (123, 'Roofing', 49915, 84, 26);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (124, 'Appliance Repair', 55800, 12, 44);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (125, 'Plumbing', 44592, 37, 24);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (126, 'Painting', 83969, 41, 93);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (127, 'Electrical', 98782, 20, 75);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (128, 'Electrical', 57881, 43, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (129, 'Electrical', 89121, 97, 87);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (130, 'Roofing', 85952, 47, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (131, 'Carpentry', 28567, 59, 75);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (132, 'HVAC', 60030, 42, 30);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (133, 'Carpentry', 67966, 57, 98);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (134, 'Fire Safety', 66301, 59, 49);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (135, 'Plumbing', 6322, 61, 92);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (136, 'HVAC', 42813, 84, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (137, 'Fire Safety', 37723, 31, 46);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (138, 'Carpentry', 53618, 62, 15);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (139, 'Carpentry', 76266, 32, 25);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (140, 'HVAC', 99243, 69, 14);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (141, 'Carpentry', 71851, 58, 77);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (142, 'Security Systems', 52791, 42, 27);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (143, 'Fire Safety', 57751, 89, 95);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (144, 'Security Systems', 46655, 19, 62);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (145, 'Painting', 62504, 87, 94);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (146, 'HVAC', 14221, 23, 47);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (147, 'Appliance Repair', 49076, 26, 14);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (148, 'Appliance Repair', 86228, 11, 83);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (149, 'HVAC', 36941, 83, 11);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (150, 'Electrical', 99173, 56, 36);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (151, 'Security Systems', 75023, 75, 60);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (152, 'Electrical', 21348, 99, 12);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (153, 'HVAC', 29896, 28, 30);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (154, 'Carpentry', 24717, 82, 70);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (155, 'Carpentry', 83053, 52, 78);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (156, 'Appliance Repair', 60538, 81, 96);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (157, 'Fire Safety', 14857, 95, 97);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (158, 'Plumbing', 64595, 81, 26);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (159, 'Painting', 7588, 56, 64);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (160, 'Carpentry', 18493, 26, 85);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (161, 'Plumbing', 40200, 51, 70);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (162, 'Electrical', 77519, 40, 41);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (163, 'Plumbing', 78196, 53, 78);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (164, 'HVAC', 24757, 64, 56);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (165, 'Fire Safety', 72755, 93, 21);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (166, 'Fire Safety', 68344, 65, 34);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (167, 'Appliance Repair', 77529, 74, 46);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (168, 'Electrical', 34753, 34, 68);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (169, 'Electrical', 52084, 39, 70);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (170, 'Fire Safety', 56473, 89, 51);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (171, 'Landscaping', 92252, 20, 28);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (172, 'Security Systems', 64860, 17, 37);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (173, 'Appliance Repair', 61438, 30, 97);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (174, 'Roofing', 76465, 91, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (175, 'Carpentry', 37000, 13, 77);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (176, 'Landscaping', 48755, 43, 97);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (177, 'HVAC', 88605, 59, 53);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (178, 'Plumbing', 22620, 57, 65);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (179, 'Electrical', 47273, 14, 71);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (180, 'HVAC', 69905, 22, 29);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (181, 'Electrical', 92264, 44, 34);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (182, 'Landscaping', 11558, 96, 75);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (183, 'Landscaping', 99020, 81, 36);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (184, 'Fire Safety', 61577, 23, 15);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (185, 'Carpentry', 48727, 100, 25);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (186, 'HVAC', 19568, 53, 52);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (187, 'Carpentry', 62016, 10, 12);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (188, 'Security Systems', 24960, 33, 60);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (189, 'Fire Safety', 95720, 54, 53);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (190, 'Landscaping', 7730, 52, 23);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (191, 'Carpentry', 58679, 31, 51);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (192, 'Plumbing', 40747, 16, 97);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (193, 'Carpentry', 90171, 71, 30);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (194, 'Electrical', 61145, 48, 13);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (195, 'Plumbing', 59160, 93, 28);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (196, 'Fire Safety', 75953, 17, 100);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (197, 'Roofing', 97040, 36, 11);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (198, 'Security Systems', 75104, 33, 74);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (199, 'Landscaping', 34363, 68, 98);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (200, 'Landscaping', 25266, 11, 24);
commit;
prompt 200 records committed...
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (201, 'HVAC', 26710, 82, 51);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (202, 'Fire Safety', 12545, 89, 59);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (203, 'Appliance Repair', 39641, 63, 94);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (204, 'Security Systems', 13771, 32, 34);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (205, 'Electrical', 72766, 60, 83);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (206, 'Plumbing', 11278, 29, 86);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (207, 'Appliance Repair', 97835, 77, 45);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (208, 'Painting', 50456, 76, 60);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (209, 'Painting', 7191, 47, 73);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (210, 'Electrical', 19688, 66, 32);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (211, 'Appliance Repair', 85414, 51, 78);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (212, 'Roofing', 66330, 85, 21);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (213, 'Roofing', 37136, 70, 56);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (214, 'Plumbing', 57009, 38, 21);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (215, 'Security Systems', 18108, 56, 66);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (216, 'Fire Safety', 50341, 59, 55);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (217, 'HVAC', 11537, 11, 38);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (218, 'Fire Safety', 65212, 34, 47);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (219, 'Carpentry', 72966, 56, 18);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (220, 'Appliance Repair', 22597, 17, 21);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (221, 'Carpentry', 21102, 84, 11);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (222, 'HVAC', 47819, 28, 57);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (223, 'Carpentry', 12153, 36, 74);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (224, 'Roofing', 56847, 84, 54);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (225, 'HVAC', 23541, 10, 45);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (226, 'Painting', 96449, 10, 41);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (227, 'Landscaping', 44855, 57, 45);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (228, 'Fire Safety', 94785, 14, 24);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (229, 'Carpentry', 73383, 91, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (230, 'Fire Safety', 92648, 39, 48);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (231, 'Painting', 79077, 19, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (232, 'Carpentry', 56229, 22, 41);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (233, 'Plumbing', 19424, 86, 97);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (234, 'HVAC', 38870, 44, 16);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (235, 'Painting', 71085, 47, 96);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (236, 'HVAC', 9313, 99, 44);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (237, 'Carpentry', 48946, 84, 12);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (238, 'Security Systems', 49144, 29, 76);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (239, 'HVAC', 36626, 55, 53);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (240, 'Security Systems', 96512, 68, 23);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (241, 'Fire Safety', 71691, 37, 41);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (242, 'Fire Safety', 95386, 52, 99);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (243, 'Security Systems', 92082, 100, 86);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (244, 'Landscaping', 78378, 13, 20);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (245, 'HVAC', 89256, 98, 20);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (246, 'Landscaping', 37111, 35, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (247, 'Carpentry', 97239, 27, 59);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (248, 'Electrical', 34488, 36, 52);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (249, 'Electrical', 77436, 58, 51);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (250, 'Electrical', 87075, 73, 30);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (251, 'Fire Safety', 34164, 76, 31);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (252, 'HVAC', 98524, 25, 78);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (253, 'Landscaping', 21552, 63, 61);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (254, 'HVAC', 91764, 74, 44);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (255, 'Appliance Repair', 40144, 39, 51);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (256, 'Fire Safety', 83262, 82, 62);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (257, 'Painting', 6945, 15, 58);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (258, 'Painting', 22954, 87, 19);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (259, 'Painting', 45602, 92, 63);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (260, 'Security Systems', 51641, 39, 69);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (261, 'Carpentry', 85274, 20, 99);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (262, 'HVAC', 17559, 80, 60);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (263, 'Plumbing', 61849, 34, 78);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (264, 'Appliance Repair', 20836, 42, 37);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (265, 'Security Systems', 60311, 22, 89);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (266, 'Appliance Repair', 45038, 97, 56);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (267, 'Appliance Repair', 74085, 33, 41);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (268, 'Carpentry', 97598, 67, 64);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (269, 'Appliance Repair', 42993, 36, 96);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (270, 'Carpentry', 44339, 92, 38);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (271, 'Carpentry', 91866, 13, 44);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (272, 'Painting', 37726, 88, 93);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (273, 'Security Systems', 75415, 92, 36);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (274, 'Plumbing', 19001, 63, 22);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (275, 'Painting', 20459, 23, 11);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (276, 'Fire Safety', 17281, 72, 79);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (277, 'Painting', 72245, 91, 68);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (278, 'Roofing', 87275, 100, 38);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (279, 'Painting', 24060, 97, 73);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (280, 'Fire Safety', 75237, 88, 44);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (281, 'HVAC', 60505, 70, 57);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (282, 'Security Systems', 16341, 95, 91);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (283, 'Appliance Repair', 98882, 39, 47);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (284, 'Electrical', 39584, 26, 88);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (285, 'Electrical', 95364, 77, 44);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (286, 'Roofing', 98480, 99, 62);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (287, 'Appliance Repair', 43379, 74, 27);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (288, 'Security Systems', 77856, 89, 76);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (289, 'Plumbing', 68640, 29, 28);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (290, 'Appliance Repair', 83393, 15, 25);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (291, 'Landscaping', 97767, 22, 26);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (292, 'Security Systems', 34535, 34, 34);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (293, 'Painting', 6960, 16, 35);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (294, 'Painting', 56486, 70, 22);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (295, 'Painting', 18187, 88, 11);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (296, 'Fire Safety', 44723, 49, 78);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (297, 'Fire Safety', 14612, 36, 39);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (298, 'Security Systems', 34302, 88, 39);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (299, 'Appliance Repair', 38750, 54, 46);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (300, 'Security Systems', 40167, 32, 63);
commit;
prompt 300 records committed...
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (301, 'Plumbing', 58849, 76, 67);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (302, 'Fire Safety', 96014, 93, 82);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (303, 'Carpentry', 40859, 11, 87);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (304, 'Landscaping', 18383, 36, 96);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (305, 'Electrical', 36176, 72, 21);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (306, 'Electrical', 22093, 84, 67);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (307, 'Painting', 74272, 19, 79);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (308, 'Carpentry', 36384, 84, 28);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (309, 'Painting', 18620, 35, 64);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (310, 'Appliance Repair', 29364, 87, 37);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (311, 'Electrical', 44133, 79, 46);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (312, 'Fire Safety', 31222, 63, 86);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (313, 'Plumbing', 60573, 81, 35);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (314, 'Plumbing', 28983, 32, 72);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (315, 'Plumbing', 73156, 19, 21);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (316, 'Appliance Repair', 94489, 21, 77);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (317, 'HVAC', 60260, 12, 33);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (318, 'Fire Safety', 49722, 38, 81);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (319, 'Landscaping', 15566, 95, 52);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (320, 'Carpentry', 56740, 50, 54);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (321, 'Plumbing', 54923, 39, 41);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (322, 'Fire Safety', 53414, 60, 81);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (323, 'Painting', 67697, 40, 38);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (324, 'Plumbing', 70750, 10, 87);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (325, 'Roofing', 43186, 66, 93);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (326, 'Painting', 37611, 97, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (327, 'Appliance Repair', 75654, 94, 81);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (328, 'Electrical', 84579, 48, 45);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (329, 'HVAC', 59346, 34, 42);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (330, 'Security Systems', 35510, 51, 69);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (331, 'Plumbing', 51323, 14, 36);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (332, 'Painting', 25337, 52, 48);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (333, 'Landscaping', 77574, 46, 33);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (334, 'Landscaping', 13994, 41, 14);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (335, 'Fire Safety', 33946, 45, 94);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (336, 'Electrical', 85408, 62, 41);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (337, 'HVAC', 27075, 84, 70);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (338, 'Painting', 18367, 81, 63);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (339, 'Painting', 20893, 78, 86);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (340, 'Electrical', 99316, 34, 26);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (341, 'Painting', 34046, 96, 70);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (342, 'Landscaping', 61715, 34, 15);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (343, 'Plumbing', 16624, 62, 65);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (344, 'Security Systems', 29289, 33, 74);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (345, 'Fire Safety', 18641, 96, 58);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (346, 'Fire Safety', 31795, 84, 53);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (347, 'Landscaping', 89105, 35, 91);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (348, 'Painting', 93753, 59, 13);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (349, 'Fire Safety', 54263, 83, 52);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (350, 'Appliance Repair', 87116, 90, 38);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (351, 'Plumbing', 76406, 43, 56);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (352, 'Roofing', 9869, 45, 47);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (353, 'Appliance Repair', 30719, 60, 22);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (354, 'Carpentry', 93404, 69, 46);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (355, 'Fire Safety', 28420, 37, 25);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (356, 'Security Systems', 57433, 36, 65);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (357, 'Roofing', 85425, 43, 29);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (358, 'Security Systems', 47008, 80, 56);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (359, 'Plumbing', 13857, 32, 15);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (360, 'Security Systems', 87500, 45, 56);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (361, 'Painting', 86926, 98, 65);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (362, 'Security Systems', 41651, 53, 22);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (363, 'Landscaping', 43740, 38, 82);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (364, 'Plumbing', 11228, 88, 79);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (365, 'Plumbing', 8871, 87, 94);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (366, 'Fire Safety', 49818, 47, 77);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (367, 'Security Systems', 78885, 67, 58);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (368, 'Fire Safety', 14377, 24, 78);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (369, 'Security Systems', 61813, 55, 69);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (370, 'Security Systems', 30217, 80, 28);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (371, 'Roofing', 9450, 87, 47);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (372, 'Security Systems', 67299, 75, 16);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (373, 'Security Systems', 72919, 13, 46);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (374, 'Appliance Repair', 46923, 47, 10);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (375, 'Appliance Repair', 57688, 65, 49);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (376, 'Appliance Repair', 14164, 81, 47);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (377, 'Carpentry', 87204, 33, 57);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (378, 'Roofing', 22548, 11, 95);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (379, 'Landscaping', 39369, 86, 62);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (380, 'HVAC', 55543, 83, 54);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (381, 'Electrical', 11794, 35, 38);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (382, 'HVAC', 47330, 59, 24);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (383, 'Appliance Repair', 36968, 39, 85);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (384, 'Painting', 91448, 17, 94);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (385, 'HVAC', 15064, 95, 51);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (386, 'Fire Safety', 47658, 66, 33);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (387, 'Painting', 70097, 12, 58);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (388, 'Security Systems', 69084, 13, 32);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (389, 'Painting', 21610, 24, 15);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (390, 'Carpentry', 87671, 46, 65);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (391, 'Security Systems', 35506, 10, 95);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (392, 'HVAC', 89399, 95, 46);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (393, 'Electrical', 26637, 32, 57);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (394, 'HVAC', 9848, 95, 78);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (395, 'Security Systems', 26307, 40, 37);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (396, 'Carpentry', 68492, 86, 51);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (397, 'Electrical', 14921, 96, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (398, 'Plumbing', 39267, 20, 22);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (399, 'Painting', 82920, 74, 20);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (400, 'Electrical', 43594, 82, 99);
commit;
prompt 400 records committed...
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (401, 'Painting', 92591, 71, 43);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (402, 'Fire Safety', 94658, 93, 79);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (403, 'Roofing', 23268, 36, 25);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (404, 'Fire Safety', 18399, 92, 64);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (405, 'Plumbing', 65656, 50, 89);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (406, 'Landscaping', 82602, 29, 16);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (407, 'Appliance Repair', 9611, 19, 10);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (408, 'Painting', 68060, 61, 97);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (409, 'Landscaping', 97215, 76, 87);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (410, 'Electrical', 61800, 100, 11);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (411, 'Security Systems', 43009, 44, 80);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (412, 'Appliance Repair', 12685, 45, 100);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (413, 'Landscaping', 38709, 61, 69);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (414, 'Security Systems', 92498, 43, 89);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (415, 'Carpentry', 69872, 73, 100);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (416, 'Carpentry', 18960, 27, 82);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (417, 'HVAC', 95656, 91, 68);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (418, 'Carpentry', 41728, 14, 82);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (419, 'HVAC', 23800, 31, 56);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (420, 'Landscaping', 77343, 85, 95);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (421, 'Security Systems', 46002, 70, 43);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (422, 'HVAC', 77705, 74, 81);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (423, 'Fire Safety', 20944, 10, 16);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (424, 'Landscaping', 37207, 26, 45);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (425, 'Fire Safety', 26571, 30, 42);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (426, 'HVAC', 88806, 13, 35);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (427, 'Roofing', 12165, 40, 73);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (428, 'HVAC', 29131, 99, 53);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (429, 'Security Systems', 42010, 10, 97);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (430, 'HVAC', 36493, 73, 87);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (431, 'Carpentry', 88739, 33, 93);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (432, 'HVAC', 92006, 85, 95);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (433, 'Roofing', 11571, 20, 42);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (434, 'Security Systems', 89507, 34, 14);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (435, 'Roofing', 88262, 15, 99);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (436, 'Plumbing', 33517, 53, 51);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (437, 'Electrical', 63631, 52, 89);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (438, 'Landscaping', 68806, 99, 23);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (439, 'Landscaping', 52800, 96, 20);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (440, 'HVAC', 69164, 79, 87);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (441, 'Electrical', 96580, 67, 25);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (442, 'Fire Safety', 23994, 11, 18);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (443, 'Fire Safety', 32621, 67, 97);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (444, 'Appliance Repair', 68359, 62, 37);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (445, 'Appliance Repair', 86783, 28, 86);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (446, 'Carpentry', 57149, 76, 51);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (447, 'Painting', 70460, 82, 27);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (448, 'Fire Safety', 26781, 32, 87);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (449, 'Appliance Repair', 39222, 30, 84);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (450, 'Fire Safety', 98493, 15, 76);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (451, 'Landscaping', 42760, 11, 91);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (452, 'HVAC', 89351, 12, 89);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (453, 'Roofing', 32042, 58, 62);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (454, 'HVAC', 56264, 31, 100);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (455, 'Roofing', 24855, 76, 10);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (456, 'Painting', 83310, 29, 37);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (457, 'Security Systems', 67527, 38, 20);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (458, 'Appliance Repair', 12295, 59, 95);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (459, 'Electrical', 19360, 47, 41);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (460, 'Electrical', 61857, 23, 87);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (461, 'Plumbing', 91969, 97, 68);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (462, 'Landscaping', 85070, 99, 86);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (463, 'Plumbing', 40489, 55, 78);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (464, 'Carpentry', 24224, 87, 47);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (465, 'Roofing', 9612, 100, 72);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (466, 'Security Systems', 76965, 97, 52);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (467, 'Plumbing', 85543, 22, 24);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (468, 'HVAC', 93767, 62, 14);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (469, 'Landscaping', 24578, 49, 21);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (470, 'Roofing', 47185, 70, 26);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (471, 'Plumbing', 86533, 20, 80);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (472, 'Electrical', 58786, 70, 25);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (473, 'Painting', 33142, 64, 62);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (474, 'Carpentry', 53100, 33, 82);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (475, 'Roofing', 67233, 15, 13);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (476, 'Carpentry', 32279, 37, 84);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (477, 'Appliance Repair', 43539, 57, 73);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (478, 'Landscaping', 53809, 87, 25);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (479, 'Appliance Repair', 47107, 28, 42);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (480, 'Appliance Repair', 42214, 72, 99);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (481, 'Roofing', 68349, 19, 14);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (482, 'Fire Safety', 60066, 97, 41);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (483, 'Painting', 39290, 51, 79);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (484, 'Fire Safety', 57883, 100, 10);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (485, 'Security Systems', 12932, 51, 39);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (486, 'Fire Safety', 84764, 99, 94);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (487, 'Carpentry', 77847, 94, 94);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (488, 'Landscaping', 11855, 35, 13);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (489, 'Fire Safety', 18796, 83, 12);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (490, 'Roofing', 23628, 49, 29);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (491, 'Carpentry', 69993, 34, 60);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (492, 'Painting', 32768, 57, 27);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (493, 'Roofing', 84167, 11, 54);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (494, 'Carpentry', 47798, 31, 30);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (495, 'Electrical', 42639, 83, 69);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (496, 'Plumbing', 93562, 14, 21);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (497, 'Roofing', 90530, 99, 66);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (498, 'Electrical', 35403, 57, 62);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (499, 'HVAC', 92136, 15, 77);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (500, 'Electrical', 58090, 45, 45);
commit;
prompt 500 records committed...
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (501, 'Roofing', 20735, 86, 67);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (502, 'Painting', 83956, 63, 82);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (503, 'Security Systems', 14588, 75, 100);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (504, 'Carpentry', 33376, 50, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (505, 'Security Systems', 96375, 18, 16);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (506, 'Electrical', 66667, 34, 42);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (507, 'Electrical', 31731, 51, 28);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (508, 'Landscaping', 43016, 79, 73);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (509, 'Landscaping', 43967, 50, 40);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (510, 'Electrical', 38717, 52, 44);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (511, 'Security Systems', 12019, 44, 44);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (512, 'Electrical', 65869, 32, 36);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (513, 'HVAC', 88574, 87, 98);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (514, 'Carpentry', 60956, 16, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (515, 'Roofing', 15845, 31, 68);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (516, 'Appliance Repair', 53263, 46, 21);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (517, 'Fire Safety', 47996, 86, 72);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (518, 'Plumbing', 61198, 34, 52);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (519, 'Carpentry', 7383, 28, 97);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (520, 'Plumbing', 93404, 63, 67);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (521, 'Security Systems', 91143, 24, 88);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (522, 'Plumbing', 40180, 27, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (523, 'HVAC', 68468, 80, 16);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (524, 'Painting', 82967, 39, 94);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (525, 'HVAC', 71836, 71, 13);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (526, 'HVAC', 11604, 18, 65);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (527, 'Fire Safety', 11188, 35, 60);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (528, 'Plumbing', 21517, 79, 58);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (529, 'Plumbing', 6104, 39, 84);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (530, 'Appliance Repair', 79959, 36, 67);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (531, 'Landscaping', 75667, 78, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (532, 'Painting', 52762, 91, 46);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (533, 'Security Systems', 55127, 80, 88);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (534, 'Security Systems', 81102, 60, 56);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (535, 'Roofing', 44874, 54, 76);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (536, 'Landscaping', 98490, 72, 25);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (537, 'Electrical', 26651, 45, 46);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (538, 'Fire Safety', 22051, 25, 79);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (539, 'Landscaping', 91987, 84, 59);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (540, 'Painting', 86266, 71, 70);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (541, 'Landscaping', 25257, 79, 26);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (542, 'Painting', 77793, 100, 28);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (543, 'Roofing', 7942, 22, 92);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (544, 'HVAC', 86765, 34, 29);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (545, 'Security Systems', 85738, 42, 53);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (546, 'Roofing', 19159, 86, 91);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (547, 'Fire Safety', 99634, 26, 28);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (548, 'Security Systems', 95404, 29, 73);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (549, 'HVAC', 37776, 23, 88);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (550, 'Carpentry', 10990, 56, 62);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (551, 'Carpentry', 11474, 65, 78);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (552, 'HVAC', 93341, 33, 89);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (553, 'Security Systems', 44012, 35, 53);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (554, 'Roofing', 70289, 26, 17);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (555, 'Electrical', 34378, 50, 16);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (556, 'Security Systems', 78998, 67, 96);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (557, 'Landscaping', 55440, 86, 47);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (558, 'HVAC', 94526, 29, 27);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (559, 'Appliance Repair', 19802, 18, 60);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (560, 'Roofing', 37988, 90, 68);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (561, 'Security Systems', 83733, 82, 29);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (562, 'Carpentry', 70425, 34, 26);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (563, 'Painting', 68310, 34, 13);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (564, 'Fire Safety', 33229, 100, 28);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (565, 'Plumbing', 37351, 61, 56);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (566, 'Carpentry', 31427, 66, 32);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (567, 'Painting', 39512, 62, 44);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (568, 'Plumbing', 26832, 40, 70);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (569, 'HVAC', 60724, 32, 77);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (570, 'Roofing', 46401, 46, 88);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (571, 'Plumbing', 31493, 68, 53);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (572, 'Plumbing', 64143, 83, 28);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (573, 'Plumbing', 76399, 40, 77);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (574, 'Roofing', 18670, 83, 26);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (575, 'Landscaping', 94425, 94, 36);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (576, 'Electrical', 53611, 44, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (577, 'Roofing', 37664, 64, 12);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (578, 'Landscaping', 65919, 47, 79);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (579, 'Fire Safety', 24579, 84, 22);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (580, 'Electrical', 44210, 44, 29);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (581, 'Landscaping', 14366, 62, 71);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (582, 'Carpentry', 79621, 24, 41);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (583, 'Landscaping', 83942, 53, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (584, 'Security Systems', 43694, 29, 11);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (585, 'Electrical', 51116, 65, 71);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (586, 'HVAC', 67769, 53, 21);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (587, 'Painting', 6067, 35, 37);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (588, 'Fire Safety', 91986, 78, 42);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (589, 'Carpentry', 77425, 77, 67);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (590, 'Fire Safety', 54753, 24, 87);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (591, 'Plumbing', 84473, 26, 77);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (592, 'Fire Safety', 69731, 29, 12);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (593, 'Painting', 11366, 45, 65);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (594, 'Carpentry', 55655, 10, 45);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (595, 'Roofing', 48541, 30, 26);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (596, 'Security Systems', 56241, 17, 85);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (597, 'Fire Safety', 65520, 32, 75);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (598, 'Plumbing', 26864, 80, 19);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (599, 'Fire Safety', 68505, 79, 16);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (600, 'Carpentry', 42910, 46, 11);
commit;
prompt 600 records committed...
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (601, 'Fire Safety', 37234, 66, 22);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (602, 'Security Systems', 13641, 94, 39);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (603, 'Security Systems', 22196, 80, 60);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (604, 'Carpentry', 55076, 13, 82);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (605, 'Carpentry', 69939, 47, 79);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (606, 'Carpentry', 25394, 73, 21);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (607, 'Plumbing', 18946, 16, 91);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (608, 'Electrical', 83751, 86, 58);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (609, 'Roofing', 82769, 100, 20);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (610, 'Electrical', 9838, 97, 25);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (611, 'Carpentry', 63017, 45, 46);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (612, 'Plumbing', 41419, 41, 95);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (613, 'Roofing', 69824, 74, 31);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (614, 'Roofing', 7902, 63, 41);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (615, 'Landscaping', 86382, 91, 96);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (616, 'Plumbing', 7004, 11, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (617, 'Security Systems', 31274, 14, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (618, 'Security Systems', 87001, 64, 74);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (619, 'HVAC', 38179, 29, 86);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (620, 'Security Systems', 21980, 31, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (621, 'Painting', 44392, 31, 22);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (622, 'Appliance Repair', 48855, 18, 15);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (623, 'Carpentry', 47289, 71, 80);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (624, 'HVAC', 50510, 97, 57);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (625, 'Appliance Repair', 59116, 85, 15);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (626, 'Electrical', 13244, 100, 86);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (627, 'Security Systems', 43860, 96, 64);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (628, 'Plumbing', 58185, 94, 77);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (629, 'Electrical', 46599, 67, 54);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (630, 'Painting', 73557, 89, 74);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (631, 'Fire Safety', 31614, 87, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (632, 'Landscaping', 23407, 79, 73);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (633, 'Electrical', 82772, 73, 93);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (634, 'Carpentry', 33927, 64, 31);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (635, 'Fire Safety', 51515, 75, 61);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (636, 'Painting', 63041, 63, 30);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (637, 'Carpentry', 94797, 93, 37);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (638, 'Landscaping', 10074, 12, 29);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (639, 'Electrical', 66450, 88, 16);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (640, 'HVAC', 61986, 62, 98);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (641, 'Roofing', 56967, 88, 70);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (642, 'Plumbing', 64939, 13, 73);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (643, 'Carpentry', 38859, 18, 25);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (644, 'Security Systems', 62294, 94, 63);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (645, 'Carpentry', 35062, 71, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (646, 'Roofing', 22445, 33, 40);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (647, 'Painting', 61742, 80, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (648, 'Landscaping', 60929, 56, 27);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (649, 'Carpentry', 44296, 34, 89);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (650, 'HVAC', 86427, 56, 28);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (651, 'Carpentry', 21539, 44, 24);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (652, 'Roofing', 41550, 45, 29);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (653, 'Painting', 81671, 59, 62);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (654, 'Carpentry', 43065, 33, 10);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (655, 'Fire Safety', 36063, 45, 78);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (656, 'Security Systems', 10268, 73, 80);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (657, 'Roofing', 50544, 12, 61);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (658, 'Roofing', 79248, 52, 61);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (659, 'Fire Safety', 30993, 76, 24);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (660, 'HVAC', 53703, 92, 69);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (661, 'Roofing', 32323, 70, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (662, 'Fire Safety', 69931, 43, 39);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (663, 'Security Systems', 74708, 97, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (664, 'Appliance Repair', 7839, 81, 86);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (665, 'Landscaping', 68201, 28, 48);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (666, 'Plumbing', 70731, 55, 70);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (667, 'Fire Safety', 33167, 37, 35);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (668, 'Landscaping', 92098, 98, 82);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (669, 'Carpentry', 30253, 25, 15);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (670, 'Painting', 42351, 92, 22);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (671, 'HVAC', 97450, 47, 49);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (672, 'Plumbing', 44367, 20, 70);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (673, 'Landscaping', 90171, 14, 53);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (674, 'Plumbing', 20417, 33, 20);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (675, 'Roofing', 32483, 64, 80);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (676, 'Fire Safety', 40526, 95, 52);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (677, 'Security Systems', 87457, 13, 38);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (678, 'Fire Safety', 62322, 48, 83);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (679, 'Painting', 62010, 51, 80);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (680, 'Security Systems', 90337, 71, 76);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (681, 'HVAC', 68302, 74, 41);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (682, 'Plumbing', 69888, 54, 67);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (683, 'Electrical', 89442, 29, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (684, 'Appliance Repair', 41641, 62, 50);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (685, 'Roofing', 77943, 82, 88);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (686, 'Landscaping', 75769, 17, 64);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (687, 'Carpentry', 86418, 45, 58);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (688, 'Security Systems', 24656, 78, 97);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (689, 'Carpentry', 28564, 67, 95);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (690, 'Landscaping', 84837, 65, 86);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (691, 'Electrical', 69308, 73, 90);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (692, 'Fire Safety', 77541, 58, 20);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (693, 'Fire Safety', 96211, 82, 85);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (694, 'Security Systems', 34940, 75, 65);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (695, 'HVAC', 50156, 47, 46);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (696, 'Roofing', 89558, 59, 83);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (697, 'Fire Safety', 6688, 26, 65);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (698, 'Plumbing', 99786, 93, 32);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (699, 'Roofing', 53188, 40, 15);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (700, 'Roofing', 88483, 75, 93);
commit;
prompt 700 records committed...
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (701, 'Plumbing', 50179, 85, 19);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (702, 'HVAC', 12393, 53, 49);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (703, 'Fire Safety', 74696, 38, 74);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (704, 'Electrical', 57408, 26, 66);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (705, 'Plumbing', 6453, 46, 62);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (706, 'Fire Safety', 92976, 53, 37);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (707, 'Landscaping', 70631, 47, 29);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (708, 'Electrical', 15389, 84, 21);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (709, 'Painting', 40854, 75, 87);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (710, 'Landscaping', 58464, 93, 24);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (711, 'Carpentry', 74622, 88, 91);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (712, 'HVAC', 80978, 72, 72);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (713, 'Appliance Repair', 66077, 97, 88);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (714, 'Fire Safety', 14431, 30, 29);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (715, 'Appliance Repair', 40229, 62, 31);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (716, 'Roofing', 20297, 28, 32);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (717, 'Landscaping', 14654, 64, 73);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (718, 'Security Systems', 19841, 37, 78);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (719, 'HVAC', 54821, 72, 43);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (720, 'HVAC', 8114, 13, 88);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (721, 'HVAC', 77416, 47, 23);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (722, 'Plumbing', 43563, 65, 76);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (723, 'Carpentry', 57329, 60, 57);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (724, 'Electrical', 87357, 61, 84);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (725, 'Plumbing', 59786, 37, 62);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (726, 'Landscaping', 11883, 18, 89);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (727, 'Landscaping', 69810, 47, 89);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (728, 'Security Systems', 61549, 68, 67);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (729, 'Carpentry', 11451, 33, 30);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (730, 'Landscaping', 28353, 13, 62);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (731, 'Electrical', 66571, 23, 65);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (732, 'Carpentry', 29213, 55, 61);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (733, 'Electrical', 44076, 27, 36);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (734, 'Security Systems', 9517, 67, 49);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (735, 'Painting', 53614, 29, 24);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (736, 'Security Systems', 68298, 13, 11);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (737, 'Roofing', 72555, 61, 94);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (738, 'Plumbing', 92581, 17, 45);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (739, 'Appliance Repair', 6133, 14, 20);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (740, 'Appliance Repair', 58451, 35, 85);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (741, 'Painting', 52709, 26, 32);
insert into DEPARTMENT (deptid, deptname, budget, maxcapacity, currentsize)
values (742, 'HVAC', 22396, 26, 28);
commit;
prompt 742 records loaded
prompt Loading EMPLOYEE...
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (1, 'John Doe', '123-456-7890', to_date('15-01-2020', 'dd-mm-yyyy'), 60000, 40, 1);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (2, 'Jane Smith', '234-567-8901', to_date('01-06-2018', 'dd-mm-yyyy'), 55000, 40, 2);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (3, 'Emily Johnson', '345-678-9012', to_date('20-03-2019', 'dd-mm-yyyy'), 50000, 40, 3);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (4, 'AvengedUnger', '056-548-9912', to_date('21-07-2008', 'dd-mm-yyyy'), 7126, 9, 275);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (5, 'JulietteSkaggs', '058-684-2944', to_date('27-12-2016', 'dd-mm-yyyy'), 9206, 8, 305);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (6, 'TaylorLipnicki', '053-810-9421', to_date('12-08-2006', 'dd-mm-yyyy'), 11861, 5, 531);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (7, 'ConnieMcCain', '054-545-8884', to_date('14-10-2015', 'dd-mm-yyyy'), 8768, 5, 129);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (8, 'BoStampley', '050-494-5025', to_date('07-09-2022', 'dd-mm-yyyy'), 11904, 8, 91);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (9, 'HilaryAiken', '053-412-1625', to_date('24-10-2003', 'dd-mm-yyyy'), 9784, 12, 690);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (10, 'TobeyWright', '055-488-5728', to_date('02-07-2011', 'dd-mm-yyyy'), 11668, 7, 724);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (11, 'KeithJessee', '059-170-7222', to_date('13-07-2014', 'dd-mm-yyyy'), 8503, 5, 331);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (12, 'SethIrving', '055-387-8425', to_date('13-04-2019', 'dd-mm-yyyy'), 10875, 8, 308);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (13, 'HollyPiven', '051-335-7793', to_date('19-01-2005', 'dd-mm-yyyy'), 7997, 7, 350);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (14, 'JesusBorden', '058-146-3478', to_date('24-11-2019', 'dd-mm-yyyy'), 8479, 7, 646);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (15, 'Jean-LucFeore', '053-613-6890', to_date('23-08-2020', 'dd-mm-yyyy'), 9457, 6, 442);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (16, 'KirstenNeil', '051-568-5707', to_date('16-01-2007', 'dd-mm-yyyy'), 11875, 10, 509);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (17, 'FredericSylvian', '053-265-3734', to_date('22-02-2004', 'dd-mm-yyyy'), 10979, 6, 344);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (18, 'WangBlossoms', '059-143-7429', to_date('26-05-2010', 'dd-mm-yyyy'), 7091, 11, 683);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (19, 'KirkMatthau', '056-152-3983', to_date('22-05-2017', 'dd-mm-yyyy'), 10226, 10, 37);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (20, 'AndieVan Damme', '057-204-5380', to_date('17-10-2016', 'dd-mm-yyyy'), 7100, 7, 130);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (21, 'SeanCrow', '056-457-7971', to_date('07-03-2006', 'dd-mm-yyyy'), 8996, 11, 400);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (22, 'EdwardGagnon', '054-409-6753', to_date('03-07-2022', 'dd-mm-yyyy'), 7185, 10, 343);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (23, 'RhysLynne', '052-590-4753', to_date('30-05-2018', 'dd-mm-yyyy'), 10525, 12, 231);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (24, 'DanniVincent', '053-262-1955', to_date('10-04-2020', 'dd-mm-yyyy'), 11308, 10, 686);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (25, 'QueenShue', '051-394-6916', to_date('21-08-2012', 'dd-mm-yyyy'), 8632, 8, 114);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (26, 'FirstBiel', '057-510-4369', to_date('12-03-2009', 'dd-mm-yyyy'), 11494, 5, 422);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (27, 'SylvesterWarden', '054-276-6503', to_date('01-06-2014', 'dd-mm-yyyy'), 7046, 11, 48);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (28, 'RichOsbourne', '053-988-7224', to_date('23-05-2017', 'dd-mm-yyyy'), 6273, 5, 202);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (29, 'JulieRockwell', '057-862-6629', to_date('31-10-2013', 'dd-mm-yyyy'), 9669, 8, 492);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (30, 'Mary BethMoraz', '054-433-1885', to_date('15-05-2016', 'dd-mm-yyyy'), 8082, 5, 51);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (31, 'AndreMcCain', '055-988-5987', to_date('13-03-2000', 'dd-mm-yyyy'), 9662, 10, 62);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (32, 'HenryHoward', '057-994-8377', to_date('30-10-2009', 'dd-mm-yyyy'), 10082, 10, 292);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (33, 'CaryChesnutt', '055-157-6539', to_date('09-09-2021', 'dd-mm-yyyy'), 7342, 7, 56);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (34, 'BelindaRoth', '051-748-6945', to_date('11-08-2005', 'dd-mm-yyyy'), 8009, 5, 270);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (35, 'MarleyKhan', '056-713-4789', to_date('17-08-2009', 'dd-mm-yyyy'), 7388, 9, 581);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (36, 'MarisaZappacosta', '052-737-1899', to_date('04-06-2001', 'dd-mm-yyyy'), 11238, 7, 501);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (37, 'JeffreyMurphy', '059-642-5233', to_date('13-01-2000', 'dd-mm-yyyy'), 7116, 12, 737);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (38, 'GoranLane', '052-992-6020', to_date('14-04-2015', 'dd-mm-yyyy'), 11166, 9, 704);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (39, 'MeredithSchiff', '059-392-1428', to_date('10-11-2018', 'dd-mm-yyyy'), 7012, 10, 391);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (40, 'ClaySchiavelli', '056-817-2401', to_date('13-07-2000', 'dd-mm-yyyy'), 7168, 12, 736);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (41, 'HugoWinter', '057-740-6680', to_date('12-04-2021', 'dd-mm-yyyy'), 10633, 10, 333);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (42, 'DianneForrest', '058-773-9956', to_date('21-03-2013', 'dd-mm-yyyy'), 8557, 12, 603);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (43, 'GarySheen', '050-684-7166', to_date('12-09-2000', 'dd-mm-yyyy'), 10782, 7, 47);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (44, 'GrantApple', '057-140-8821', to_date('14-07-2005', 'dd-mm-yyyy'), 10119, 6, 114);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (45, 'Ming-NaDeschanel', '056-746-6494', to_date('07-05-2004', 'dd-mm-yyyy'), 10999, 12, 474);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (46, 'CaryAtkins', '057-198-2803', to_date('12-03-2001', 'dd-mm-yyyy'), 10828, 5, 106);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (47, 'GeggyDzundza', '054-185-7748', to_date('29-08-2002', 'dd-mm-yyyy'), 11073, 6, 501);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (48, 'GeoffSevenfold', '053-126-2658', to_date('29-11-2009', 'dd-mm-yyyy'), 10983, 7, 65);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (49, 'Ming-NaCotton', '057-676-3093', to_date('22-02-2012', 'dd-mm-yyyy'), 7063, 12, 580);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (50, 'ElleLiu', '051-962-4749', to_date('08-04-2006', 'dd-mm-yyyy'), 10286, 6, 739);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (51, 'RupertCherry', '056-403-2576', to_date('02-10-2004', 'dd-mm-yyyy'), 9441, 11, 687);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (52, 'DianeHerndon', '053-655-1165', to_date('14-05-2020', 'dd-mm-yyyy'), 7110, 12, 413);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (53, 'GladysBeckham', '051-995-8872', to_date('22-12-2009', 'dd-mm-yyyy'), 11838, 11, 434);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (54, 'BlairSuvari', '053-659-3180', to_date('30-10-2016', 'dd-mm-yyyy'), 7238, 9, 653);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (55, 'BenWariner', '053-563-3030', to_date('12-06-2005', 'dd-mm-yyyy'), 8956, 11, 75);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (56, 'SpencerFranklin', '051-673-1672', to_date('27-01-2014', 'dd-mm-yyyy'), 9602, 8, 325);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (57, 'RobbieLove', '054-196-2740', to_date('31-01-2002', 'dd-mm-yyyy'), 7722, 8, 48);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (58, 'BuffyBerenger', '059-107-3181', to_date('19-10-2000', 'dd-mm-yyyy'), 10888, 10, 285);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (59, 'DebiKattan', '057-612-8936', to_date('19-01-2006', 'dd-mm-yyyy'), 8228, 6, 519);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (60, 'LucindaDouglas', '057-411-6463', to_date('10-05-2012', 'dd-mm-yyyy'), 7136, 5, 662);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (61, 'EarlParsons', '051-516-1635', to_date('06-07-2023', 'dd-mm-yyyy'), 6691, 12, 504);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (62, 'NikkiStarr', '056-488-1015', to_date('13-07-2002', 'dd-mm-yyyy'), 10597, 9, 231);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (63, 'PaulTate', '052-429-2409', to_date('21-02-2011', 'dd-mm-yyyy'), 9041, 12, 446);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (64, 'KennethHolden', '054-588-4869', to_date('13-02-2013', 'dd-mm-yyyy'), 8865, 12, 692);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (65, 'ChazzDaniels', '053-910-7879', to_date('12-12-2009', 'dd-mm-yyyy'), 9089, 6, 31);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (66, 'KazemVoight', '053-640-1385', to_date('15-07-2002', 'dd-mm-yyyy'), 10788, 6, 720);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (67, 'JulieWeston', '052-581-9556', to_date('11-08-2021', 'dd-mm-yyyy'), 8982, 5, 552);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (68, 'JetArmatrading', '053-497-7519', to_date('15-07-2020', 'dd-mm-yyyy'), 8383, 11, 167);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (69, 'EmbethDunn', '050-722-5478', to_date('22-05-2015', 'dd-mm-yyyy'), 10204, 5, 499);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (70, 'BrianAskew', '051-575-3515', to_date('13-06-2014', 'dd-mm-yyyy'), 8260, 5, 402);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (71, 'ForestCapshaw', '052-262-3772', to_date('05-03-2003', 'dd-mm-yyyy'), 11992, 10, 332);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (72, 'SissyOsborne', '050-701-4894', to_date('07-02-2000', 'dd-mm-yyyy'), 6344, 11, 106);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (73, 'EmmNielsen', '052-823-9723', to_date('23-09-2003', 'dd-mm-yyyy'), 7267, 7, 395);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (74, 'MirandaPlace', '058-394-9359', to_date('16-07-2017', 'dd-mm-yyyy'), 8215, 9, 529);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (75, 'RhonaBruce', '050-904-2621', to_date('15-03-2015', 'dd-mm-yyyy'), 7224, 12, 537);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (76, 'VickieKline', '053-974-3632', to_date('10-11-2009', 'dd-mm-yyyy'), 8711, 7, 284);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (77, 'TerenceCoverdale', '050-910-5715', to_date('16-12-2014', 'dd-mm-yyyy'), 9035, 10, 244);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (78, 'JodyGunton', '054-212-1474', to_date('11-06-2015', 'dd-mm-yyyy'), 8751, 11, 725);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (79, 'LennieHector', '050-775-1522', to_date('05-11-2004', 'dd-mm-yyyy'), 6145, 10, 143);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (80, 'LindaGriggs', '054-581-8240', to_date('01-01-2005', 'dd-mm-yyyy'), 9198, 8, 513);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (81, 'RutgerMoody', '050-874-9654', to_date('20-11-2017', 'dd-mm-yyyy'), 9607, 11, 608);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (82, 'CoreyClooney', '057-639-2361', to_date('04-03-2003', 'dd-mm-yyyy'), 11141, 10, 216);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (83, 'ChristineKleinenberg', '057-265-1739', to_date('10-10-2002', 'dd-mm-yyyy'), 7244, 11, 339);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (84, 'LorenRuffalo', '058-980-7135', to_date('01-02-2020', 'dd-mm-yyyy'), 7938, 10, 360);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (85, 'TommyChilton', '058-897-3022', to_date('22-03-2017', 'dd-mm-yyyy'), 9655, 12, 443);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (86, 'WarrenBrickell', '058-868-5321', to_date('31-10-2022', 'dd-mm-yyyy'), 6633, 7, 737);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (87, 'Jean-ClaudeReeve', '054-953-5402', to_date('21-01-2017', 'dd-mm-yyyy'), 11293, 5, 38);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (88, 'BebeShorter', '054-471-6196', to_date('16-09-2017', 'dd-mm-yyyy'), 11885, 11, 319);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (89, 'HoracePurefoy', '050-518-5002', to_date('04-10-2008', 'dd-mm-yyyy'), 7685, 8, 77);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (90, 'FatsMorse', '053-661-1116', to_date('03-05-2004', 'dd-mm-yyyy'), 6096, 6, 129);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (91, 'TracyMahood', '059-594-5544', to_date('17-04-2006', 'dd-mm-yyyy'), 7551, 10, 234);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (92, 'BurtMarin', '052-250-2240', to_date('23-02-2022', 'dd-mm-yyyy'), 6002, 9, 199);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (93, 'AlanLarter', '051-791-1751', to_date('18-09-2019', 'dd-mm-yyyy'), 11527, 7, 623);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (94, 'WesHatchet', '051-136-2990', to_date('12-05-2000', 'dd-mm-yyyy'), 6263, 11, 670);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (95, 'StevenSmurfit', '054-868-1388', to_date('09-06-2000', 'dd-mm-yyyy'), 8813, 12, 611);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (96, 'GlennShort', '058-131-7098', to_date('31-07-2010', 'dd-mm-yyyy'), 11766, 12, 317);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (97, 'JessicaCarrey', '058-327-2388', to_date('06-09-2011', 'dd-mm-yyyy'), 7672, 5, 11);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (98, 'JeanneSantana', '054-506-1840', to_date('28-06-2009', 'dd-mm-yyyy'), 9864, 12, 741);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (99, 'LupeCollie', '052-796-8371', to_date('08-12-2002', 'dd-mm-yyyy'), 10713, 5, 142);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (100, 'KaseyBuffalo', '056-239-1207', to_date('09-02-2021', 'dd-mm-yyyy'), 8996, 12, 175);
commit;
prompt 100 records committed...
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (101, 'Jonny LeeSutherland', '052-580-7800', to_date('26-01-2018', 'dd-mm-yyyy'), 7652, 10, 94);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (102, 'IvanShearer', '056-117-1593', to_date('12-01-2009', 'dd-mm-yyyy'), 8428, 7, 185);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (103, 'GavinCotton', '058-282-7636', to_date('21-06-2024', 'dd-mm-yyyy'), 10197, 10, 301);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (104, 'JamieAllan', '051-896-3901', to_date('06-07-2011', 'dd-mm-yyyy'), 8579, 10, 570);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (105, 'HilaryMoreno', '053-831-4628', to_date('19-09-2011', 'dd-mm-yyyy'), 10072, 5, 140);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (106, 'CeiliCazale', '055-175-8073', to_date('01-06-2016', 'dd-mm-yyyy'), 6041, 10, 200);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (107, 'DianeStrong', '051-672-6982', to_date('04-10-2016', 'dd-mm-yyyy'), 9557, 9, 19);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (108, 'KimberlyMattea', '051-352-8812', to_date('11-08-2013', 'dd-mm-yyyy'), 7076, 10, 461);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (109, 'BrendaDetmer', '050-469-9050', to_date('23-03-2009', 'dd-mm-yyyy'), 6498, 6, 445);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (110, 'MacFeore', '057-577-8916', to_date('05-02-2004', 'dd-mm-yyyy'), 7836, 10, 299);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (111, 'ManuBoorem', '053-222-9498', to_date('14-11-2019', 'dd-mm-yyyy'), 11944, 12, 626);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (112, 'LouiseHimmelman', '050-128-3058', to_date('10-01-2007', 'dd-mm-yyyy'), 11784, 10, 133);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (113, 'MarcAniston', '057-289-7200', to_date('01-02-2018', 'dd-mm-yyyy'), 10829, 6, 671);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (114, 'DemiSpears', '058-677-2325', to_date('31-10-2013', 'dd-mm-yyyy'), 6487, 12, 265);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (115, 'MichaelBroadbent', '056-609-3369', to_date('16-09-2009', 'dd-mm-yyyy'), 9757, 8, 671);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (116, 'DenisFrancis', '052-977-3139', to_date('15-05-2020', 'dd-mm-yyyy'), 8248, 6, 114);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (117, 'TziBirch', '059-136-1363', to_date('11-04-2002', 'dd-mm-yyyy'), 9302, 10, 658);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (118, 'HexKoteas', '053-250-8715', to_date('16-06-2013', 'dd-mm-yyyy'), 7510, 8, 351);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (119, 'LynnJamal', '053-345-7597', to_date('05-07-2016', 'dd-mm-yyyy'), 10827, 5, 708);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (120, 'MariaBeck', '058-580-6713', to_date('05-06-2018', 'dd-mm-yyyy'), 7785, 9, 331);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (121, 'MaxineSevenfold', '053-384-4272', to_date('22-09-2023', 'dd-mm-yyyy'), 11825, 11, 585);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (122, 'GabyHornsby', '051-639-1536', to_date('26-03-2001', 'dd-mm-yyyy'), 9634, 8, 609);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (123, 'SamanthaBello', '056-660-3604', to_date('10-02-2013', 'dd-mm-yyyy'), 10785, 12, 525);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (124, 'DannyDavis', '059-729-4675', to_date('09-03-2022', 'dd-mm-yyyy'), 8028, 7, 477);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (125, 'GeneBentley', '052-521-6143', to_date('01-07-2012', 'dd-mm-yyyy'), 8741, 8, 433);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (126, 'KidWatley', '054-899-1837', to_date('02-04-2011', 'dd-mm-yyyy'), 8030, 12, 395);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (127, 'EugeneHutton', '056-179-7968', to_date('12-03-2009', 'dd-mm-yyyy'), 7539, 8, 384);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (128, 'LydiaMarx', '051-470-2208', to_date('04-12-2007', 'dd-mm-yyyy'), 7031, 6, 490);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (129, 'FrankieDuncan', '052-963-4295', to_date('27-06-2021', 'dd-mm-yyyy'), 10735, 6, 428);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (130, 'MaxPalin', '059-169-7347', to_date('18-07-2022', 'dd-mm-yyyy'), 11681, 5, 30);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (131, 'DonnaMcGovern', '055-801-3763', to_date('28-06-2009', 'dd-mm-yyyy'), 11250, 7, 245);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (132, 'MitchellCallow', '051-501-8728', to_date('05-01-2020', 'dd-mm-yyyy'), 8976, 10, 281);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (133, 'PeaboWills', '051-954-7460', to_date('09-01-2014', 'dd-mm-yyyy'), 8986, 10, 595);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (134, 'HerbieRibisi', '059-637-5144', to_date('15-04-2001', 'dd-mm-yyyy'), 7667, 8, 117);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (135, 'KeithSpacey', '055-651-8254', to_date('27-10-2014', 'dd-mm-yyyy'), 10717, 5, 14);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (136, 'PhilipTomlin', '052-255-3901', to_date('14-11-2006', 'dd-mm-yyyy'), 8985, 12, 199);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (137, 'BetteMelvin', '058-892-1158', to_date('25-07-2003', 'dd-mm-yyyy'), 6270, 7, 698);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (138, 'CatherineKeitel', '057-281-4184', to_date('03-07-2017', 'dd-mm-yyyy'), 10660, 12, 115);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (139, 'JaredPlayboys', '056-573-7908', to_date('02-11-2005', 'dd-mm-yyyy'), 8596, 8, 340);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (140, 'HectorFerrer', '059-812-6145', to_date('12-01-2023', 'dd-mm-yyyy'), 6107, 8, 251);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (141, 'TomSuvari', '056-603-6732', to_date('03-09-2022', 'dd-mm-yyyy'), 7128, 8, 575);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (142, 'AniMulroney', '056-801-8257', to_date('21-03-2016', 'dd-mm-yyyy'), 7387, 7, 202);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (143, 'CesarHewitt', '052-485-6977', to_date('23-06-2002', 'dd-mm-yyyy'), 11327, 10, 714);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (144, 'TreyBrolin', '056-912-3297', to_date('14-06-2000', 'dd-mm-yyyy'), 10973, 5, 696);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (145, 'FionaRockwell', '052-554-8904', to_date('27-06-2017', 'dd-mm-yyyy'), 6789, 10, 278);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (146, 'ViggoStrong', '058-571-5154', to_date('02-06-2005', 'dd-mm-yyyy'), 9377, 6, 240);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (147, 'FredaWilliamson', '059-800-6130', to_date('17-04-2004', 'dd-mm-yyyy'), 11196, 12, 679);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (148, 'FisherAlexander', '055-572-2356', to_date('11-10-2013', 'dd-mm-yyyy'), 10177, 7, 154);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (149, 'AdrienPeterson', '052-665-5975', to_date('04-12-2014', 'dd-mm-yyyy'), 7979, 11, 393);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (150, 'LeVarRains', '052-282-5103', to_date('30-12-2007', 'dd-mm-yyyy'), 8730, 12, 236);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (151, 'ToshiroRemar', '050-997-8858', to_date('12-12-2014', 'dd-mm-yyyy'), 11441, 12, 552);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (152, 'ArmandBerenger', '057-929-7490', to_date('23-12-2009', 'dd-mm-yyyy'), 6906, 5, 176);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (153, 'MiaFarina', '051-577-7007', to_date('25-04-2009', 'dd-mm-yyyy'), 6287, 5, 111);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (154, 'DaveyAddy', '059-551-1755', to_date('12-02-2013', 'dd-mm-yyyy'), 11231, 5, 214);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (155, 'CandiceReiner', '059-194-2658', to_date('18-03-2017', 'dd-mm-yyyy'), 8795, 6, 415);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (156, 'CleaBurmester', '050-851-7716', to_date('11-10-2012', 'dd-mm-yyyy'), 6842, 8, 159);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (157, 'LorraineBacharach', '051-976-9616', to_date('05-08-2001', 'dd-mm-yyyy'), 6244, 11, 458);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (158, 'OmarWeisberg', '054-715-1286', to_date('25-08-2021', 'dd-mm-yyyy'), 10560, 11, 533);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (159, 'ThomasGough', '054-355-8207', to_date('02-02-2016', 'dd-mm-yyyy'), 11380, 6, 64);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (160, 'CherryLloyd', '058-102-3922', to_date('16-02-2005', 'dd-mm-yyyy'), 11881, 10, 91);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (161, 'LeonMac', '055-385-3219', to_date('05-07-2017', 'dd-mm-yyyy'), 11758, 5, 242);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (162, 'WallyEvett', '051-142-6396', to_date('17-09-2016', 'dd-mm-yyyy'), 8898, 10, 196);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (163, 'MosCrimson', '053-335-4030', to_date('12-02-2004', 'dd-mm-yyyy'), 9355, 11, 561);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (164, 'RoscoPleasure', '050-147-8173', to_date('29-03-2022', 'dd-mm-yyyy'), 7692, 12, 576);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (165, 'BetteGooding', '054-963-8861', to_date('10-02-2011', 'dd-mm-yyyy'), 8077, 11, 672);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (166, 'TreySecada', '057-920-6262', to_date('13-04-2015', 'dd-mm-yyyy'), 10699, 10, 502);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (167, 'EttaCostello', '050-734-4378', to_date('02-03-2003', 'dd-mm-yyyy'), 9232, 6, 27);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (168, 'KevinWen', '059-230-4448', to_date('26-10-2013', 'dd-mm-yyyy'), 10650, 7, 181);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (169, 'PabloGriffin', '059-191-6968', to_date('23-11-2006', 'dd-mm-yyyy'), 7932, 5, 616);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (170, 'PatImbruglia', '053-215-7733', to_date('27-08-2019', 'dd-mm-yyyy'), 7909, 11, 89);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (171, 'JoelyBryson', '054-138-3323', to_date('18-02-2000', 'dd-mm-yyyy'), 10254, 8, 300);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (172, 'FrancoTurner', '059-968-6243', to_date('30-03-2020', 'dd-mm-yyyy'), 7165, 12, 711);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (173, 'TeriJudd', '058-420-2637', to_date('19-12-2006', 'dd-mm-yyyy'), 8005, 11, 328);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (174, 'LynetteSolido', '053-401-1328', to_date('30-05-2012', 'dd-mm-yyyy'), 6428, 7, 199);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (175, 'TimCooper', '051-443-4277', to_date('22-07-2016', 'dd-mm-yyyy'), 6748, 9, 390);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (176, 'HollandMcDowell', '050-931-6718', to_date('04-01-2013', 'dd-mm-yyyy'), 9966, 10, 42);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (177, 'OlympiaStiller', '059-115-3331', to_date('16-05-2004', 'dd-mm-yyyy'), 9395, 11, 436);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (178, 'ArtSwayze', '058-501-9814', to_date('20-01-2022', 'dd-mm-yyyy'), 7079, 7, 665);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (179, 'BalthazarMaguire', '059-500-5449', to_date('03-04-2019', 'dd-mm-yyyy'), 11870, 8, 395);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (180, 'StephanieMorse', '053-719-6291', to_date('01-07-2005', 'dd-mm-yyyy'), 7328, 6, 554);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (181, 'VictorDuschel', '052-121-1082', to_date('04-11-2008', 'dd-mm-yyyy'), 11227, 9, 274);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (182, 'MacOjeda', '053-206-9430', to_date('19-01-2023', 'dd-mm-yyyy'), 11870, 11, 634);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (183, 'JodyMcConaughey', '054-737-2943', to_date('10-05-2022', 'dd-mm-yyyy'), 9613, 8, 368);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (184, 'MauryKeith', '051-448-7871', to_date('14-02-2017', 'dd-mm-yyyy'), 8814, 6, 559);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (185, 'LionelPigott-Smith', '056-934-8558', to_date('09-09-2021', 'dd-mm-yyyy'), 8065, 6, 547);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (186, 'LuisSchiff', '059-245-2039', to_date('21-10-2003', 'dd-mm-yyyy'), 7834, 5, 456);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (187, 'GeenaGuzman', '051-224-3513', to_date('04-01-2002', 'dd-mm-yyyy'), 7538, 8, 332);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (188, 'RayHannah', '052-193-7137', to_date('16-02-2019', 'dd-mm-yyyy'), 8540, 6, 98);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (189, 'SydneyTomei', '057-457-2613', to_date('18-11-2000', 'dd-mm-yyyy'), 11289, 7, 676);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (190, 'GeenaJames', '051-235-5770', to_date('27-01-2003', 'dd-mm-yyyy'), 8235, 5, 599);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (191, 'StellanApple', '054-310-5182', to_date('01-12-2010', 'dd-mm-yyyy'), 10084, 11, 430);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (192, 'CeCeMoss', '054-574-7542', to_date('04-12-2020', 'dd-mm-yyyy'), 6499, 6, 2);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (193, 'KieferLawrence', '057-164-9169', to_date('03-06-2010', 'dd-mm-yyyy'), 8070, 6, 652);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (194, 'IreneRaitt', '054-725-3929', to_date('19-06-2019', 'dd-mm-yyyy'), 10396, 10, 308);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (195, 'WhoopiHarrison', '050-330-5232', to_date('25-08-2003', 'dd-mm-yyyy'), 9886, 6, 337);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (196, 'PhilipElizabeth', '051-868-1964', to_date('05-12-2020', 'dd-mm-yyyy'), 7984, 8, 1);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (197, 'OroChoice', '050-812-7546', to_date('06-02-2019', 'dd-mm-yyyy'), 7140, 10, 307);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (198, 'SalmaCarradine', '057-213-2241', to_date('24-05-2023', 'dd-mm-yyyy'), 6959, 10, 408);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (199, 'PercyJay', '058-870-7274', to_date('18-04-2017', 'dd-mm-yyyy'), 6016, 6, 264);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (200, 'AshtonEmmett', '059-378-9175', to_date('29-06-2017', 'dd-mm-yyyy'), 6623, 10, 369);
commit;
prompt 200 records committed...
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (201, 'PenelopeReinhold', '054-572-9602', to_date('15-08-2020', 'dd-mm-yyyy'), 9973, 10, 305);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (202, 'LupePeniston', '052-619-4713', to_date('25-11-2012', 'dd-mm-yyyy'), 8848, 11, 737);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (203, 'SimonLithgow', '051-543-1417', to_date('24-01-2010', 'dd-mm-yyyy'), 11535, 10, 99);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (204, 'LanceWilder', '056-912-3545', to_date('03-04-2012', 'dd-mm-yyyy'), 6081, 6, 635);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (205, 'FrancesCampbell', '057-564-5279', to_date('16-06-2001', 'dd-mm-yyyy'), 11555, 7, 338);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (206, 'JaneaneBell', '053-710-8665', to_date('12-11-2011', 'dd-mm-yyyy'), 9702, 5, 668);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (207, 'TamalaTomlin', '059-394-1731', to_date('25-07-2014', 'dd-mm-yyyy'), 8259, 6, 112);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (208, 'StewartBerenger', '058-334-1662', to_date('06-09-2017', 'dd-mm-yyyy'), 10935, 9, 243);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (209, 'DavidStills', '057-523-8435', to_date('29-01-2024', 'dd-mm-yyyy'), 10394, 12, 680);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (210, 'DerrickValentin', '058-438-4725', to_date('16-04-2013', 'dd-mm-yyyy'), 9083, 8, 269);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (211, 'NigelPrice', '055-564-2521', to_date('08-10-2018', 'dd-mm-yyyy'), 6182, 5, 140);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (212, 'AimeePollak', '054-696-4780', to_date('11-05-2013', 'dd-mm-yyyy'), 8774, 10, 240);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (213, 'VictoriaGagnon', '050-824-7046', to_date('23-02-2013', 'dd-mm-yyyy'), 8931, 8, 11);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (214, 'JackDavidson', '053-626-5843', to_date('16-07-2023', 'dd-mm-yyyy'), 9227, 12, 546);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (215, 'RodBeck', '055-162-5127', to_date('25-01-2023', 'dd-mm-yyyy'), 6415, 10, 313);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (216, 'FranceHarry', '053-666-2279', to_date('17-02-2022', 'dd-mm-yyyy'), 9047, 11, 113);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (217, 'LeVarPigott-Smith', '053-354-2165', to_date('06-10-2014', 'dd-mm-yyyy'), 10995, 11, 454);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (218, 'MerylColtrane', '055-708-5608', to_date('25-10-2001', 'dd-mm-yyyy'), 9615, 6, 681);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (219, 'JesseMeniketti', '058-725-8242', to_date('08-03-2017', 'dd-mm-yyyy'), 10068, 5, 623);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (220, 'DaveJanney', '054-709-9543', to_date('17-10-2017', 'dd-mm-yyyy'), 7686, 9, 370);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (221, 'ChelyAlston', '059-598-7222', to_date('01-12-2013', 'dd-mm-yyyy'), 6471, 8, 523);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (222, 'HowardBreslin', '059-125-2425', to_date('17-02-2010', 'dd-mm-yyyy'), 7158, 7, 722);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (223, 'JamieLevine', '053-378-9983', to_date('28-01-2019', 'dd-mm-yyyy'), 6997, 11, 507);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (224, 'SarahSayer', '053-187-7946', to_date('19-04-2019', 'dd-mm-yyyy'), 6040, 10, 144);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (225, 'AniDiaz', '057-481-7545', to_date('14-12-2018', 'dd-mm-yyyy'), 6842, 8, 639);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (226, 'TziLennix', '053-209-3342', to_date('14-09-2012', 'dd-mm-yyyy'), 11270, 8, 607);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (227, 'ChubbyArthur', '053-217-9195', to_date('23-05-2005', 'dd-mm-yyyy'), 11794, 10, 596);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (228, 'DebbyWoods', '052-881-7848', to_date('02-11-2021', 'dd-mm-yyyy'), 10157, 11, 64);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (229, 'DarrenSnipes', '056-886-8197', to_date('01-09-2000', 'dd-mm-yyyy'), 10732, 6, 51);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (230, 'MikoWong', '051-931-4583', to_date('31-10-2019', 'dd-mm-yyyy'), 6605, 6, 626);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (231, 'LydiaBurton', '058-568-4724', to_date('05-05-2010', 'dd-mm-yyyy'), 11941, 11, 8);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (232, 'JeanKramer', '050-154-7794', to_date('16-07-2009', 'dd-mm-yyyy'), 9930, 6, 27);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (233, 'KurtPfeiffer', '051-235-3495', to_date('06-12-2014', 'dd-mm-yyyy'), 8148, 10, 560);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (234, 'TrickRicci', '051-575-2072', to_date('28-12-2002', 'dd-mm-yyyy'), 7754, 11, 505);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (235, 'LesleyHawn', '052-110-2647', to_date('09-04-2014', 'dd-mm-yyyy'), 6536, 8, 601);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (236, 'PowersDrive', '050-412-3320', to_date('16-06-2006', 'dd-mm-yyyy'), 11154, 8, 268);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (237, 'CarolStallone', '058-510-9816', to_date('29-08-2010', 'dd-mm-yyyy'), 7544, 5, 694);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (238, 'WesleyAdams', '052-377-6504', to_date('31-10-2018', 'dd-mm-yyyy'), 9668, 10, 375);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (239, 'CarrieSample', '059-259-7687', to_date('25-01-2009', 'dd-mm-yyyy'), 9498, 11, 72);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (240, 'MaggiePleasence', '059-523-3047', to_date('17-03-2006', 'dd-mm-yyyy'), 9017, 6, 182);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (241, 'MaureenTravers', '059-137-8563', to_date('13-06-2007', 'dd-mm-yyyy'), 11380, 5, 554);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (242, 'GarlandIsaacs', '050-143-3759', to_date('21-08-2005', 'dd-mm-yyyy'), 11096, 8, 434);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (243, 'TommyShannon', '058-345-4306', to_date('05-01-2021', 'dd-mm-yyyy'), 6632, 5, 522);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (244, 'MiguelMason', '059-810-2985', to_date('23-10-2018', 'dd-mm-yyyy'), 9056, 11, 699);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (245, 'IlleanaReno', '056-777-8372', to_date('04-11-2009', 'dd-mm-yyyy'), 11323, 12, 622);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (246, 'PeaboLeachman', '057-813-1694', to_date('13-09-2020', 'dd-mm-yyyy'), 7818, 8, 703);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (247, 'EmbethKline', '052-842-7199', to_date('08-04-2000', 'dd-mm-yyyy'), 7512, 12, 653);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (248, 'OlgaJane', '054-318-7213', to_date('09-10-2013', 'dd-mm-yyyy'), 11112, 5, 588);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (249, 'ReneAlda', '052-392-5957', to_date('05-10-2011', 'dd-mm-yyyy'), 9753, 10, 262);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (250, 'ChazzGallagher', '059-465-9636', to_date('13-05-2002', 'dd-mm-yyyy'), 9959, 7, 291);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (251, 'RonBrosnan', '057-615-2184', to_date('03-02-2007', 'dd-mm-yyyy'), 10530, 12, 69);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (252, 'ChazzZeta-Jones', '059-432-5367', to_date('29-03-2010', 'dd-mm-yyyy'), 11315, 10, 274);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (253, 'AlanLachey', '058-967-5168', to_date('27-05-2009', 'dd-mm-yyyy'), 9734, 11, 371);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (254, 'FreddyDanes', '052-162-6090', to_date('25-12-2008', 'dd-mm-yyyy'), 7150, 10, 161);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (255, 'TerrenceOrton', '057-515-5716', to_date('21-07-2003', 'dd-mm-yyyy'), 7058, 6, 539);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (256, 'RonAiken', '053-293-8592', to_date('29-06-2007', 'dd-mm-yyyy'), 6627, 6, 219);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (257, 'JoshHopper', '053-124-4139', to_date('07-11-2020', 'dd-mm-yyyy'), 7089, 12, 683);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (258, 'NicoleLavigne', '050-274-6484', to_date('16-04-2006', 'dd-mm-yyyy'), 10839, 10, 279);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (259, 'CampbellIdol', '053-619-5514', to_date('18-08-2011', 'dd-mm-yyyy'), 8121, 7, 422);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (260, 'TreatRussell', '059-331-4902', to_date('12-11-2018', 'dd-mm-yyyy'), 11988, 9, 378);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (261, 'FredDay-Lewis', '056-855-6640', to_date('06-06-2018', 'dd-mm-yyyy'), 7754, 10, 280);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (262, 'RobertSarandon', '058-548-2988', to_date('16-08-2020', 'dd-mm-yyyy'), 10512, 8, 710);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (263, 'CurtSmith', '057-305-6026', to_date('19-10-2007', 'dd-mm-yyyy'), 6463, 5, 131);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (264, 'HelenPressly', '059-717-3095', to_date('13-08-2012', 'dd-mm-yyyy'), 11558, 9, 54);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (265, 'KennethDanes', '056-941-7974', to_date('24-10-2004', 'dd-mm-yyyy'), 11058, 6, 334);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (266, 'LukeBelle', '057-303-9708', to_date('13-05-2011', 'dd-mm-yyyy'), 6124, 6, 124);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (267, 'RoyBiggs', '050-606-8734', to_date('13-08-2008', 'dd-mm-yyyy'), 10455, 5, 359);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (268, 'BretSkarsgard', '052-711-3664', to_date('16-08-2010', 'dd-mm-yyyy'), 7150, 9, 562);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (269, 'CherylKramer', '053-367-7044', to_date('26-03-2004', 'dd-mm-yyyy'), 9088, 5, 199);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (270, 'BradleyBlossoms', '057-762-7787', to_date('24-08-2022', 'dd-mm-yyyy'), 10508, 12, 187);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (271, 'RoddyRea', '052-476-2509', to_date('03-10-2023', 'dd-mm-yyyy'), 11703, 8, 193);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (272, 'TarynRamis', '053-550-7370', to_date('04-08-2013', 'dd-mm-yyyy'), 10321, 11, 8);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (273, 'GiancarloPlace', '053-425-8450', to_date('25-11-2015', 'dd-mm-yyyy'), 11790, 10, 358);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (274, 'DabneyDunaway', '053-964-1241', to_date('21-07-2004', 'dd-mm-yyyy'), 7042, 10, 4);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (275, 'GatesNewton', '052-390-5529', to_date('15-02-2000', 'dd-mm-yyyy'), 7810, 12, 216);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (276, 'RascalDutton', '052-592-3396', to_date('08-12-2015', 'dd-mm-yyyy'), 6183, 5, 46);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (277, 'VerucaRippy', '051-865-7704', to_date('14-05-2007', 'dd-mm-yyyy'), 6974, 8, 727);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (278, 'ChuckRifkin', '054-499-9537', to_date('08-02-2023', 'dd-mm-yyyy'), 11378, 12, 593);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (279, 'RickHayek', '055-814-4465', to_date('07-07-2009', 'dd-mm-yyyy'), 11164, 11, 271);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (280, 'DennisSaxon', '050-736-7253', to_date('02-11-2011', 'dd-mm-yyyy'), 8482, 12, 174);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (281, 'JaneaneHolbrook', '058-760-8958', to_date('07-03-2007', 'dd-mm-yyyy'), 11864, 9, 43);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (282, 'JetHanley', '054-982-5250', to_date('10-05-2016', 'dd-mm-yyyy'), 9472, 7, 232);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (283, 'ColleenJames', '051-460-7943', to_date('08-11-2006', 'dd-mm-yyyy'), 6162, 11, 337);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (284, 'NicolasWine', '053-667-4867', to_date('22-10-2022', 'dd-mm-yyyy'), 8927, 7, 561);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (285, 'StevenGarr', '058-862-9818', to_date('25-03-2019', 'dd-mm-yyyy'), 8360, 12, 48);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (286, 'RitchieRoundtree', '057-142-5308', to_date('15-05-2024', 'dd-mm-yyyy'), 7750, 7, 275);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (287, 'TarynWincott', '055-294-1504', to_date('16-12-2011', 'dd-mm-yyyy'), 10801, 7, 502);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (288, 'PeteCronin', '050-795-3516', to_date('09-07-2011', 'dd-mm-yyyy'), 9354, 6, 449);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (289, 'NightFlanery', '051-990-7132', to_date('30-11-2001', 'dd-mm-yyyy'), 11670, 12, 534);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (290, 'ScottWong', '057-589-4657', to_date('10-07-2013', 'dd-mm-yyyy'), 6637, 10, 423);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (291, 'MaggieHauer', '050-657-7546', to_date('09-02-2005', 'dd-mm-yyyy'), 10007, 6, 675);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (292, 'LloydHagar', '055-387-5531', to_date('15-07-2018', 'dd-mm-yyyy'), 8719, 6, 155);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (293, 'BillHingle', '051-570-7838', to_date('20-05-2014', 'dd-mm-yyyy'), 7452, 12, 453);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (294, 'KevinCara', '056-606-1364', to_date('16-08-2014', 'dd-mm-yyyy'), 10274, 10, 454);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (295, 'LenaLillard', '053-631-5994', to_date('03-07-2009', 'dd-mm-yyyy'), 9644, 7, 127);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (296, 'HarrisonNicholson', '057-427-1944', to_date('18-11-2006', 'dd-mm-yyyy'), 10468, 7, 14);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (297, 'CeliaHartnett', '057-805-4255', to_date('17-01-2001', 'dd-mm-yyyy'), 10148, 11, 443);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (298, 'TimTennison', '057-263-4474', to_date('20-08-2001', 'dd-mm-yyyy'), 6674, 9, 383);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (299, 'HalleStrong', '054-942-4665', to_date('17-03-2006', 'dd-mm-yyyy'), 11573, 10, 73);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (300, 'ChrisBedelia', '058-932-4500', to_date('29-05-2008', 'dd-mm-yyyy'), 9309, 7, 208);
commit;
prompt 300 records committed...
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (301, 'VendettaNeville', '059-876-1401', to_date('08-01-2015', 'dd-mm-yyyy'), 10641, 9, 77);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (302, 'SonnyFord', '051-541-8158', to_date('12-03-2022', 'dd-mm-yyyy'), 10120, 8, 100);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (303, 'FirstHagerty', '051-207-1577', to_date('18-11-2019', 'dd-mm-yyyy'), 11701, 7, 134);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (304, 'GordieGuilfoyle', '059-719-1705', to_date('04-02-2020', 'dd-mm-yyyy'), 7922, 6, 388);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (305, 'DebiMacht', '058-561-6223', to_date('14-11-2020', 'dd-mm-yyyy'), 8904, 7, 403);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (306, 'SamMcPherson', '058-439-7950', to_date('07-12-2018', 'dd-mm-yyyy'), 7069, 12, 478);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (307, 'GregIrons', '052-640-6682', to_date('28-09-2008', 'dd-mm-yyyy'), 10400, 5, 411);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (308, 'DianneNavarro', '053-601-5832', to_date('16-06-2011', 'dd-mm-yyyy'), 7636, 7, 440);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (309, 'LennieTheron', '059-357-7826', to_date('24-01-2016', 'dd-mm-yyyy'), 10804, 5, 256);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (310, 'BobbiGryner', '053-783-2129', to_date('16-02-2012', 'dd-mm-yyyy'), 8358, 5, 689);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (311, 'TobeyLennix', '054-888-4747', to_date('09-03-2007', 'dd-mm-yyyy'), 8222, 8, 381);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (312, 'SydneyCallow', '053-456-9054', to_date('12-02-2018', 'dd-mm-yyyy'), 8601, 5, 181);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (313, 'MollySanders', '057-230-7078', to_date('29-10-2015', 'dd-mm-yyyy'), 7693, 9, 248);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (314, 'JohnnieGates', '059-363-4527', to_date('23-05-2021', 'dd-mm-yyyy'), 9979, 5, 23);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (315, 'NathanCraven', '052-669-4390', to_date('23-10-2019', 'dd-mm-yyyy'), 9299, 9, 47);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (316, 'JenniferMcPherson', '057-601-2133', to_date('16-09-2008', 'dd-mm-yyyy'), 8494, 8, 459);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (317, 'VondaGatlin', '053-218-3181', to_date('06-12-2015', 'dd-mm-yyyy'), 6978, 8, 321);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (318, 'TamalaHaslam', '053-771-7324', to_date('02-02-2017', 'dd-mm-yyyy'), 8216, 10, 69);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (319, 'AprilOlin', '051-712-5483', to_date('22-12-2004', 'dd-mm-yyyy'), 8349, 11, 106);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (320, 'LinGray', '052-147-4332', to_date('20-08-2002', 'dd-mm-yyyy'), 8279, 5, 95);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (321, 'CarolPurefoy', '056-883-9096', to_date('26-12-2004', 'dd-mm-yyyy'), 9286, 11, 691);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (322, 'MikaMoraz', '056-610-5616', to_date('21-02-2002', 'dd-mm-yyyy'), 6420, 7, 341);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (323, 'FredBullock', '051-645-7415', to_date('02-08-2022', 'dd-mm-yyyy'), 10683, 9, 279);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (324, 'PhoebeDafoe', '053-548-1467', to_date('07-07-2015', 'dd-mm-yyyy'), 11067, 11, 423);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (325, 'RussellSpiner', '055-965-7898', to_date('16-12-2005', 'dd-mm-yyyy'), 9415, 8, 599);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (326, 'SeanOrbit', '058-410-8819', to_date('28-06-2012', 'dd-mm-yyyy'), 6203, 9, 641);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (327, 'FirstDavison', '052-364-2955', to_date('26-02-2014', 'dd-mm-yyyy'), 10130, 5, 333);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (328, 'LeVarHutton', '052-246-6287', to_date('06-07-2003', 'dd-mm-yyyy'), 7588, 11, 365);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (329, 'SethHall', '055-603-7445', to_date('14-03-2010', 'dd-mm-yyyy'), 9707, 12, 605);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (330, 'TedKinski', '058-253-2178', to_date('21-02-2002', 'dd-mm-yyyy'), 7336, 11, 644);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (331, 'DougBroadbent', '052-777-3692', to_date('11-11-2012', 'dd-mm-yyyy'), 7273, 5, 363);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (332, 'WayneKutcher', '056-772-7581', to_date('08-05-2008', 'dd-mm-yyyy'), 9333, 7, 87);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (333, 'SamSchiavelli', '054-710-1963', to_date('08-07-2016', 'dd-mm-yyyy'), 6003, 6, 267);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (334, 'RichieHarnes', '053-203-3963', to_date('10-06-2001', 'dd-mm-yyyy'), 6120, 10, 723);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (335, 'BobbiZevon', '056-931-1287', to_date('29-10-2018', 'dd-mm-yyyy'), 7916, 5, 27);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (336, 'PatSmith', '058-785-8705', to_date('21-03-2000', 'dd-mm-yyyy'), 11867, 6, 289);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (337, 'MosFogerty', '052-129-2400', to_date('02-11-2001', 'dd-mm-yyyy'), 9847, 11, 269);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (338, 'FamkeBosco', '055-395-6118', to_date('11-02-2012', 'dd-mm-yyyy'), 7538, 9, 74);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (339, 'IsabellaTodd', '058-434-5020', to_date('13-06-2006', 'dd-mm-yyyy'), 9181, 12, 362);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (340, 'TerrenceEvans', '052-623-7440', to_date('24-03-2000', 'dd-mm-yyyy'), 6360, 11, 669);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (341, 'HollandAlmond', '054-502-2666', to_date('10-09-2023', 'dd-mm-yyyy'), 10071, 6, 449);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (342, 'OssieSinatra', '057-527-2431', to_date('24-06-2015', 'dd-mm-yyyy'), 7932, 12, 226);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (343, 'SuzanneRoberts', '050-143-1381', to_date('13-01-2022', 'dd-mm-yyyy'), 6134, 5, 77);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (344, 'JuddMcAnally', '052-617-5351', to_date('28-05-2016', 'dd-mm-yyyy'), 8883, 9, 587);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (345, 'RadeBurns', '050-229-3120', to_date('11-10-2023', 'dd-mm-yyyy'), 6451, 6, 228);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (346, 'NikBrock', '058-550-4502', to_date('07-10-2010', 'dd-mm-yyyy'), 8522, 10, 725);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (347, 'SelmaSledge', '058-597-7660', to_date('04-07-2017', 'dd-mm-yyyy'), 11368, 6, 704);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (348, 'HazelGoldblum', '051-893-2081', to_date('25-07-2019', 'dd-mm-yyyy'), 6456, 8, 647);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (349, 'DavisCattrall', '058-499-7904', to_date('17-09-2010', 'dd-mm-yyyy'), 9559, 8, 671);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (350, 'WilliamElliott', '050-970-2087', to_date('10-07-2006', 'dd-mm-yyyy'), 7524, 9, 645);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (351, 'ChristianNegbaur', '054-584-6807', to_date('03-06-2003', 'dd-mm-yyyy'), 9424, 10, 279);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (352, 'IkeLaBelle', '057-757-4230', to_date('14-11-2019', 'dd-mm-yyyy'), 8433, 7, 423);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (353, 'MaureenBrooke', '053-714-4994', to_date('09-06-2007', 'dd-mm-yyyy'), 10485, 7, 186);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (354, 'JillKingsley', '050-484-6571', to_date('05-11-2016', 'dd-mm-yyyy'), 10159, 11, 505);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (355, 'RicardoDutton', '052-294-3010', to_date('01-10-2007', 'dd-mm-yyyy'), 9475, 11, 671);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (356, 'AndyLowe', '052-438-8772', to_date('03-02-2017', 'dd-mm-yyyy'), 9210, 11, 324);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (357, 'ChazzGilley', '053-460-3064', to_date('03-07-2012', 'dd-mm-yyyy'), 9576, 10, 571);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (358, 'NormDuke', '055-628-3664', to_date('22-03-2022', 'dd-mm-yyyy'), 7332, 12, 70);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (359, 'OmarDe Almeida', '052-193-7755', to_date('19-04-2019', 'dd-mm-yyyy'), 7165, 9, 453);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (360, 'RoddyRobards', '056-135-4148', to_date('07-03-2020', 'dd-mm-yyyy'), 11815, 10, 230);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (361, 'ChelyHouston', '056-167-3543', to_date('12-02-2010', 'dd-mm-yyyy'), 8866, 12, 176);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (362, 'BoydTempest', '054-312-3577', to_date('27-11-2007', 'dd-mm-yyyy'), 7263, 8, 328);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (363, 'VickieWalsh', '058-514-2336', to_date('17-08-2002', 'dd-mm-yyyy'), 10028, 8, 282);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (364, 'AvrilApplegate', '058-504-7487', to_date('17-05-2019', 'dd-mm-yyyy'), 11399, 8, 306);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (365, 'TarynEastwood', '055-977-4451', to_date('20-11-2020', 'dd-mm-yyyy'), 6320, 6, 163);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (366, 'MauryMcGoohan', '050-252-1252', to_date('09-12-2002', 'dd-mm-yyyy'), 7847, 11, 313);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (367, 'RichieNavarro', '052-150-6049', to_date('25-01-2004', 'dd-mm-yyyy'), 6366, 8, 483);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (368, 'AlbertinaHolmes', '052-855-5600', to_date('05-10-2020', 'dd-mm-yyyy'), 7167, 8, 680);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (369, 'Mary BethImperioli', '050-918-8888', to_date('31-10-2019', 'dd-mm-yyyy'), 7586, 6, 290);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (370, 'NancyPesci', '051-650-3431', to_date('22-05-2024', 'dd-mm-yyyy'), 9033, 7, 406);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (371, 'NoahCrow', '050-304-3567', to_date('29-10-2006', 'dd-mm-yyyy'), 11025, 6, 354);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (372, 'LuisMathis', '054-570-2694', to_date('29-03-2014', 'dd-mm-yyyy'), 10774, 5, 597);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (373, 'ToddFisher', '051-936-4288', to_date('02-12-2019', 'dd-mm-yyyy'), 6382, 5, 145);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (374, 'CharlesShocked', '050-856-2604', to_date('05-03-2009', 'dd-mm-yyyy'), 9991, 11, 165);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (375, 'LanceFerrell', '053-428-9219', to_date('22-02-2008', 'dd-mm-yyyy'), 10940, 8, 38);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (376, 'JesseStoltz', '059-455-1958', to_date('07-07-2021', 'dd-mm-yyyy'), 8707, 8, 32);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (377, 'TeriHarrison', '054-345-6777', to_date('24-11-2012', 'dd-mm-yyyy'), 6192, 10, 461);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (378, 'EarlJamal', '050-127-5160', to_date('24-12-2017', 'dd-mm-yyyy'), 9364, 11, 489);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (379, 'MaceoSorvino', '055-344-8154', to_date('28-03-2013', 'dd-mm-yyyy'), 6889, 12, 22);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (380, 'XanderWhitford', '053-981-2455', to_date('06-05-2009', 'dd-mm-yyyy'), 11723, 5, 287);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (381, 'GeraldineCrowell', '059-203-6277', to_date('12-06-2004', 'dd-mm-yyyy'), 7420, 10, 33);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (382, 'RadneyGarr', '052-576-7248', to_date('17-08-2021', 'dd-mm-yyyy'), 10371, 6, 11);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (383, 'ConnieLloyd', '050-145-2645', to_date('09-09-2014', 'dd-mm-yyyy'), 7339, 6, 197);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (384, 'LizzyMewes', '056-881-4981', to_date('27-12-2022', 'dd-mm-yyyy'), 7815, 10, 253);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (385, 'MickyHerndon', '054-903-1179', to_date('09-03-2019', 'dd-mm-yyyy'), 11655, 7, 286);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (386, 'MenaWolf', '059-148-3182', to_date('07-10-2007', 'dd-mm-yyyy'), 10047, 7, 333);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (387, 'JulioAbraham', '054-508-6987', to_date('21-04-2007', 'dd-mm-yyyy'), 11801, 6, 614);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (388, 'TyroneGoldblum', '052-705-4834', to_date('14-09-2018', 'dd-mm-yyyy'), 8801, 6, 74);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (389, 'SophieWinter', '053-352-7725', to_date('08-04-2006', 'dd-mm-yyyy'), 6211, 6, 51);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (390, 'RosarioTah', '054-593-5414', to_date('10-02-2000', 'dd-mm-yyyy'), 7411, 6, 8);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (391, 'PeaboAndrews', '053-880-7755', to_date('28-04-2021', 'dd-mm-yyyy'), 10587, 12, 291);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (392, 'NastassjaSpears', '059-861-5630', to_date('28-07-2007', 'dd-mm-yyyy'), 10012, 7, 369);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (393, 'KatrinSpiner', '050-187-3438', to_date('14-06-2023', 'dd-mm-yyyy'), 7601, 8, 380);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (394, 'LorenCarlton', '052-715-3384', to_date('17-02-2005', 'dd-mm-yyyy'), 6827, 5, 397);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (395, 'GinaMitchell', '056-400-7379', to_date('15-10-2015', 'dd-mm-yyyy'), 11406, 10, 287);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (396, 'GlennRhymes', '059-980-9628', to_date('10-10-2001', 'dd-mm-yyyy'), 8146, 12, 192);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (397, 'WilliamCochran', '054-717-9223', to_date('14-06-2005', 'dd-mm-yyyy'), 10078, 5, 96);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (398, 'KeanuTippe', '057-305-6780', to_date('14-04-2005', 'dd-mm-yyyy'), 6354, 10, 711);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (399, 'CourtneyAnderson', '058-384-1290', to_date('10-03-2019', 'dd-mm-yyyy'), 8662, 11, 357);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (400, 'HarrisonGreenwood', '052-489-5200', to_date('27-03-2020', 'dd-mm-yyyy'), 7808, 5, 85);
commit;
prompt 400 records committed...
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (401, 'JulianneWheel', '058-629-3987', to_date('26-05-2021', 'dd-mm-yyyy'), 10934, 10, 69);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (402, 'DaveSmith', '055-807-6025', to_date('25-06-2001', 'dd-mm-yyyy'), 10353, 11, 549);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (403, 'JeanneVai', '053-179-2111', to_date('04-12-2003', 'dd-mm-yyyy'), 10899, 9, 219);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (404, 'AlfredMurray', '055-480-1399', to_date('07-02-2000', 'dd-mm-yyyy'), 8760, 7, 425);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (405, 'TarynField', '050-574-6899', to_date('03-11-2020', 'dd-mm-yyyy'), 9685, 11, 236);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (406, 'DeniseChoice', '059-659-9018', to_date('27-07-2015', 'dd-mm-yyyy'), 11144, 6, 226);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (407, 'GoldieHudson', '053-964-1629', to_date('21-06-2016', 'dd-mm-yyyy'), 9273, 8, 309);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (408, 'VanessaDanes', '054-912-8766', to_date('02-10-2005', 'dd-mm-yyyy'), 9425, 12, 281);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (409, 'HeathPurefoy', '057-122-7634', to_date('13-11-2009', 'dd-mm-yyyy'), 11815, 12, 320);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (410, 'RebekaBenson', '056-614-9440', to_date('19-09-2018', 'dd-mm-yyyy'), 11986, 9, 493);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (411, 'DebraMoody', '059-758-6539', to_date('08-01-2013', 'dd-mm-yyyy'), 11477, 10, 88);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (412, 'DaveyKapanka', '052-879-2827', to_date('06-12-2005', 'dd-mm-yyyy'), 9669, 9, 730);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (413, 'RosannaSevigny', '056-262-3229', to_date('04-03-2012', 'dd-mm-yyyy'), 9220, 6, 508);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (414, 'EarlBonneville', '053-337-5162', to_date('25-11-2002', 'dd-mm-yyyy'), 9169, 9, 500);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (415, 'DebbyNoseworthy', '058-152-7181', to_date('12-04-2008', 'dd-mm-yyyy'), 9003, 12, 255);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (416, 'MaryQuinones', '058-929-7933', to_date('11-01-2015', 'dd-mm-yyyy'), 9391, 12, 410);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (417, 'CaseyCummings', '052-477-6396', to_date('05-03-2009', 'dd-mm-yyyy'), 7030, 11, 43);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (418, 'PabloYorn', '055-226-7563', to_date('23-12-2001', 'dd-mm-yyyy'), 8493, 12, 414);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (419, 'RalphTaha', '050-690-1766', to_date('29-11-2023', 'dd-mm-yyyy'), 11174, 7, 641);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (420, 'VondaHolland', '050-327-9370', to_date('24-11-2003', 'dd-mm-yyyy'), 6959, 11, 230);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (421, 'Carrie-AnneCrudup', '050-326-9406', to_date('04-06-2010', 'dd-mm-yyyy'), 11943, 5, 29);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (422, 'OlgaOszajca', '051-102-2789', to_date('23-04-2022', 'dd-mm-yyyy'), 8907, 8, 484);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (423, 'ThelmaElwes', '051-553-2829', to_date('24-06-2015', 'dd-mm-yyyy'), 10827, 12, 499);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (424, 'JoaquinHolland', '056-388-6912', to_date('20-11-2020', 'dd-mm-yyyy'), 9016, 11, 208);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (425, 'JaredBlackwell', '051-411-6907', to_date('16-08-2019', 'dd-mm-yyyy'), 6732, 6, 598);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (426, 'BradleyBeals', '056-179-8265', to_date('30-03-2020', 'dd-mm-yyyy'), 7618, 10, 388);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (427, 'MillaDetmer', '056-529-8871', to_date('02-11-2011', 'dd-mm-yyyy'), 6067, 6, 10);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (428, 'DorryBugnon', '058-926-3239', to_date('02-04-2014', 'dd-mm-yyyy'), 10690, 7, 523);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (429, 'NilsIsaak', '051-501-3278', to_date('18-09-2010', 'dd-mm-yyyy'), 9108, 5, 597);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (430, 'SherylTolkan', '053-894-1002', to_date('28-02-2021', 'dd-mm-yyyy'), 10416, 12, 659);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (431, 'CrystalMacy', '050-174-7452', to_date('10-11-2020', 'dd-mm-yyyy'), 6006, 10, 468);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (432, 'CubaWeisz', '052-495-1892', to_date('06-12-2004', 'dd-mm-yyyy'), 8740, 7, 519);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (433, 'DeborahLaBelle', '050-966-4386', to_date('20-02-2010', 'dd-mm-yyyy'), 8545, 11, 706);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (434, 'ChrissieFinney', '055-262-9492', to_date('03-02-2015', 'dd-mm-yyyy'), 8520, 10, 10);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (435, 'LynnChanning', '054-282-6204', to_date('11-04-2021', 'dd-mm-yyyy'), 9861, 10, 81);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (436, 'TanyaGriggs', '059-519-1685', to_date('28-01-2015', 'dd-mm-yyyy'), 9674, 10, 690);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (437, 'FrancoSledge', '057-316-4848', to_date('14-12-2019', 'dd-mm-yyyy'), 8272, 8, 698);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (438, 'NathanRebhorn', '050-192-6240', to_date('24-04-2005', 'dd-mm-yyyy'), 10719, 12, 373);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (439, 'JosePhillips', '052-140-9496', to_date('25-04-2023', 'dd-mm-yyyy'), 10362, 8, 296);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (440, 'StephanieGarr', '052-130-3743', to_date('15-06-2021', 'dd-mm-yyyy'), 8354, 8, 276);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (441, 'JacksonGatlin', '053-860-2165', to_date('17-08-2012', 'dd-mm-yyyy'), 11059, 9, 304);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (442, 'KathyLennox', '053-172-5233', to_date('11-05-2004', 'dd-mm-yyyy'), 11086, 11, 486);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (443, 'JavonLevy', '050-728-4748', to_date('07-08-2015', 'dd-mm-yyyy'), 7839, 11, 678);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (444, 'JamieBurstyn', '051-278-4600', to_date('28-01-2013', 'dd-mm-yyyy'), 10141, 8, 324);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (445, 'TeenaBurton', '058-439-8330', to_date('01-02-2014', 'dd-mm-yyyy'), 10962, 8, 683);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (446, 'RoyPalminteri', '051-119-5888', to_date('13-12-2022', 'dd-mm-yyyy'), 8054, 8, 605);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (447, 'JuliaBancroft', '054-982-6615', to_date('22-10-2013', 'dd-mm-yyyy'), 10915, 12, 581);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (448, 'EllenTorres', '054-763-5013', to_date('16-10-2017', 'dd-mm-yyyy'), 9096, 6, 16);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (449, 'KennethO''Hara', '058-671-4778', to_date('29-05-2003', 'dd-mm-yyyy'), 6689, 6, 6);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (450, 'EmmylouProwse', '056-231-3284', to_date('08-07-2005', 'dd-mm-yyyy'), 6127, 11, 281);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (451, 'RyanWhitwam', '055-535-2535', to_date('15-03-2016', 'dd-mm-yyyy'), 7201, 9, 93);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (452, 'KyraDunaway', '050-208-3426', to_date('18-11-2017', 'dd-mm-yyyy'), 10272, 11, 197);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (453, 'EmersonRobinson', '057-248-4776', to_date('17-01-2001', 'dd-mm-yyyy'), 11732, 12, 579);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (454, 'RhettStiller', '056-316-7708', to_date('31-03-2015', 'dd-mm-yyyy'), 11011, 10, 285);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (455, 'JodyTippe', '055-112-5369', to_date('14-05-2020', 'dd-mm-yyyy'), 8908, 9, 349);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (456, 'BreckinPastore', '057-185-8252', to_date('27-10-2023', 'dd-mm-yyyy'), 11630, 5, 64);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (457, 'JayLynch', '056-545-2622', to_date('09-11-2012', 'dd-mm-yyyy'), 7922, 7, 593);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (458, 'SuzyHoward', '053-358-9838', to_date('02-11-2021', 'dd-mm-yyyy'), 6445, 10, 638);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (459, 'LennyTeng', '056-841-7127', to_date('04-07-2016', 'dd-mm-yyyy'), 9769, 12, 487);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (460, 'Mary BethPresley', '056-547-6386', to_date('12-11-2017', 'dd-mm-yyyy'), 6608, 11, 559);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (461, 'JodieTankard', '050-636-5259', to_date('27-10-2017', 'dd-mm-yyyy'), 6585, 8, 167);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (462, 'JoySingletary', '059-765-1078', to_date('24-10-2023', 'dd-mm-yyyy'), 10525, 6, 258);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (463, 'SarahHarary', '058-383-7994', to_date('13-05-2001', 'dd-mm-yyyy'), 9198, 11, 625);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (464, 'BarryLeto', '056-237-7641', to_date('30-05-2024', 'dd-mm-yyyy'), 9883, 8, 65);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (465, 'EmmCummings', '058-444-2165', to_date('14-03-2022', 'dd-mm-yyyy'), 10920, 12, 343);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (466, 'StockardDillon', '058-897-7877', to_date('28-10-2017', 'dd-mm-yyyy'), 10771, 9, 205);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (467, 'CeiliGuest', '051-232-9166', to_date('15-11-2013', 'dd-mm-yyyy'), 9066, 9, 352);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (468, 'TalvinHunter', '058-977-8011', to_date('14-07-2006', 'dd-mm-yyyy'), 8337, 7, 40);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (469, 'HugoCaan', '054-345-1623', to_date('01-09-2012', 'dd-mm-yyyy'), 10779, 6, 592);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (470, 'BernardPatrick', '057-171-2044', to_date('26-11-2019', 'dd-mm-yyyy'), 10763, 6, 72);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (471, 'MiriamStamp', '059-917-4219', to_date('24-10-2003', 'dd-mm-yyyy'), 10028, 5, 249);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (472, 'RobbieKenoly', '054-652-4936', to_date('07-12-2004', 'dd-mm-yyyy'), 10782, 10, 598);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (473, 'FisherKeith', '059-221-2734', to_date('03-12-2014', 'dd-mm-yyyy'), 10509, 5, 554);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (474, 'DonnaDriver', '055-800-1385', to_date('29-06-2006', 'dd-mm-yyyy'), 8583, 9, 279);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (475, 'FionaSpader', '058-792-5979', to_date('06-06-2012', 'dd-mm-yyyy'), 11779, 8, 7);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (476, 'JeroenJonze', '054-344-2000', to_date('31-05-2010', 'dd-mm-yyyy'), 11455, 11, 353);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (477, 'MattArnold', '055-232-8791', to_date('18-07-2004', 'dd-mm-yyyy'), 7992, 10, 86);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (478, 'ChristianVicious', '054-697-2187', to_date('02-12-2016', 'dd-mm-yyyy'), 10876, 9, 179);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (479, 'GrahamHornsby', '058-830-4163', to_date('22-12-2022', 'dd-mm-yyyy'), 11172, 8, 291);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (480, 'JonathanCruise', '055-595-5723', to_date('27-10-2022', 'dd-mm-yyyy'), 7836, 8, 197);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (481, 'RaymondKnight', '052-429-9852', to_date('30-05-2011', 'dd-mm-yyyy'), 6552, 11, 734);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (482, 'VendettaSayer', '052-368-8364', to_date('09-05-2003', 'dd-mm-yyyy'), 7797, 6, 639);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (483, 'RoyRain', '058-934-3244', to_date('23-04-2021', 'dd-mm-yyyy'), 11584, 11, 85);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (484, 'AmandaCopeland', '057-478-1376', to_date('20-06-2020', 'dd-mm-yyyy'), 10797, 10, 462);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (485, 'WallyRoundtree', '052-166-8643', to_date('22-02-2005', 'dd-mm-yyyy'), 10889, 5, 118);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (486, 'DeniseTankard', '050-159-1297', to_date('10-09-2000', 'dd-mm-yyyy'), 9626, 10, 667);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (487, 'DanielWoods', '054-530-4284', to_date('07-06-2004', 'dd-mm-yyyy'), 10450, 5, 704);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (488, 'ElizabethHirsch', '058-721-4987', to_date('30-01-2011', 'dd-mm-yyyy'), 10623, 6, 407);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (489, 'ArturoShearer', '057-253-4141', to_date('03-03-2013', 'dd-mm-yyyy'), 7679, 12, 510);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (490, 'SammyTomlin', '052-448-2674', to_date('19-09-2018', 'dd-mm-yyyy'), 7335, 12, 57);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (491, 'ArturoMraz', '052-218-3729', to_date('04-10-2023', 'dd-mm-yyyy'), 11359, 8, 449);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (492, 'RebekaLofgren', '059-623-2961', to_date('27-01-2023', 'dd-mm-yyyy'), 7950, 10, 266);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (493, 'HarrietCaine', '055-259-2445', to_date('05-02-2022', 'dd-mm-yyyy'), 11030, 8, 470);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (494, 'JeroenMars', '056-477-6871', to_date('21-07-2020', 'dd-mm-yyyy'), 8890, 9, 223);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (495, 'GlennGambon', '056-592-3388', to_date('03-02-2013', 'dd-mm-yyyy'), 6628, 9, 368);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (496, 'RayGibson', '057-328-6990', to_date('19-06-2024', 'dd-mm-yyyy'), 10126, 11, 297);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (497, 'MerrileeStigers', '055-685-9794', to_date('27-09-2003', 'dd-mm-yyyy'), 8400, 5, 103);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (498, 'SaffronDiddley', '052-786-2677', to_date('02-10-2014', 'dd-mm-yyyy'), 10564, 6, 12);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (499, 'ShirleyMantegna', '058-844-1083', to_date('17-03-2015', 'dd-mm-yyyy'), 9762, 12, 253);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (500, 'MaryDownie', '052-475-4166', to_date('02-01-2008', 'dd-mm-yyyy'), 9042, 6, 427);
commit;
prompt 500 records committed...
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (501, 'NigelMoore', '051-125-9851', to_date('29-10-2020', 'dd-mm-yyyy'), 10185, 5, 287);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (502, 'PaulaCrouch', '058-879-9406', to_date('17-02-2000', 'dd-mm-yyyy'), 10043, 5, 516);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (503, 'GuySorvino', '056-925-5711', to_date('24-06-2005', 'dd-mm-yyyy'), 8686, 7, 527);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (504, 'XanderHart', '056-422-7472', to_date('20-07-2021', 'dd-mm-yyyy'), 11964, 12, 491);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (505, 'GeorgeKelly', '055-322-1599', to_date('11-04-2006', 'dd-mm-yyyy'), 11597, 8, 108);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (506, 'JaneNicholson', '056-236-9693', to_date('23-05-2023', 'dd-mm-yyyy'), 7614, 11, 480);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (507, 'FreddyTennison', '051-431-5695', to_date('20-03-2012', 'dd-mm-yyyy'), 6191, 6, 657);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (508, 'LinFlanagan', '052-122-9087', to_date('17-06-2002', 'dd-mm-yyyy'), 6393, 12, 578);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (509, 'PeteGarofalo', '052-669-5464', to_date('02-08-2016', 'dd-mm-yyyy'), 7003, 6, 665);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (510, 'ElijahFerrer', '053-164-5521', to_date('16-01-2003', 'dd-mm-yyyy'), 9206, 6, 427);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (511, 'GlennDef', '054-216-2057', to_date('30-01-2014', 'dd-mm-yyyy'), 9461, 6, 466);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (512, 'GinaParsons', '055-989-1148', to_date('05-12-2015', 'dd-mm-yyyy'), 11485, 6, 377);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (513, 'HughWills', '053-901-1533', to_date('01-10-2001', 'dd-mm-yyyy'), 6384, 8, 574);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (514, 'JohnnyDevine', '054-627-3277', to_date('26-05-2008', 'dd-mm-yyyy'), 10570, 12, 396);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (515, 'QueenCamp', '050-376-3611', to_date('24-10-2007', 'dd-mm-yyyy'), 6114, 9, 536);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (516, 'RedDiesel', '052-492-5920', to_date('13-08-2008', 'dd-mm-yyyy'), 10059, 7, 360);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (517, 'CaroleNielsen', '050-311-8957', to_date('16-08-2002', 'dd-mm-yyyy'), 11064, 9, 598);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (518, 'BillyEastwood', '058-821-5883', to_date('04-04-2022', 'dd-mm-yyyy'), 9379, 11, 164);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (519, 'MekhiShaye', '055-146-9994', to_date('28-06-2008', 'dd-mm-yyyy'), 7664, 12, 301);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (520, 'HarrisonStanton', '052-566-5530', to_date('22-05-2008', 'dd-mm-yyyy'), 6738, 6, 373);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (521, 'ScottMakeba', '050-956-4918', to_date('06-11-2001', 'dd-mm-yyyy'), 9353, 9, 135);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (522, 'HeatherBarnett', '051-779-2299', to_date('17-11-2010', 'dd-mm-yyyy'), 9534, 6, 581);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (523, 'LouImbruglia', '057-991-1523', to_date('06-04-2020', 'dd-mm-yyyy'), 8779, 5, 26);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (524, 'Jonny LeePresley', '054-710-5686', to_date('16-03-2016', 'dd-mm-yyyy'), 9235, 10, 317);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (525, 'GwynethMarley', '052-942-4759', to_date('08-07-2008', 'dd-mm-yyyy'), 6302, 7, 401);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (526, 'ColleenMifune', '050-604-9946', to_date('10-10-2003', 'dd-mm-yyyy'), 7444, 12, 399);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (527, 'AmandaVannelli', '056-903-2124', to_date('09-07-2021', 'dd-mm-yyyy'), 6283, 7, 458);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (528, 'FranzRoundtree', '053-832-2061', to_date('29-08-2018', 'dd-mm-yyyy'), 7327, 5, 342);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (529, 'RodSewell', '051-118-6135', to_date('27-12-2006', 'dd-mm-yyyy'), 7173, 7, 378);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (530, 'KieranDiesel', '053-489-2842', to_date('25-05-2014', 'dd-mm-yyyy'), 11575, 5, 224);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (531, 'KateCheadle', '058-526-4804', to_date('25-09-2014', 'dd-mm-yyyy'), 7288, 11, 32);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (532, 'MegBaldwin', '050-455-7264', to_date('18-08-2016', 'dd-mm-yyyy'), 7547, 5, 428);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (533, 'AliceCross', '053-205-6304', to_date('28-02-2019', 'dd-mm-yyyy'), 7814, 12, 722);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (534, 'SydneyNicholson', '052-362-1505', to_date('19-08-2006', 'dd-mm-yyyy'), 10043, 8, 173);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (535, 'MadelineSellers', '054-567-1405', to_date('01-03-2001', 'dd-mm-yyyy'), 11347, 7, 105);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (536, 'Jean-ClaudeGoldberg', '051-889-1553', to_date('19-08-2020', 'dd-mm-yyyy'), 9126, 9, 96);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (537, 'RoscoeRickles', '056-538-6904', to_date('06-01-2021', 'dd-mm-yyyy'), 10593, 9, 612);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (538, 'WangTyler', '057-959-8910', to_date('05-01-2020', 'dd-mm-yyyy'), 6535, 9, 272);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (539, 'GinoStanton', '052-772-9626', to_date('18-05-2016', 'dd-mm-yyyy'), 7066, 6, 680);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (540, 'LarnelleRains', '056-130-5744', to_date('17-08-2018', 'dd-mm-yyyy'), 6208, 9, 730);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (541, 'RonnyNelligan', '051-713-3841', to_date('22-11-2023', 'dd-mm-yyyy'), 8027, 11, 116);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (542, 'JuniorSnow', '052-226-1060', to_date('13-02-2009', 'dd-mm-yyyy'), 6333, 8, 205);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (543, 'BurtMcGriff', '055-175-1543', to_date('17-01-2001', 'dd-mm-yyyy'), 7064, 12, 433);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (544, 'DomIsaak', '057-160-8946', to_date('04-09-2001', 'dd-mm-yyyy'), 6882, 9, 501);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (545, 'HenryArkenstone', '057-946-7128', to_date('17-01-2000', 'dd-mm-yyyy'), 9795, 11, 109);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (546, 'MaryHouston', '050-790-2952', to_date('09-07-2012', 'dd-mm-yyyy'), 9730, 11, 371);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (547, 'KirstenLofgren', '054-341-9121', to_date('19-10-2022', 'dd-mm-yyyy'), 8683, 9, 174);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (548, 'BobDzundza', '055-635-8089', to_date('05-06-2016', 'dd-mm-yyyy'), 7052, 12, 308);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (549, 'TalCarmen', '052-198-2806', to_date('24-04-2024', 'dd-mm-yyyy'), 10252, 10, 89);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (550, 'DanielPerez', '053-355-3997', to_date('30-10-2022', 'dd-mm-yyyy'), 11615, 8, 517);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (551, 'SteveTsettos', '058-971-9439', to_date('11-03-2023', 'dd-mm-yyyy'), 9358, 9, 210);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (552, 'JoshuaShandling', '055-894-4376', to_date('24-06-2023', 'dd-mm-yyyy'), 8683, 12, 732);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (553, 'HowardJamal', '053-434-5293', to_date('29-12-2004', 'dd-mm-yyyy'), 11138, 9, 380);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (554, 'KayDzundza', '051-125-9191', to_date('07-01-2014', 'dd-mm-yyyy'), 7508, 7, 494);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (555, 'VinDuschel', '053-834-4621', to_date('08-12-2009', 'dd-mm-yyyy'), 9066, 8, 11);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (556, 'TildaRemar', '053-942-2110', to_date('25-06-2008', 'dd-mm-yyyy'), 11449, 6, 608);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (557, 'CarleneLaSalle', '058-388-8762', to_date('27-09-2000', 'dd-mm-yyyy'), 11611, 12, 538);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (558, 'JonCarrack', '056-834-2573', to_date('11-06-2024', 'dd-mm-yyyy'), 7834, 7, 504);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (559, 'GlennHumphrey', '054-140-2706', to_date('25-03-2003', 'dd-mm-yyyy'), 11744, 5, 646);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (560, 'ShirleyCollie', '058-366-3554', to_date('26-10-2014', 'dd-mm-yyyy'), 10312, 5, 591);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (561, 'RedWinans', '057-282-8439', to_date('12-09-2018', 'dd-mm-yyyy'), 11270, 10, 87);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (562, 'KurtwoodMcGregor', '057-357-6777', to_date('17-03-2004', 'dd-mm-yyyy'), 9698, 6, 577);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (563, 'MaxineZeta-Jones', '050-684-3946', to_date('19-11-2006', 'dd-mm-yyyy'), 9081, 8, 232);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (564, 'JoanRandal', '058-690-4749', to_date('11-09-2017', 'dd-mm-yyyy'), 9083, 11, 441);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (565, 'IanAiken', '052-415-3889', to_date('30-10-2008', 'dd-mm-yyyy'), 7334, 11, 436);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (566, 'LievLove', '052-730-1723', to_date('08-11-2023', 'dd-mm-yyyy'), 8967, 5, 723);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (567, 'BoBurstyn', '055-313-9246', to_date('30-07-2011', 'dd-mm-yyyy'), 9610, 5, 290);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (568, 'RitaClayton', '058-699-8462', to_date('14-01-2007', 'dd-mm-yyyy'), 7462, 12, 443);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (569, 'BreckinSnow', '052-203-6687', to_date('28-09-2015', 'dd-mm-yyyy'), 10614, 11, 387);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (570, 'JuanCummings', '055-284-7740', to_date('12-07-2001', 'dd-mm-yyyy'), 10921, 12, 380);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (571, 'MichelleVance', '055-987-6766', to_date('22-01-2019', 'dd-mm-yyyy'), 9486, 7, 272);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (572, 'LeeBonneville', '053-567-9685', to_date('10-03-2015', 'dd-mm-yyyy'), 10621, 11, 501);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (573, 'CharltonHarry', '058-860-5053', to_date('24-04-2014', 'dd-mm-yyyy'), 10444, 12, 42);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (574, 'KeithForrest', '055-803-1674', to_date('11-07-2023', 'dd-mm-yyyy'), 11266, 6, 464);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (575, 'JeffGriggs', '054-465-2884', to_date('18-11-2008', 'dd-mm-yyyy'), 6860, 5, 735);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (576, 'NormMcDonnell', '054-277-1358', to_date('27-05-2003', 'dd-mm-yyyy'), 9840, 7, 291);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (577, 'DonBlackwell', '053-730-2333', to_date('12-06-2015', 'dd-mm-yyyy'), 6234, 6, 675);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (578, 'FreddieClarkson', '058-426-2767', to_date('09-01-2011', 'dd-mm-yyyy'), 10782, 8, 331);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (579, 'TobeySchock', '056-807-4021', to_date('20-04-2020', 'dd-mm-yyyy'), 7269, 12, 238);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (580, 'CollinSpacey', '055-515-5240', to_date('13-02-2017', 'dd-mm-yyyy'), 10241, 6, 315);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (581, 'PelvicFavreau', '055-425-5423', to_date('09-12-2004', 'dd-mm-yyyy'), 8794, 10, 196);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (582, 'EricWopat', '055-879-1372', to_date('23-02-2016', 'dd-mm-yyyy'), 8394, 8, 5);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (583, 'NilsWeiss', '052-588-2072', to_date('12-07-2013', 'dd-mm-yyyy'), 10929, 10, 120);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (584, 'GwynethMcDonald', '053-977-9094', to_date('25-07-2021', 'dd-mm-yyyy'), 9138, 8, 180);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (585, 'EarlEmmerich', '059-924-3498', to_date('25-12-2019', 'dd-mm-yyyy'), 6073, 5, 310);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (586, 'RoryTobolowsky', '055-197-8780', to_date('10-07-2010', 'dd-mm-yyyy'), 8941, 11, 366);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (587, 'HopeAllison', '058-867-9400', to_date('01-12-2013', 'dd-mm-yyyy'), 10351, 11, 374);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (588, 'RobertaGiamatti', '051-230-8609', to_date('06-07-2011', 'dd-mm-yyyy'), 10046, 10, 260);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (589, 'BeverleyArkin', '051-533-6658', to_date('28-01-2012', 'dd-mm-yyyy'), 9504, 11, 169);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (590, 'HarrietTucci', '054-870-4723', to_date('30-07-2020', 'dd-mm-yyyy'), 11429, 12, 127);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (591, 'ToshiroRichardson', '059-344-2656', to_date('04-06-2019', 'dd-mm-yyyy'), 10180, 12, 414);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (592, 'SanderSuchet', '050-598-3745', to_date('06-01-2015', 'dd-mm-yyyy'), 8876, 9, 471);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (593, 'BeverleySirtis', '059-421-9349', to_date('25-02-2009', 'dd-mm-yyyy'), 10565, 10, 387);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (594, 'LatinBaez', '050-530-2337', to_date('09-02-2024', 'dd-mm-yyyy'), 11048, 5, 494);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (595, 'QuentinIfans', '052-318-5889', to_date('30-07-2015', 'dd-mm-yyyy'), 10668, 11, 197);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (596, 'LauraBogguss', '050-178-8394', to_date('11-02-2009', 'dd-mm-yyyy'), 10346, 11, 459);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (597, 'ChubbyLopez', '056-768-6660', to_date('31-05-2017', 'dd-mm-yyyy'), 8756, 9, 18);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (598, 'LynnLee', '059-957-2645', to_date('17-01-2009', 'dd-mm-yyyy'), 7735, 6, 379);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (599, 'ChakaEverett', '059-704-5696', to_date('06-04-2007', 'dd-mm-yyyy'), 11675, 5, 269);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (600, 'JuliaButler', '050-202-8557', to_date('19-08-2016', 'dd-mm-yyyy'), 8133, 9, 488);
commit;
prompt 600 records committed...
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (601, 'JudgeFirth', '054-407-4876', to_date('08-05-2016', 'dd-mm-yyyy'), 9621, 6, 360);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (602, 'ArmandLoeb', '058-268-8841', to_date('22-04-2013', 'dd-mm-yyyy'), 9563, 10, 103);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (603, 'StellanDay', '059-995-5377', to_date('16-02-2007', 'dd-mm-yyyy'), 11629, 12, 288);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (604, 'DianneWahlberg', '051-406-4451', to_date('26-04-2022', 'dd-mm-yyyy'), 7821, 7, 292);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (605, 'RorySevigny', '059-437-5875', to_date('17-05-2014', 'dd-mm-yyyy'), 6974, 9, 14);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (606, 'FredaBentley', '050-929-2935', to_date('08-09-2019', 'dd-mm-yyyy'), 8730, 5, 546);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (607, 'DougBogguss', '054-465-5357', to_date('13-03-2000', 'dd-mm-yyyy'), 7317, 5, 168);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (608, 'KeithDiaz', '052-258-4199', to_date('07-03-2014', 'dd-mm-yyyy'), 11139, 5, 736);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (609, 'AllisonCoe', '055-828-1237', to_date('16-02-2016', 'dd-mm-yyyy'), 7000, 11, 654);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (610, 'JulietMoffat', '055-696-5556', to_date('28-08-2002', 'dd-mm-yyyy'), 11450, 8, 470);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (611, 'MickeyDukakis', '055-248-5327', to_date('07-05-2008', 'dd-mm-yyyy'), 7949, 7, 36);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (612, 'EmmGoodall', '059-769-1060', to_date('18-01-2021', 'dd-mm-yyyy'), 7556, 8, 728);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (613, 'GregMacDonald', '054-870-5176', to_date('02-09-2003', 'dd-mm-yyyy'), 9371, 9, 122);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (614, 'SamuelCaldwell', '050-472-8945', to_date('05-04-2013', 'dd-mm-yyyy'), 6500, 10, 117);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (615, 'KittySteagall', '055-248-8864', to_date('14-11-2016', 'dd-mm-yyyy'), 6372, 8, 569);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (616, 'KrisWhitmore', '054-892-4332', to_date('26-05-2023', 'dd-mm-yyyy'), 8747, 10, 530);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (617, 'AnnetteVan Damme', '057-120-4656', to_date('20-06-2015', 'dd-mm-yyyy'), 6040, 12, 120);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (618, 'JudyColtrane', '055-244-7450', to_date('24-12-2022', 'dd-mm-yyyy'), 10735, 10, 81);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (619, 'JohnnyLiu', '058-256-4506', to_date('25-07-2021', 'dd-mm-yyyy'), 7856, 6, 260);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (620, 'DiamondKlein', '056-760-7391', to_date('07-10-2012', 'dd-mm-yyyy'), 6951, 6, 584);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (621, 'JimmyBates', '051-347-4291', to_date('30-12-2020', 'dd-mm-yyyy'), 11876, 9, 263);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (622, 'FrankHingle', '055-426-1071', to_date('13-04-2013', 'dd-mm-yyyy'), 7312, 7, 216);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (623, 'LarenzMason', '058-480-7509', to_date('16-11-2019', 'dd-mm-yyyy'), 8361, 7, 465);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (624, 'SandraFariq', '057-848-3491', to_date('05-08-2015', 'dd-mm-yyyy'), 9784, 8, 677);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (625, 'PetulaKinney', '057-188-3897', to_date('10-09-2005', 'dd-mm-yyyy'), 10775, 6, 221);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (626, 'FrankPearce', '056-937-2834', to_date('05-06-2019', 'dd-mm-yyyy'), 7955, 9, 570);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (627, 'DustinDiffie', '059-523-5783', to_date('10-09-2020', 'dd-mm-yyyy'), 7671, 6, 306);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (628, 'GeraldMacIsaac', '052-742-9297', to_date('08-06-2001', 'dd-mm-yyyy'), 11502, 10, 68);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (629, 'TeenaMcPherson', '050-561-9806', to_date('19-11-2000', 'dd-mm-yyyy'), 8434, 5, 627);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (630, 'MorrisGoldblum', '050-481-2060', to_date('25-10-2014', 'dd-mm-yyyy'), 9991, 5, 567);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (631, 'PierceBryson', '059-554-6732', to_date('21-08-2006', 'dd-mm-yyyy'), 6330, 5, 73);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (632, 'LonnieBaker', '058-550-4278', to_date('14-04-2018', 'dd-mm-yyyy'), 8272, 8, 81);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (633, 'GlennRussell', '050-400-3289', to_date('12-01-2020', 'dd-mm-yyyy'), 6417, 12, 358);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (634, 'IkeSatriani', '051-505-8822', to_date('25-05-2018', 'dd-mm-yyyy'), 10476, 6, 282);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (635, 'BettyShalhoub', '052-558-5985', to_date('13-03-2009', 'dd-mm-yyyy'), 8765, 12, 20);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (636, 'NoahCrosby', '053-995-2412', to_date('24-07-2021', 'dd-mm-yyyy'), 10467, 12, 470);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (637, 'MintBadalucco', '054-305-7721', to_date('06-10-2015', 'dd-mm-yyyy'), 7685, 10, 546);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (638, 'DemiBrown', '055-551-1122', to_date('11-02-2005', 'dd-mm-yyyy'), 7172, 9, 406);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (639, 'MerilleeWinans', '051-973-7258', to_date('20-03-2022', 'dd-mm-yyyy'), 8499, 5, 227);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (640, 'LivLoring', '056-272-6865', to_date('07-05-2021', 'dd-mm-yyyy'), 6526, 9, 379);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (641, 'EdTurner', '058-421-2318', to_date('26-10-2002', 'dd-mm-yyyy'), 9233, 6, 662);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (642, 'DanielHanks', '050-747-3607', to_date('17-02-2014', 'dd-mm-yyyy'), 7673, 11, 669);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (643, 'ElizaNapolitano', '053-131-8818', to_date('13-06-2024', 'dd-mm-yyyy'), 10893, 12, 647);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (644, 'KieranTaylor', '050-360-5561', to_date('14-03-2002', 'dd-mm-yyyy'), 8400, 11, 1);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (645, 'OwenMoraz', '059-696-8579', to_date('25-01-2008', 'dd-mm-yyyy'), 11011, 8, 385);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (646, 'DennyCostner', '053-382-6856', to_date('18-07-2022', 'dd-mm-yyyy'), 9433, 9, 358);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (647, 'HarryRapaport', '057-374-9299', to_date('03-06-2020', 'dd-mm-yyyy'), 6273, 7, 712);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (648, 'ChiFichtner', '053-615-5819', to_date('23-03-2007', 'dd-mm-yyyy'), 10127, 7, 38);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (649, 'HalleGayle', '057-176-2782', to_date('29-11-2004', 'dd-mm-yyyy'), 11766, 9, 382);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (650, 'DonnaConroy', '053-657-5540', to_date('26-02-2016', 'dd-mm-yyyy'), 11010, 11, 322);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (651, 'ClayMoody', '058-711-6845', to_date('18-12-2014', 'dd-mm-yyyy'), 11902, 5, 220);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (652, 'RipHolly', '050-794-9487', to_date('13-02-2000', 'dd-mm-yyyy'), 10557, 5, 630);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (653, 'DaveyGellar', '050-333-3145', to_date('21-02-2020', 'dd-mm-yyyy'), 11965, 8, 505);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (654, 'AliPaymer', '050-133-3997', to_date('21-09-2008', 'dd-mm-yyyy'), 8291, 7, 105);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (655, 'ArminCube', '052-930-3816', to_date('23-06-2014', 'dd-mm-yyyy'), 8646, 7, 491);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (656, 'MoeSampson', '057-787-3227', to_date('21-02-2007', 'dd-mm-yyyy'), 6767, 6, 194);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (657, 'GladysMac', '056-545-7509', to_date('11-03-2019', 'dd-mm-yyyy'), 9462, 10, 27);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (658, 'MichaelBogguss', '050-395-2029', to_date('20-06-2012', 'dd-mm-yyyy'), 8973, 6, 344);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (659, 'HowardNiven', '054-890-4539', to_date('03-02-2007', 'dd-mm-yyyy'), 7807, 11, 486);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (660, 'DanniHingle', '053-735-4888', to_date('06-11-2017', 'dd-mm-yyyy'), 10187, 12, 676);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (661, 'JuliaGreene', '055-173-8659', to_date('27-02-2015', 'dd-mm-yyyy'), 11066, 5, 280);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (662, 'GabrielleWood', '052-106-2960', to_date('21-07-2017', 'dd-mm-yyyy'), 10093, 8, 729);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (663, 'LarenzLi', '056-544-4847', to_date('17-06-2002', 'dd-mm-yyyy'), 10962, 6, 579);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (664, 'SolomonDushku', '056-996-2139', to_date('13-11-2011', 'dd-mm-yyyy'), 6976, 5, 704);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (665, 'BarryBacharach', '050-288-1635', to_date('05-10-2019', 'dd-mm-yyyy'), 6651, 7, 590);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (666, 'RosannaShandling', '053-828-7248', to_date('18-01-2020', 'dd-mm-yyyy'), 10888, 7, 330);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (667, 'MirandaRhymes', '050-185-1382', to_date('02-02-2022', 'dd-mm-yyyy'), 11259, 10, 162);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (668, 'KimberlyWincott', '054-663-8765', to_date('09-05-2019', 'dd-mm-yyyy'), 7686, 12, 625);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (669, 'FrankieWard', '051-157-7645', to_date('26-04-2024', 'dd-mm-yyyy'), 9985, 6, 120);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (670, 'TeaBonneville', '053-532-2213', to_date('27-05-2021', 'dd-mm-yyyy'), 8757, 12, 613);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (671, 'RoryAniston', '054-608-5895', to_date('26-09-2010', 'dd-mm-yyyy'), 6064, 6, 656);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (672, 'BenjaminMraz', '053-843-7329', to_date('03-07-2006', 'dd-mm-yyyy'), 8718, 12, 507);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (673, 'AliLevy', '055-900-6444', to_date('17-10-2008', 'dd-mm-yyyy'), 7914, 12, 588);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (674, 'LeVarHector', '059-417-5658', to_date('27-01-2002', 'dd-mm-yyyy'), 11614, 5, 497);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (675, 'DougCherry', '053-419-7040', to_date('25-01-2013', 'dd-mm-yyyy'), 10362, 10, 473);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (676, 'AidanGrier', '053-177-8087', to_date('16-09-2020', 'dd-mm-yyyy'), 7639, 7, 639);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (677, 'BernieMcDiarmid', '056-150-4282', to_date('13-08-2007', 'dd-mm-yyyy'), 9084, 8, 582);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (678, 'MarinaImperioli', '055-516-7449', to_date('05-09-2000', 'dd-mm-yyyy'), 11411, 10, 478);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (679, 'TramaineTeng', '057-557-4378', to_date('30-03-2010', 'dd-mm-yyyy'), 7815, 5, 553);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (680, 'ChantéHopkins', '052-925-6359', to_date('20-10-2006', 'dd-mm-yyyy'), 11862, 8, 75);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (681, 'SeanLlewelyn', '053-503-7778', to_date('24-01-2022', 'dd-mm-yyyy'), 6818, 5, 570);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (682, 'JeroenTyson', '058-263-6338', to_date('14-07-2019', 'dd-mm-yyyy'), 9109, 11, 348);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (683, 'StewartBeatty', '050-188-7594', to_date('07-12-2017', 'dd-mm-yyyy'), 11896, 7, 721);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (684, 'KellyOwen', '057-974-9760', to_date('27-10-2010', 'dd-mm-yyyy'), 11726, 5, 155);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (685, 'BruceKelly', '050-724-9344', to_date('23-04-2016', 'dd-mm-yyyy'), 8351, 6, 32);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (686, 'LisaKennedy', '054-635-8580', to_date('27-08-2022', 'dd-mm-yyyy'), 8889, 11, 486);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (687, 'KeithPonty', '057-800-4145', to_date('25-03-2024', 'dd-mm-yyyy'), 8990, 12, 661);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (688, 'GeoffreySawa', '058-437-2963', to_date('08-07-2023', 'dd-mm-yyyy'), 10528, 11, 18);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (689, 'TreyEllis', '052-161-1997', to_date('21-07-2019', 'dd-mm-yyyy'), 8032, 8, 256);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (690, 'JuddBroza', '057-211-1140', to_date('23-06-2004', 'dd-mm-yyyy'), 8869, 5, 527);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (691, 'GilbertGetty', '057-405-8836', to_date('16-08-2013', 'dd-mm-yyyy'), 6886, 6, 210);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (692, 'JoshParsons', '055-434-7923', to_date('28-08-2020', 'dd-mm-yyyy'), 7503, 11, 314);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (693, 'AlbertinaEnglish', '059-167-7692', to_date('13-01-2020', 'dd-mm-yyyy'), 11696, 7, 529);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (694, 'ScarlettKoyana', '055-197-4539', to_date('28-06-2015', 'dd-mm-yyyy'), 11119, 6, 550);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (695, 'PhilipPfeiffer', '051-527-5051', to_date('03-11-2010', 'dd-mm-yyyy'), 11546, 11, 545);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (696, 'ShannynNortham', '056-693-3735', to_date('09-10-2003', 'dd-mm-yyyy'), 11317, 12, 282);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (697, 'AlfredSpader', '058-135-6512', to_date('16-04-2004', 'dd-mm-yyyy'), 10814, 11, 165);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (698, 'ChristmasEverett', '057-412-6636', to_date('14-09-2012', 'dd-mm-yyyy'), 9250, 6, 464);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (699, 'JudgeAniston', '055-229-3624', to_date('06-11-2010', 'dd-mm-yyyy'), 8568, 9, 585);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (700, 'MintPaul', '052-111-3537', to_date('06-07-2022', 'dd-mm-yyyy'), 7074, 6, 310);
commit;
prompt 700 records committed...
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (701, 'BurtonFiorentino', '051-321-7342', to_date('19-01-2011', 'dd-mm-yyyy'), 10627, 6, 385);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (702, 'GinErmey', '055-848-3891', to_date('08-09-2021', 'dd-mm-yyyy'), 9366, 11, 126);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (703, 'CeCeSlater', '052-308-6593', to_date('09-09-2010', 'dd-mm-yyyy'), 9263, 5, 193);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (704, 'GordPenders', '059-144-3141', to_date('05-01-2019', 'dd-mm-yyyy'), 11403, 6, 706);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (705, 'SpikeRandal', '059-462-7877', to_date('08-11-2001', 'dd-mm-yyyy'), 7873, 12, 330);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (706, 'RadneyBadalucco', '058-232-9902', to_date('31-01-2000', 'dd-mm-yyyy'), 9651, 6, 694);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (707, 'VerticalKahn', '054-472-7304', to_date('02-09-2021', 'dd-mm-yyyy'), 6714, 12, 430);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (708, 'RichHolly', '059-336-4307', to_date('26-04-2002', 'dd-mm-yyyy'), 9615, 5, 284);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (709, 'TaylorShalhoub', '050-560-8080', to_date('17-03-2018', 'dd-mm-yyyy'), 7303, 7, 139);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (710, 'AdamDupree', '054-349-1269', to_date('12-03-2024', 'dd-mm-yyyy'), 9371, 11, 469);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (711, 'LeoSnipes', '054-461-7618', to_date('02-04-2020', 'dd-mm-yyyy'), 6771, 11, 197);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (712, 'BonniePerez', '056-702-2836', to_date('25-05-2013', 'dd-mm-yyyy'), 8504, 12, 684);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (713, 'CherylMerchant', '055-467-9441', to_date('15-12-2022', 'dd-mm-yyyy'), 11612, 8, 540);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (714, 'VerucaEvanswood', '055-829-7090', to_date('09-10-2004', 'dd-mm-yyyy'), 11589, 9, 217);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (715, 'HelenLofgren', '052-989-8192', to_date('07-07-2022', 'dd-mm-yyyy'), 6346, 10, 665);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (716, 'SharonAykroyd', '055-714-4900', to_date('31-12-2008', 'dd-mm-yyyy'), 7787, 6, 366);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (717, 'MegSobieski', '056-590-6654', to_date('23-12-2005', 'dd-mm-yyyy'), 10960, 5, 407);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (718, 'HarrietBusey', '055-791-1607', to_date('12-11-2006', 'dd-mm-yyyy'), 9348, 8, 439);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (719, 'BonnieSpeaks', '055-612-2079', to_date('18-09-2007', 'dd-mm-yyyy'), 8942, 10, 132);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (720, 'AngieRed', '053-173-2290', to_date('28-04-2019', 'dd-mm-yyyy'), 6735, 11, 179);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (721, 'CaroleKinney', '059-812-7567', to_date('22-03-2009', 'dd-mm-yyyy'), 11736, 10, 626);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (722, 'ReginaBiel', '050-581-8835', to_date('20-02-2000', 'dd-mm-yyyy'), 6633, 9, 32);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (723, 'ChaleeJolie', '058-150-4119', to_date('08-08-2010', 'dd-mm-yyyy'), 6811, 11, 725);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (724, 'JefferyChung', '054-242-1485', to_date('22-04-2009', 'dd-mm-yyyy'), 8025, 8, 320);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (725, 'SonnyCoe', '055-386-2519', to_date('27-09-2001', 'dd-mm-yyyy'), 7707, 8, 528);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (726, 'JimmieBeals', '050-684-2194', to_date('02-03-2004', 'dd-mm-yyyy'), 6866, 10, 702);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (727, 'EugeneAllan', '058-426-6866', to_date('30-03-2022', 'dd-mm-yyyy'), 10653, 12, 315);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (728, 'PeaboMarin', '055-499-5738', to_date('20-11-2006', 'dd-mm-yyyy'), 6329, 10, 601);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (729, 'MariaCetera', '053-865-4412', to_date('11-03-2007', 'dd-mm-yyyy'), 8240, 8, 56);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (730, 'StanleyRoth', '051-466-3457', to_date('07-07-2006', 'dd-mm-yyyy'), 11229, 12, 214);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (731, 'OssieLoveless', '059-890-8036', to_date('07-10-2006', 'dd-mm-yyyy'), 11246, 5, 337);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (732, 'MarieWoods', '051-620-4581', to_date('24-09-2013', 'dd-mm-yyyy'), 10697, 9, 529);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (733, 'DeanOwen', '057-854-4148', to_date('21-02-2010', 'dd-mm-yyyy'), 11708, 7, 219);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (734, 'SaffronNewman', '058-590-4544', to_date('10-09-2017', 'dd-mm-yyyy'), 10603, 6, 2);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (735, 'BobbySecada', '055-633-4694', to_date('03-08-2004', 'dd-mm-yyyy'), 10940, 9, 274);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (736, 'WillTisdale', '053-300-9432', to_date('21-06-2004', 'dd-mm-yyyy'), 7232, 10, 342);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (737, 'ToshiroUnderwood', '050-413-3265', to_date('04-11-2006', 'dd-mm-yyyy'), 11781, 7, 542);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (738, 'BobbiAykroyd', '054-507-3985', to_date('12-09-2020', 'dd-mm-yyyy'), 10382, 10, 200);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (739, 'Mary-LouiseParish', '053-843-4689', to_date('03-09-2004', 'dd-mm-yyyy'), 6399, 11, 242);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (740, 'StewartKinney', '058-180-5221', to_date('04-12-2007', 'dd-mm-yyyy'), 10132, 11, 628);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (741, 'YaphetBarnett', '058-736-8905', to_date('25-08-2008', 'dd-mm-yyyy'), 11728, 5, 533);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (742, 'DavisCoughlan', '055-717-2067', to_date('28-11-2019', 'dd-mm-yyyy'), 8971, 12, 570);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (743, 'ColmFord', '059-719-9051', to_date('12-09-2009', 'dd-mm-yyyy'), 9510, 11, 600);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (744, 'ErnestZellweger', '050-528-5209', to_date('10-04-2000', 'dd-mm-yyyy'), 8576, 6, 570);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (745, 'TimReiner', '056-297-4455', to_date('25-05-2008', 'dd-mm-yyyy'), 11404, 6, 530);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (746, 'EmmBegley', '059-763-7991', to_date('01-04-2008', 'dd-mm-yyyy'), 8227, 5, 46);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (747, 'RodPreston', '052-761-2346', to_date('22-06-2013', 'dd-mm-yyyy'), 8850, 8, 360);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (748, 'RheaLynch', '055-909-2425', to_date('04-03-2008', 'dd-mm-yyyy'), 8540, 7, 210);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (749, 'BethPollak', '054-530-1481', to_date('13-04-2024', 'dd-mm-yyyy'), 11062, 8, 419);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (750, 'CateMitra', '050-372-6564', to_date('02-10-2020', 'dd-mm-yyyy'), 9629, 8, 401);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (751, 'BrookeBonneville', '052-511-8216', to_date('20-02-2008', 'dd-mm-yyyy'), 9642, 7, 25);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (752, 'CubaBenoit', '050-720-9376', to_date('05-12-2016', 'dd-mm-yyyy'), 10031, 11, 489);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (753, 'WillieLorenz', '050-182-1815', to_date('16-03-2023', 'dd-mm-yyyy'), 11663, 11, 127);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (754, 'MarinaO''Hara', '052-590-5237', to_date('02-08-2007', 'dd-mm-yyyy'), 11473, 12, 427);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (755, 'PeteMcConaughey', '059-601-8597', to_date('28-04-2022', 'dd-mm-yyyy'), 9581, 5, 602);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (756, 'GabrielleHarper', '058-691-1987', to_date('21-05-2020', 'dd-mm-yyyy'), 7793, 12, 141);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (757, 'OssieChaykin', '053-858-6893', to_date('07-12-2021', 'dd-mm-yyyy'), 10832, 6, 740);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (758, 'BrothersAvital', '052-162-5528', to_date('18-12-2000', 'dd-mm-yyyy'), 11851, 6, 615);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (759, 'NicholasArden', '059-235-4334', to_date('21-06-2001', 'dd-mm-yyyy'), 9451, 7, 339);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (760, 'JamieSweet', '057-269-8898', to_date('13-02-2016', 'dd-mm-yyyy'), 9021, 5, 627);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (761, 'EdgarStanton', '057-656-6715', to_date('16-10-2008', 'dd-mm-yyyy'), 7109, 10, 137);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (762, 'WhoopiRodgers', '058-644-6132', to_date('23-10-2002', 'dd-mm-yyyy'), 11714, 9, 652);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (763, 'AimeeDalley', '059-410-2206', to_date('06-05-2009', 'dd-mm-yyyy'), 8937, 8, 610);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (764, 'EdwinSevenfold', '056-446-4579', to_date('04-08-2000', 'dd-mm-yyyy'), 9085, 10, 26);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (765, 'KurtwoodJovovich', '053-650-9040', to_date('05-12-2020', 'dd-mm-yyyy'), 8669, 10, 180);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (766, 'AngelaRamirez', '058-661-3259', to_date('18-03-2006', 'dd-mm-yyyy'), 7786, 8, 428);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (767, 'FredWong', '059-863-3553', to_date('24-07-2010', 'dd-mm-yyyy'), 11535, 11, 586);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (768, 'ParkerKershaw', '054-187-4907', to_date('07-10-2000', 'dd-mm-yyyy'), 11831, 10, 42);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (769, 'RitaAdams', '059-666-9650', to_date('24-08-2007', 'dd-mm-yyyy'), 8151, 9, 404);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (770, 'SonaLindley', '052-446-1006', to_date('20-05-2006', 'dd-mm-yyyy'), 8623, 10, 615);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (771, 'IkeHarrelson', '054-582-9035', to_date('02-07-2019', 'dd-mm-yyyy'), 9963, 10, 663);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (772, 'EarlPurefoy', '057-977-1154', to_date('16-01-2013', 'dd-mm-yyyy'), 8466, 9, 731);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (773, 'HankFlack', '059-573-4832', to_date('06-03-2023', 'dd-mm-yyyy'), 6758, 9, 100);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (774, 'ThinStuart', '051-224-1794', to_date('21-12-2009', 'dd-mm-yyyy'), 6586, 9, 516);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (775, 'JesusDamon', '051-235-2224', to_date('18-03-2010', 'dd-mm-yyyy'), 8994, 6, 592);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (776, 'PercyPortman', '051-886-9520', to_date('22-09-2020', 'dd-mm-yyyy'), 10568, 8, 75);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (777, 'SanderDavidson', '052-175-5396', to_date('09-01-2024', 'dd-mm-yyyy'), 10294, 10, 418);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (778, 'JosephThewlis', '055-510-3191', to_date('08-07-2008', 'dd-mm-yyyy'), 8021, 5, 8);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (779, 'OliverD''Onofrio', '054-594-3026', to_date('22-04-2017', 'dd-mm-yyyy'), 6101, 7, 28);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (780, 'Ming-NaLightfoot', '052-327-2679', to_date('30-03-2022', 'dd-mm-yyyy'), 6252, 5, 82);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (781, 'JoeyCarrere', '059-879-4873', to_date('04-07-2022', 'dd-mm-yyyy'), 11267, 8, 540);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (782, 'TeenaMoriarty', '052-966-2642', to_date('05-10-2010', 'dd-mm-yyyy'), 9412, 5, 680);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (783, 'AlbertinaMacDonald', '050-262-5171', to_date('16-04-2006', 'dd-mm-yyyy'), 7827, 6, 450);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (784, 'JeanCurry', '053-457-4969', to_date('17-06-2008', 'dd-mm-yyyy'), 10019, 8, 539);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (785, 'ChristinaHolland', '057-863-9727', to_date('04-07-2006', 'dd-mm-yyyy'), 8753, 9, 727);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (786, 'CarolineWeisz', '056-913-4921', to_date('21-11-2013', 'dd-mm-yyyy'), 6813, 10, 741);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (787, 'WhoopiRobards', '058-730-1245', to_date('18-07-2004', 'dd-mm-yyyy'), 11284, 9, 183);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (788, 'FredaPaltrow', '052-638-5171', to_date('05-02-2005', 'dd-mm-yyyy'), 6317, 7, 304);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (789, 'JudgePatton', '051-894-7708', to_date('27-08-2021', 'dd-mm-yyyy'), 11143, 6, 711);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (790, 'MelbaTrevino', '055-391-2344', to_date('26-07-2020', 'dd-mm-yyyy'), 7307, 10, 706);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (791, 'CheechLarter', '055-917-4010', to_date('17-03-2010', 'dd-mm-yyyy'), 7697, 10, 428);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (792, 'JulietAniston', '059-664-9045', to_date('15-05-2008', 'dd-mm-yyyy'), 8367, 6, 221);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (793, 'IsaacBiehn', '055-347-4693', to_date('24-09-2009', 'dd-mm-yyyy'), 10444, 5, 664);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (794, 'BillMurphy', '055-834-8039', to_date('19-08-2018', 'dd-mm-yyyy'), 6808, 8, 684);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (795, 'FredericTah', '052-481-1987', to_date('26-10-2010', 'dd-mm-yyyy'), 6381, 8, 289);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (796, 'XanderHagar', '054-220-7041', to_date('29-07-2015', 'dd-mm-yyyy'), 11244, 8, 478);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (797, 'OrlandoSwinton', '053-133-1634', to_date('28-11-2007', 'dd-mm-yyyy'), 8295, 10, 281);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (798, 'SylvesterRio', '055-179-8830', to_date('08-02-2018', 'dd-mm-yyyy'), 7956, 12, 722);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (799, 'LorraineCandy', '058-798-5542', to_date('27-10-2008', 'dd-mm-yyyy'), 7079, 10, 550);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (800, 'LiamMcLean', '050-834-3854', to_date('13-07-2015', 'dd-mm-yyyy'), 9791, 10, 214);
commit;
prompt 800 records committed...
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (801, 'LydiaKinnear', '054-642-1464', to_date('06-09-2020', 'dd-mm-yyyy'), 7343, 12, 591);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (802, 'LilaAykroyd', '057-845-3517', to_date('27-01-2001', 'dd-mm-yyyy'), 9411, 11, 253);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (803, 'FredericMcCormack', '051-834-8952', to_date('07-01-2006', 'dd-mm-yyyy'), 6040, 5, 513);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (804, 'RoryCara', '054-523-6761', to_date('30-10-2005', 'dd-mm-yyyy'), 7362, 10, 729);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (805, 'GeneWillis', '053-147-3075', to_date('29-11-2009', 'dd-mm-yyyy'), 9141, 10, 712);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (806, 'MadelineChao', '050-633-6606', to_date('13-11-2013', 'dd-mm-yyyy'), 7311, 7, 291);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (807, 'LloydPalin', '050-682-2201', to_date('01-04-2003', 'dd-mm-yyyy'), 8779, 9, 594);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (808, 'ClaudeRivers', '053-361-6886', to_date('10-01-2012', 'dd-mm-yyyy'), 8940, 8, 433);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (809, 'ManuGiraldo', '054-244-4732', to_date('17-03-2013', 'dd-mm-yyyy'), 7227, 11, 468);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (810, 'ClaireHackman', '057-754-7793', to_date('02-05-2024', 'dd-mm-yyyy'), 9185, 8, 336);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (811, 'ArtPaquin', '051-527-6471', to_date('26-03-2004', 'dd-mm-yyyy'), 11886, 10, 556);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (812, 'GlenMacht', '054-114-7839', to_date('24-06-2016', 'dd-mm-yyyy'), 11662, 11, 341);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (813, 'MaceoYankovic', '051-801-5516', to_date('11-02-2015', 'dd-mm-yyyy'), 7532, 10, 698);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (814, 'BozHolly', '051-571-5736', to_date('31-05-2006', 'dd-mm-yyyy'), 8096, 5, 716);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (815, 'JaimeCandy', '056-150-1573', to_date('29-07-2018', 'dd-mm-yyyy'), 7825, 9, 507);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (816, 'LennyOlyphant', '053-812-5392', to_date('20-10-2004', 'dd-mm-yyyy'), 7278, 10, 441);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (817, 'RawlinsOlin', '051-456-4679', to_date('19-03-2010', 'dd-mm-yyyy'), 7785, 10, 697);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (818, 'KrisIngram', '054-211-2917', to_date('30-07-2009', 'dd-mm-yyyy'), 10299, 10, 434);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (819, 'LorenLee', '053-704-2805', to_date('13-01-2016', 'dd-mm-yyyy'), 8107, 6, 102);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (820, 'LesleyCartlidge', '057-867-4104', to_date('17-10-2000', 'dd-mm-yyyy'), 6576, 7, 185);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (821, 'GaryMartin', '052-887-9999', to_date('17-05-2017', 'dd-mm-yyyy'), 7056, 11, 556);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (822, 'NigelGarner', '058-891-3648', to_date('19-06-2001', 'dd-mm-yyyy'), 7189, 12, 151);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (823, 'JonathanHurley', '050-805-6965', to_date('17-12-2010', 'dd-mm-yyyy'), 9745, 9, 498);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (824, 'ElvisStigers', '057-444-6084', to_date('23-01-2016', 'dd-mm-yyyy'), 7309, 12, 136);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (825, 'JulioStudi', '059-734-5507', to_date('04-06-2006', 'dd-mm-yyyy'), 10111, 9, 49);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (826, 'GeraldMitra', '053-266-5507', to_date('12-03-2013', 'dd-mm-yyyy'), 11838, 8, 13);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (827, 'AniGreene', '051-837-6502', to_date('24-08-2020', 'dd-mm-yyyy'), 11414, 10, 406);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (828, 'MariaByrne', '058-254-8305', to_date('03-01-2018', 'dd-mm-yyyy'), 8642, 5, 556);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (829, 'DennyApplegate', '055-361-2188', to_date('04-04-2023', 'dd-mm-yyyy'), 10714, 9, 734);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (830, 'OroMcCann', '050-979-3752', to_date('22-04-2020', 'dd-mm-yyyy'), 11872, 8, 73);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (831, 'RuebenPatton', '057-757-3049', to_date('16-03-2015', 'dd-mm-yyyy'), 7200, 11, 61);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (832, 'MerrillLoggins', '053-920-2136', to_date('19-08-2001', 'dd-mm-yyyy'), 8673, 9, 306);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (833, 'VinHurley', '054-170-9527', to_date('30-05-2021', 'dd-mm-yyyy'), 11560, 6, 308);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (834, 'MillaKinney', '054-484-3524', to_date('21-02-2003', 'dd-mm-yyyy'), 9999, 5, 87);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (835, 'EmmylouRibisi', '051-337-7814', to_date('06-02-2007', 'dd-mm-yyyy'), 7365, 6, 384);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (836, 'JefferyHarrison', '053-340-7025', to_date('29-07-2011', 'dd-mm-yyyy'), 7033, 12, 353);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (837, 'JillReynolds', '050-619-1990', to_date('02-12-2016', 'dd-mm-yyyy'), 7964, 7, 356);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (838, 'LizzyVenora', '058-575-9862', to_date('20-11-2023', 'dd-mm-yyyy'), 6956, 5, 118);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (839, 'JuanAssante', '056-204-9562', to_date('19-02-2018', 'dd-mm-yyyy'), 11014, 11, 388);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (840, 'VondieMarin', '056-139-1501', to_date('23-12-2015', 'dd-mm-yyyy'), 6118, 9, 62);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (841, 'ThelmaMacLachlan', '056-603-1818', to_date('28-02-2013', 'dd-mm-yyyy'), 7992, 8, 579);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (842, 'LorenVassar', '059-618-3854', to_date('23-08-2016', 'dd-mm-yyyy'), 11154, 6, 578);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (843, 'ChadLucas', '053-442-1183', to_date('16-09-2010', 'dd-mm-yyyy'), 7083, 7, 522);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (844, 'CarrieKershaw', '051-193-3906', to_date('21-07-2005', 'dd-mm-yyyy'), 11973, 8, 571);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (845, 'AshtonArjona', '050-998-5738', to_date('25-03-2006', 'dd-mm-yyyy'), 7159, 5, 273);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (846, 'HeathTripplehorn', '054-803-5442', to_date('21-04-2022', 'dd-mm-yyyy'), 10799, 5, 562);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (847, 'AnnieHackman', '052-981-5067', to_date('26-06-2023', 'dd-mm-yyyy'), 9561, 8, 515);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (848, 'LynetteTravers', '053-866-8549', to_date('06-02-2011', 'dd-mm-yyyy'), 7352, 8, 87);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (849, 'JonnyHead', '051-569-7439', to_date('03-12-2019', 'dd-mm-yyyy'), 11385, 7, 544);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (850, 'CaroleWeir', '059-537-1706', to_date('12-02-2013', 'dd-mm-yyyy'), 7794, 11, 133);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (851, 'ChetRhodes', '054-986-3784', to_date('01-07-2022', 'dd-mm-yyyy'), 8328, 9, 539);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (852, 'ChiMcGriff', '056-488-7184', to_date('14-06-2008', 'dd-mm-yyyy'), 9018, 10, 242);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (853, 'NicolasTomei', '054-513-9943', to_date('25-12-2002', 'dd-mm-yyyy'), 11336, 11, 217);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (854, 'ReeseBates', '059-751-7653', to_date('03-01-2002', 'dd-mm-yyyy'), 10169, 7, 594);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (855, 'CampbellWoodard', '055-105-8785', to_date('05-02-2014', 'dd-mm-yyyy'), 6540, 6, 568);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (856, 'RedStreet', '051-971-4001', to_date('10-08-2004', 'dd-mm-yyyy'), 10761, 9, 535);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (857, 'WinonaLatifah', '051-771-5210', to_date('02-08-2015', 'dd-mm-yyyy'), 10820, 6, 54);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (858, 'KellyStiles', '058-207-6818', to_date('06-06-2010', 'dd-mm-yyyy'), 7345, 12, 629);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (859, 'UdoHarris', '057-159-7134', to_date('06-07-2016', 'dd-mm-yyyy'), 10958, 12, 425);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (860, 'HopeRooker', '054-531-6538', to_date('16-08-2016', 'dd-mm-yyyy'), 11221, 6, 385);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (861, 'DustinRain', '056-324-8602', to_date('18-10-2010', 'dd-mm-yyyy'), 9397, 8, 462);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (862, 'CevinParish', '057-404-7223', to_date('23-10-2013', 'dd-mm-yyyy'), 8007, 11, 513);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (863, 'BrianSmith', '059-682-5477', to_date('15-08-2007', 'dd-mm-yyyy'), 11117, 9, 232);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (864, 'GrahamLeachman', '054-378-4193', to_date('25-03-2004', 'dd-mm-yyyy'), 9006, 5, 283);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (865, 'BarbaraLiotta', '055-387-4054', to_date('01-11-2017', 'dd-mm-yyyy'), 8846, 7, 254);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (866, 'PowersCoburn', '056-636-9484', to_date('26-05-2014', 'dd-mm-yyyy'), 11860, 5, 33);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (867, 'CarlaSilverman', '055-829-5759', to_date('30-07-2021', 'dd-mm-yyyy'), 8763, 11, 416);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (868, 'TomWolf', '056-277-2258', to_date('11-03-2019', 'dd-mm-yyyy'), 11161, 11, 413);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (869, 'LauriePage', '055-629-9072', to_date('30-08-2020', 'dd-mm-yyyy'), 6661, 12, 556);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (870, 'WhoopiGershon', '059-943-1124', to_date('16-02-2005', 'dd-mm-yyyy'), 10055, 11, 466);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (871, 'MollySample', '050-615-1399', to_date('14-07-2009', 'dd-mm-yyyy'), 10443, 7, 604);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (872, 'EdBeals', '056-409-1641', to_date('18-05-2007', 'dd-mm-yyyy'), 6501, 10, 497);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (873, 'KathyFraser', '056-410-2904', to_date('08-11-2007', 'dd-mm-yyyy'), 7220, 11, 296);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (874, 'KelliTurner', '054-367-3382', to_date('04-02-2011', 'dd-mm-yyyy'), 8579, 6, 340);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (875, 'NickelFlack', '057-966-3929', to_date('25-11-2016', 'dd-mm-yyyy'), 11668, 5, 649);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (876, 'PeteHedaya', '058-163-5711', to_date('05-07-2004', 'dd-mm-yyyy'), 6858, 12, 322);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (877, 'ClaudeRichards', '056-999-3508', to_date('24-02-2014', 'dd-mm-yyyy'), 10790, 12, 329);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (878, 'RodneyPaquin', '058-591-1060', to_date('31-01-2009', 'dd-mm-yyyy'), 10356, 9, 146);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (879, 'RheaMargolyes', '055-481-4315', to_date('15-08-2010', 'dd-mm-yyyy'), 8550, 11, 527);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (880, 'ReginaKapanka', '058-950-2919', to_date('29-03-2002', 'dd-mm-yyyy'), 8757, 11, 634);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (881, 'JannFrampton', '057-517-5165', to_date('08-10-2004', 'dd-mm-yyyy'), 8019, 10, 47);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (882, 'EricRobards', '051-133-2222', to_date('02-12-2021', 'dd-mm-yyyy'), 7381, 12, 156);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (883, 'DarrenTrejo', '057-535-9454', to_date('21-02-2019', 'dd-mm-yyyy'), 8319, 9, 483);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (884, 'CheechParsons', '058-539-2135', to_date('08-03-2017', 'dd-mm-yyyy'), 11558, 6, 523);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (885, 'GenaChilton', '055-531-3854', to_date('14-04-2023', 'dd-mm-yyyy'), 9083, 8, 203);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (886, 'ClarenceWinger', '052-421-8770', to_date('03-05-2004', 'dd-mm-yyyy'), 11638, 8, 213);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (887, 'ConnieMahoney', '055-890-8574', to_date('04-05-2004', 'dd-mm-yyyy'), 11625, 11, 22);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (888, 'NinaWitt', '056-810-1858', to_date('17-06-2019', 'dd-mm-yyyy'), 7603, 9, 245);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (889, 'HeathDavid', '051-267-6745', to_date('14-09-2000', 'dd-mm-yyyy'), 6124, 7, 600);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (890, 'TracyHunt', '052-366-5209', to_date('12-12-2000', 'dd-mm-yyyy'), 11094, 12, 126);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (891, 'DavyOates', '051-570-5535', to_date('31-10-2017', 'dd-mm-yyyy'), 7037, 12, 472);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (892, 'AustinGold', '059-716-1735', to_date('17-07-2020', 'dd-mm-yyyy'), 11388, 12, 53);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (893, 'RadneyReilly', '056-545-5412', to_date('10-01-2002', 'dd-mm-yyyy'), 9160, 7, 71);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (894, 'BradCrewson', '051-318-3146', to_date('13-03-2009', 'dd-mm-yyyy'), 8561, 10, 234);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (895, 'LydiaKeith', '051-133-3245', to_date('11-02-2024', 'dd-mm-yyyy'), 7644, 8, 426);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (896, 'EmbethSainte-Marie', '053-389-5048', to_date('23-09-2013', 'dd-mm-yyyy'), 10290, 5, 636);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (897, 'LinZeta-Jones', '054-137-2648', to_date('27-06-2001', 'dd-mm-yyyy'), 9093, 8, 397);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (898, 'KayRyan', '057-561-1310', to_date('09-08-2015', 'dd-mm-yyyy'), 8685, 12, 435);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (899, 'KieranCraig', '056-738-8693', to_date('04-04-2004', 'dd-mm-yyyy'), 11152, 9, 299);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (900, 'BillyCooper', '056-310-8097', to_date('23-09-2005', 'dd-mm-yyyy'), 8897, 8, 572);
commit;
prompt 900 records committed...
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (901, 'OzzyBrickell', '059-805-4959', to_date('07-01-2024', 'dd-mm-yyyy'), 11009, 8, 436);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (902, 'RipMcDowall', '053-396-2157', to_date('17-01-2018', 'dd-mm-yyyy'), 11858, 6, 563);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (903, 'GinPollack', '051-201-3325', to_date('19-06-2004', 'dd-mm-yyyy'), 6402, 9, 490);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (904, 'ScarlettPalmer', '054-360-1657', to_date('17-07-2016', 'dd-mm-yyyy'), 10454, 11, 457);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (905, 'BrianDeejay', '057-580-3128', to_date('20-07-2001', 'dd-mm-yyyy'), 6388, 6, 286);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (906, 'GarlandMargulies', '055-500-3339', to_date('11-01-2000', 'dd-mm-yyyy'), 9332, 8, 29);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (907, 'SamuelHingle', '059-774-5746', to_date('19-03-2020', 'dd-mm-yyyy'), 6707, 10, 94);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (908, 'JackPollak', '053-199-2911', to_date('11-04-2004', 'dd-mm-yyyy'), 8463, 11, 591);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (909, 'AnjelicaMcGill', '053-970-1435', to_date('27-04-2022', 'dd-mm-yyyy'), 6412, 6, 641);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (910, 'QueenTucker', '050-677-1594', to_date('01-07-2000', 'dd-mm-yyyy'), 11323, 10, 8);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (911, 'MickeyOrton', '057-494-4994', to_date('10-03-2005', 'dd-mm-yyyy'), 7904, 6, 328);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (912, 'KylieShepherd', '052-850-3563', to_date('23-11-2020', 'dd-mm-yyyy'), 8974, 6, 49);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (913, 'FrankPierce', '057-924-5406', to_date('17-06-2015', 'dd-mm-yyyy'), 7999, 7, 477);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (914, 'JonLennox', '051-628-3855', to_date('05-05-2012', 'dd-mm-yyyy'), 9361, 12, 505);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (915, 'CesarSingletary', '057-403-3852', to_date('20-02-2006', 'dd-mm-yyyy'), 10547, 5, 693);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (916, 'LauraRomijn-Stamos', '052-382-1010', to_date('23-03-2004', 'dd-mm-yyyy'), 9582, 7, 675);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (917, 'CollinBlades', '056-982-6192', to_date('20-06-2002', 'dd-mm-yyyy'), 11748, 7, 108);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (918, 'AlbertinaColman', '058-815-6617', to_date('02-06-2012', 'dd-mm-yyyy'), 9703, 12, 401);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (919, 'JeannePorter', '051-806-8949', to_date('07-04-2014', 'dd-mm-yyyy'), 7130, 8, 573);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (920, 'KaseyNugent', '055-224-2796', to_date('16-07-2014', 'dd-mm-yyyy'), 6686, 7, 473);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (921, 'ChelyHatchet', '058-794-1946', to_date('30-01-2019', 'dd-mm-yyyy'), 8423, 6, 504);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (922, 'KrisDawson', '058-687-5868', to_date('29-07-2015', 'dd-mm-yyyy'), 6062, 11, 608);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (923, 'HowieSmith', '057-444-4623', to_date('30-03-2012', 'dd-mm-yyyy'), 10765, 10, 592);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (924, 'RicardoBrody', '056-146-4718', to_date('03-10-2014', 'dd-mm-yyyy'), 8020, 10, 353);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (925, 'JulieMerchant', '055-381-8800', to_date('11-02-2018', 'dd-mm-yyyy'), 8162, 10, 361);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (926, 'ShannynTheron', '058-793-3124', to_date('08-02-2002', 'dd-mm-yyyy'), 7446, 7, 270);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (927, 'MiguelCarr', '056-991-3788', to_date('17-10-2015', 'dd-mm-yyyy'), 11188, 7, 479);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (928, 'ColeyOjeda', '055-688-8296', to_date('12-10-2014', 'dd-mm-yyyy'), 10990, 10, 150);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (929, 'MillieOrbit', '053-473-7302', to_date('18-12-2020', 'dd-mm-yyyy'), 8034, 11, 717);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (930, 'MikiIrving', '051-209-2366', to_date('19-06-2015', 'dd-mm-yyyy'), 10386, 7, 584);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (931, 'BillOntiveros', '058-592-1288', to_date('10-12-2012', 'dd-mm-yyyy'), 9545, 6, 9);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (932, 'MariaWong', '051-540-1511', to_date('19-11-2009', 'dd-mm-yyyy'), 10860, 6, 85);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (933, 'GoldiePeniston', '052-153-6428', to_date('11-04-2007', 'dd-mm-yyyy'), 11127, 7, 429);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (934, 'RonnyBeckinsale', '058-755-3929', to_date('19-05-2022', 'dd-mm-yyyy'), 10332, 10, 622);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (935, 'EugenePotter', '051-916-8464', to_date('23-04-2004', 'dd-mm-yyyy'), 8825, 8, 142);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (936, 'EliasHoliday', '057-883-8978', to_date('15-10-2006', 'dd-mm-yyyy'), 8310, 12, 294);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (937, 'JoelyUnger', '056-186-4519', to_date('27-10-2018', 'dd-mm-yyyy'), 7816, 6, 113);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (938, 'VinceWoodward', '056-860-3641', to_date('27-12-2015', 'dd-mm-yyyy'), 10504, 10, 107);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (939, 'BettyDevine', '051-183-7931', to_date('08-10-2010', 'dd-mm-yyyy'), 6363, 5, 161);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (940, 'RawlinsBelles', '057-155-4995', to_date('03-09-2020', 'dd-mm-yyyy'), 11398, 11, 116);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (941, 'KurtwoodPressly', '053-809-6770', to_date('06-11-2003', 'dd-mm-yyyy'), 11359, 6, 441);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (942, 'TeaKelly', '052-916-7750', to_date('08-05-2015', 'dd-mm-yyyy'), 11973, 7, 561);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (943, 'RobinGreenwood', '057-688-2795', to_date('01-01-2019', 'dd-mm-yyyy'), 6326, 8, 179);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (944, 'JulieMaguire', '051-698-7116', to_date('18-12-2005', 'dd-mm-yyyy'), 10454, 12, 532);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (945, 'GarlandHidalgo', '055-120-9101', to_date('11-09-2012', 'dd-mm-yyyy'), 7482, 11, 153);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (946, 'DanDayne', '050-742-4444', to_date('11-03-2013', 'dd-mm-yyyy'), 6252, 10, 129);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (947, 'DennisSingletary', '053-139-3783', to_date('24-02-2013', 'dd-mm-yyyy'), 11571, 6, 736);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (948, 'EttaArden', '052-408-4192', to_date('17-06-2008', 'dd-mm-yyyy'), 7942, 8, 677);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (949, 'KevinRippy', '056-291-4552', to_date('07-09-2013', 'dd-mm-yyyy'), 9122, 10, 92);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (950, 'ElisabethSerbedzija', '056-614-6013', to_date('15-01-2003', 'dd-mm-yyyy'), 11196, 12, 562);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (951, 'DennisDupree', '058-267-7043', to_date('14-10-2001', 'dd-mm-yyyy'), 9787, 11, 328);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (952, 'DustinStatham', '055-282-5034', to_date('21-10-2023', 'dd-mm-yyyy'), 6829, 8, 347);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (953, 'RoseJames', '050-278-7538', to_date('10-04-2001', 'dd-mm-yyyy'), 6957, 10, 452);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (954, 'RamseyBiehn', '057-458-7937', to_date('21-10-2002', 'dd-mm-yyyy'), 6451, 9, 528);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (955, 'JeffMacy', '051-695-8578', to_date('11-08-2004', 'dd-mm-yyyy'), 6349, 12, 7);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (956, 'DavidLynne', '059-537-1137', to_date('20-02-2009', 'dd-mm-yyyy'), 6464, 6, 563);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (957, 'ToriPacino', '057-721-3585', to_date('15-11-2020', 'dd-mm-yyyy'), 9908, 6, 108);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (958, 'AshleyCrouch', '050-118-1467', to_date('03-04-2022', 'dd-mm-yyyy'), 10296, 11, 43);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (959, 'RachidBullock', '051-258-4555', to_date('28-05-2018', 'dd-mm-yyyy'), 7751, 7, 705);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (960, 'AshtonHingle', '052-461-8115', to_date('21-10-2010', 'dd-mm-yyyy'), 8542, 7, 358);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (961, 'ArturoUtada', '058-155-4402', to_date('12-05-2010', 'dd-mm-yyyy'), 11246, 5, 465);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (962, 'AndrewMcKean', '050-220-7469', to_date('16-08-2001', 'dd-mm-yyyy'), 7091, 6, 200);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (963, 'EmilyLucien', '050-311-9979', to_date('22-05-2012', 'dd-mm-yyyy'), 11050, 7, 558);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (964, 'DannyConway', '059-295-1794', to_date('19-06-2009', 'dd-mm-yyyy'), 7137, 5, 29);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (965, 'AnnieKweller', '056-566-3395', to_date('27-08-2001', 'dd-mm-yyyy'), 11480, 7, 54);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (966, 'MinnieDiggs', '057-706-2611', to_date('18-03-2024', 'dd-mm-yyyy'), 6166, 7, 359);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (967, 'WallyWeisberg', '050-286-4458', to_date('16-04-2009', 'dd-mm-yyyy'), 8233, 5, 503);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (968, 'OzzyReilly', '059-971-8114', to_date('13-06-2021', 'dd-mm-yyyy'), 10373, 6, 512);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (969, 'GrahamCarradine', '051-959-6997', to_date('30-06-2006', 'dd-mm-yyyy'), 8666, 8, 470);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (970, 'VondieCusack', '056-625-7157', to_date('10-03-2009', 'dd-mm-yyyy'), 10402, 5, 355);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (971, 'ErnestCandy', '054-257-4051', to_date('06-06-2020', 'dd-mm-yyyy'), 9890, 8, 587);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (972, 'ToshiroGaynor', '054-458-5276', to_date('19-11-2020', 'dd-mm-yyyy'), 10743, 8, 567);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (973, 'ElvisCopeland', '054-145-4402', to_date('14-07-2019', 'dd-mm-yyyy'), 6302, 9, 642);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (974, 'ErnieSerbedzija', '058-281-2938', to_date('02-07-2008', 'dd-mm-yyyy'), 10298, 7, 607);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (975, 'LenaArnold', '055-349-1426', to_date('12-06-2001', 'dd-mm-yyyy'), 10116, 10, 73);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (976, 'JuliaCoverdale', '051-984-9795', to_date('17-02-2013', 'dd-mm-yyyy'), 8618, 10, 352);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (977, 'ClintStigers', '059-445-1580', to_date('02-04-2014', 'dd-mm-yyyy'), 6466, 12, 369);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (978, 'BrentGallagher', '058-784-9285', to_date('18-09-2007', 'dd-mm-yyyy'), 6795, 5, 631);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (979, 'MilliePalmieri', '059-486-4815', to_date('18-04-2001', 'dd-mm-yyyy'), 8044, 5, 469);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (980, 'FatsGarber', '053-234-9388', to_date('23-11-2007', 'dd-mm-yyyy'), 8964, 12, 104);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (981, 'RuebenOldman', '050-665-4673', to_date('18-06-2009', 'dd-mm-yyyy'), 11343, 11, 144);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (982, 'ParkerD''Onofrio', '051-758-7981', to_date('27-10-2023', 'dd-mm-yyyy'), 7661, 11, 350);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (983, 'MadelineCosta', '057-660-3507', to_date('10-09-2021', 'dd-mm-yyyy'), 10916, 9, 465);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (984, 'RobertaBugnon', '050-151-1871', to_date('15-03-2014', 'dd-mm-yyyy'), 8818, 11, 633);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (985, 'TimothyTorn', '055-203-2136', to_date('01-09-2020', 'dd-mm-yyyy'), 9812, 8, 25);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (986, 'OlympiaOverstreet', '052-101-4512', to_date('08-05-2000', 'dd-mm-yyyy'), 9679, 9, 623);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (987, 'MinnieGill', '054-286-4851', to_date('13-01-2017', 'dd-mm-yyyy'), 11094, 12, 83);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (988, 'JaimeKnight', '057-581-5472', to_date('17-12-2013', 'dd-mm-yyyy'), 6535, 11, 667);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (989, 'GrantChecker', '053-385-6229', to_date('15-10-2010', 'dd-mm-yyyy'), 11244, 5, 506);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (990, 'MarianneClayton', '057-197-2184', to_date('01-12-2010', 'dd-mm-yyyy'), 10462, 11, 332);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (991, 'KyraHarary', '058-856-2012', to_date('09-04-2005', 'dd-mm-yyyy'), 8927, 6, 408);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (992, 'BozGold', '059-146-7258', to_date('26-12-2023', 'dd-mm-yyyy'), 11353, 5, 346);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (993, 'ViggoReed', '050-151-9722', to_date('06-11-2009', 'dd-mm-yyyy'), 10150, 11, 386);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (994, 'KittyCarrack', '055-120-9891', to_date('14-03-2014', 'dd-mm-yyyy'), 11149, 9, 171);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (995, 'JuniorMahoney', '053-113-3968', to_date('07-05-2021', 'dd-mm-yyyy'), 10867, 12, 277);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (996, 'JuniorFlatts', '056-830-7569', to_date('07-06-2019', 'dd-mm-yyyy'), 9286, 6, 332);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (997, 'NicoleShocked', '054-515-3920', to_date('10-10-2015', 'dd-mm-yyyy'), 6875, 11, 139);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (998, 'RobertSenior', '053-299-8578', to_date('04-06-2002', 'dd-mm-yyyy'), 8767, 8, 472);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (999, 'JuiceRobards', '050-406-9464', to_date('24-06-2018', 'dd-mm-yyyy'), 11748, 7, 391);
insert into EMPLOYEE (employeeid, name, phonenumber, startwork, salary, workinghours, deptid)
values (1000, 'ChloeParm', '058-417-5650', to_date('07-05-2012', 'dd-mm-yyyy'), 10914, 6, 283);
commit;
prompt 1000 records loaded
prompt Loading EQUIPMENT...
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (1, 'Laptop', 'Office', to_date('15-02-2022', 'dd-mm-yyyy'), 1);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (2, 'Projector', 'Conference Room', to_date('05-11-2021', 'dd-mm-yyyy'), 2);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (3, 'Air Conditioner', 'Maintenance Room', to_date('25-07-2020', 'dd-mm-yyyy'), 3);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (4, 'staple gun', 'closet organizer', to_date('22-06-2017', 'dd-mm-yyyy'), 4);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (5, 'sander', 'pallet rack', to_date('06-11-2006', 'dd-mm-yyyy'), 5);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (6, 'staple gun', 'modular storage system', to_date('02-03-2017', 'dd-mm-yyyy'), 6);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (7, 'wire strippers', 'utility trailer', to_date('28-09-2022', 'dd-mm-yyyy'), 7);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (8, 'clamps', 'roof rack', to_date('15-03-2017', 'dd-mm-yyyy'), 8);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (9, 'tape measure', 'mobile storage unit', to_date('26-12-2010', 'dd-mm-yyyy'), 9);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (10, 'miter saw', 'storage closet', to_date('20-04-2015', 'dd-mm-yyyy'), 10);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (11, 'crowbar', 'workbench', to_date('04-02-2021', 'dd-mm-yyyy'), 11);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (12, 'drill', 'equipment locker', to_date('17-11-2008', 'dd-mm-yyyy'), 12);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (13, 'pliers', 'corner cabinet', to_date('08-10-2023', 'dd-mm-yyyy'), 13);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (14, 'staple gun', 'storage bin', to_date('29-07-2017', 'dd-mm-yyyy'), 14);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (15, 'trowel', 'utility room', to_date('05-04-2003', 'dd-mm-yyyy'), 15);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (16, 'wire strippers', 'tool chest', to_date('04-05-2004', 'dd-mm-yyyy'), 16);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (17, 'air compressor', 'storage closet', to_date('29-03-2008', 'dd-mm-yyyy'), 17);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (18, 'jigsaw', 'utility trailer', to_date('01-01-2021', 'dd-mm-yyyy'), 18);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (19, 'torque wrench', 'equipment rack', to_date('12-04-2009', 'dd-mm-yyyy'), 19);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (20, 'nut driver', 'hanging rack', to_date('07-04-2008', 'dd-mm-yyyy'), 20);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (21, 'bench grinder', 'equipment shed', to_date('08-10-2021', 'dd-mm-yyyy'), 21);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (22, 'tape measure', 'storage pod', to_date('31-03-2006', 'dd-mm-yyyy'), 22);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (23, 'tape measure', 'storage container', to_date('10-12-2000', 'dd-mm-yyyy'), 23);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (24, 'heat gun', 'utility trailer', to_date('31-10-2002', 'dd-mm-yyyy'), 24);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (25, 'hacksaw', 'workshop', to_date('20-07-2001', 'dd-mm-yyyy'), 25);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (26, 'shop vacuum', 'drawer', to_date('25-06-2008', 'dd-mm-yyyy'), 26);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (27, 'calipers', 'equipment locker', to_date('25-10-2012', 'dd-mm-yyyy'), 27);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (28, 'tape measure', 'storage pod', to_date('21-08-2023', 'dd-mm-yyyy'), 28);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (29, 'miter saw', 'roof rack', to_date('12-10-2004', 'dd-mm-yyyy'), 29);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (30, 'punch set', 'storage cage', to_date('21-02-2000', 'dd-mm-yyyy'), 30);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (31, 'nail gun', 'tool cabinet', to_date('03-04-2000', 'dd-mm-yyyy'), 31);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (32, 'air compressor', 'equipment shed', to_date('05-07-2023', 'dd-mm-yyyy'), 32);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (33, 'air compressor', 'storage container', to_date('23-01-2000', 'dd-mm-yyyy'), 33);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (34, 'nail gun', 'utility trailer', to_date('16-08-2022', 'dd-mm-yyyy'), 34);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (35, 'utility knife', 'vehicle trunk', to_date('30-04-2007', 'dd-mm-yyyy'), 35);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (36, 'multimeter', 'equipment locker', to_date('09-08-2000', 'dd-mm-yyyy'), 36);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (37, 'miter saw', 'tool bag', to_date('28-05-2005', 'dd-mm-yyyy'), 37);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (38, 'vise', 'under stairs storage', to_date('03-11-2018', 'dd-mm-yyyy'), 38);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (39, 'crimping tool', 'workbench', to_date('11-03-2002', 'dd-mm-yyyy'), 39);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (40, 'saw', 'modular storage system', to_date('02-11-2002', 'dd-mm-yyyy'), 40);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (41, 'socket set', 'basement', to_date('25-01-2020', 'dd-mm-yyyy'), 41);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (42, 'nut driver', 'equipment shed', to_date('16-03-2009', 'dd-mm-yyyy'), 42);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (43, 'pipe wrench', 'corner cabinet', to_date('14-01-2015', 'dd-mm-yyyy'), 43);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (44, 'nut driver', 'storage closet', to_date('10-06-2013', 'dd-mm-yyyy'), 44);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (45, 'rivet gun', 'hanging rack', to_date('12-06-2001', 'dd-mm-yyyy'), 45);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (46, 'power planer', 'utility cart', to_date('27-05-2002', 'dd-mm-yyyy'), 46);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (47, 'measuring wheel', 'closet organizer', to_date('23-09-2010', 'dd-mm-yyyy'), 47);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (48, 'power planer', 'storage closet', to_date('29-11-2018', 'dd-mm-yyyy'), 48);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (49, 'adjustable spanner', 'equipment rack', to_date('22-06-2023', 'dd-mm-yyyy'), 49);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (50, 'crowbar', 'hanging rack', to_date('30-07-2005', 'dd-mm-yyyy'), 50);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (51, 'soldering iron', 'storage closet', to_date('12-06-2022', 'dd-mm-yyyy'), 51);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (52, 'circular saw', 'workshop', to_date('06-04-2010', 'dd-mm-yyyy'), 52);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (53, 'shop vacuum', 'equipment room', to_date('17-04-2009', 'dd-mm-yyyy'), 53);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (54, 'miter saw', 'portable tool box.', to_date('30-11-2020', 'dd-mm-yyyy'), 54);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (55, 'laser level', 'job site box', to_date('27-09-2014', 'dd-mm-yyyy'), 55);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (56, 'tape measure', 'storage barn', to_date('17-03-2013', 'dd-mm-yyyy'), 56);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (57, 'crimping tool', 'closet organizer', to_date('26-11-2008', 'dd-mm-yyyy'), 57);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (58, 'Allen wrench (hex key)', 'corner cabinet', to_date('22-06-2018', 'dd-mm-yyyy'), 58);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (59, 'nut driver', 'storage closet', to_date('22-05-2014', 'dd-mm-yyyy'), 59);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (60, 'fish tape', 'wall hooks', to_date('08-02-2007', 'dd-mm-yyyy'), 60);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (61, 'pipe wrench', 'workshop', to_date('31-07-2015', 'dd-mm-yyyy'), 61);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (62, 'tile cutter', 'tool chest', to_date('13-12-2001', 'dd-mm-yyyy'), 62);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (63, 'Allen wrench (hex key)', 'storage bin', to_date('25-09-2013', 'dd-mm-yyyy'), 63);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (64, 'socket set', 'storage tent', to_date('07-08-2009', 'dd-mm-yyyy'), 64);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (65, 'multimeter', 'tool belt', to_date('21-08-2013', 'dd-mm-yyyy'), 65);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (66, 'laser level', 'storage tent', to_date('26-01-2000', 'dd-mm-yyyy'), 66);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (67, 'nail gun', 'portable tool box.', to_date('18-07-2003', 'dd-mm-yyyy'), 67);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (68, 'fish tape', 'modular storage system', to_date('02-06-2005', 'dd-mm-yyyy'), 68);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (69, 'air compressor', 'equipment locker', to_date('11-02-2013', 'dd-mm-yyyy'), 69);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (70, 'router', 'closet organizer', to_date('01-09-2015', 'dd-mm-yyyy'), 70);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (71, 'sander', 'utility truck', to_date('15-11-2014', 'dd-mm-yyyy'), 71);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (72, 'hacksaw', 'storage barn', to_date('01-06-2008', 'dd-mm-yyyy'), 72);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (73, 'fish tape', 'lockable cabinet', to_date('09-03-2002', 'dd-mm-yyyy'), 73);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (74, 'nail gun', 'utility trailer', to_date('29-12-2018', 'dd-mm-yyyy'), 74);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (75, 'drill', 'corner cabinet', to_date('25-01-2007', 'dd-mm-yyyy'), 75);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (76, 'pliers', 'vehicle trunk', to_date('16-11-2019', 'dd-mm-yyyy'), 76);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (77, 'fish tape', 'toolbox', to_date('19-03-2020', 'dd-mm-yyyy'), 77);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (78, 'wrench', 'utility truck', to_date('18-04-2005', 'dd-mm-yyyy'), 78);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (79, 'bench grinder', 'equipment locker', to_date('17-04-2001', 'dd-mm-yyyy'), 79);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (80, 'shop vacuum', 'storage pod', to_date('08-01-2015', 'dd-mm-yyyy'), 80);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (81, 'pliers', 'wall hooks', to_date('04-04-2004', 'dd-mm-yyyy'), 81);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (82, 'punch set', 'workbench', to_date('13-10-2021', 'dd-mm-yyyy'), 82);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (83, 'screwdriver', 'workbench', to_date('31-08-2018', 'dd-mm-yyyy'), 83);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (84, 'Allen wrench (hex key)', 'lockable cabinet', to_date('22-01-2023', 'dd-mm-yyyy'), 84);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (85, 'angle grinder', 'hanging rack', to_date('02-11-2010', 'dd-mm-yyyy'), 85);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (86, 'level', 'vehicle trunk', to_date('22-09-2002', 'dd-mm-yyyy'), 86);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (87, 'bench grinder', 'storage tent', to_date('10-10-2016', 'dd-mm-yyyy'), 87);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (88, 'power planer', 'storage pod', to_date('08-06-2009', 'dd-mm-yyyy'), 88);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (89, 'wrench', 'equipment room', to_date('18-06-2018', 'dd-mm-yyyy'), 89);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (90, 'drill', 'tool chest', to_date('30-11-2006', 'dd-mm-yyyy'), 90);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (91, 'torque wrench', 'toolbox', to_date('05-05-2000', 'dd-mm-yyyy'), 91);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (92, 'tape measure', 'portable tool box.', to_date('04-07-2000', 'dd-mm-yyyy'), 92);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (93, 'chainsaw', 'utility trailer', to_date('25-07-2021', 'dd-mm-yyyy'), 93);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (94, 'power planer', 'modular storage system', to_date('30-01-2007', 'dd-mm-yyyy'), 94);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (95, 'saw', 'equipment rack', to_date('01-02-2004', 'dd-mm-yyyy'), 95);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (96, 'wrench', 'equipment rack', to_date('16-02-2002', 'dd-mm-yyyy'), 96);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (97, 'jigsaw', 'storage tent', to_date('12-04-2020', 'dd-mm-yyyy'), 97);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (98, 'wrench', 'storage barn', to_date('25-11-2006', 'dd-mm-yyyy'), 98);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (99, 'measuring wheel', 'storage closet', to_date('07-09-2014', 'dd-mm-yyyy'), 99);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (100, 'stud finder', 'equipment shed', to_date('28-04-2019', 'dd-mm-yyyy'), 100);
commit;
prompt 100 records committed...
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (101, 'air compressor', 'utility trailer', to_date('19-02-2000', 'dd-mm-yyyy'), 101);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (102, 'power planer', 'vehicle trunk', to_date('24-11-2009', 'dd-mm-yyyy'), 102);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (103, 'trowel', 'tool belt', to_date('01-07-2001', 'dd-mm-yyyy'), 103);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (104, 'stud finder', 'cabinet', to_date('28-08-2006', 'dd-mm-yyyy'), 104);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (105, 'pliers', 'storage closet', to_date('15-10-2001', 'dd-mm-yyyy'), 105);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (106, 'caulking gun', 'garage', to_date('20-07-2023', 'dd-mm-yyyy'), 106);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (107, 'multimeter', 'mobile storage unit', to_date('27-01-2014', 'dd-mm-yyyy'), 107);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (108, 'caulking gun', 'wall hooks', to_date('19-03-2020', 'dd-mm-yyyy'), 108);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (109, 'adjustable spanner', 'closet organizer', to_date('29-01-2000', 'dd-mm-yyyy'), 109);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (110, 'tile cutter', 'storage locker', to_date('21-10-2021', 'dd-mm-yyyy'), 110);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (111, 'oscillating tool', 'tool shed', to_date('31-05-2020', 'dd-mm-yyyy'), 111);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (112, 'rivet gun', 'pallet rack', to_date('02-10-2001', 'dd-mm-yyyy'), 112);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (113, 'hacksaw', 'closet organizer', to_date('10-12-2018', 'dd-mm-yyyy'), 113);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (114, 'caulking gun', 'storage locker', to_date('31-01-2013', 'dd-mm-yyyy'), 114);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (115, 'nut driver', 'utility room', to_date('10-04-2012', 'dd-mm-yyyy'), 115);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (116, 'miter saw', 'toolbox', to_date('26-01-2010', 'dd-mm-yyyy'), 116);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (117, 'circular saw', 'lockable cabinet', to_date('04-03-2020', 'dd-mm-yyyy'), 117);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (118, 'drill', 'shelving unit', to_date('30-12-2003', 'dd-mm-yyyy'), 118);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (119, 'multimeter', 'modular storage system', to_date('14-03-2015', 'dd-mm-yyyy'), 119);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (120, 'air compressor', 'storage tent', to_date('19-09-2003', 'dd-mm-yyyy'), 120);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (121, 'saw', 'tool belt', to_date('01-08-2004', 'dd-mm-yyyy'), 121);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (122, 'vise', 'pallet rack', to_date('11-11-2017', 'dd-mm-yyyy'), 122);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (123, 'sander', 'modular storage system', to_date('02-09-2009', 'dd-mm-yyyy'), 123);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (124, 'torque wrench', 'vehicle trunk', to_date('09-02-2002', 'dd-mm-yyyy'), 124);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (125, 'wire strippers', 'vehicle trunk', to_date('04-10-2020', 'dd-mm-yyyy'), 125);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (126, 'crowbar', 'toolbox', to_date('02-11-2018', 'dd-mm-yyyy'), 126);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (127, 'wire strippers', 'storage tent', to_date('19-09-2017', 'dd-mm-yyyy'), 127);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (128, 'crimping tool', 'modular storage system', to_date('05-05-2007', 'dd-mm-yyyy'), 128);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (129, 'caulking gun', 'storage pod', to_date('10-02-2000', 'dd-mm-yyyy'), 129);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (130, 'crimping tool', 'pallet rack', to_date('07-06-2009', 'dd-mm-yyyy'), 130);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (131, 'nut driver', 'workbench', to_date('09-09-2010', 'dd-mm-yyyy'), 131);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (132, 'torque wrench', 'storage pod', to_date('31-12-2017', 'dd-mm-yyyy'), 132);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (133, 'adjustable spanner', 'equipment shed', to_date('13-02-2020', 'dd-mm-yyyy'), 133);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (134, 'clamps', 'utility cart', to_date('15-04-2019', 'dd-mm-yyyy'), 134);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (135, 'air compressor', 'storage pod', to_date('20-05-2001', 'dd-mm-yyyy'), 135);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (136, 'screwdriver', 'tool belt', to_date('20-12-2012', 'dd-mm-yyyy'), 136);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (137, 'rivet gun', 'utility room', to_date('13-10-2007', 'dd-mm-yyyy'), 137);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (138, 'adjustable spanner', 'vehicle trunk', to_date('14-04-2023', 'dd-mm-yyyy'), 138);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (139, 'rivet gun', 'shelving unit', to_date('08-07-2012', 'dd-mm-yyyy'), 139);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (140, 'rivet gun', 'tool cabinet', to_date('14-11-2006', 'dd-mm-yyyy'), 140);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (141, 'oscillating tool', 'storage closet', to_date('23-12-2004', 'dd-mm-yyyy'), 141);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (142, 'chainsaw', 'storage bin', to_date('10-07-2002', 'dd-mm-yyyy'), 142);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (143, 'punch set', 'storage pod', to_date('17-08-2006', 'dd-mm-yyyy'), 143);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (144, 'Allen wrench (hex key)', 'storage container', to_date('17-10-2018', 'dd-mm-yyyy'), 144);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (145, 'circular saw', 'wall hooks', to_date('15-11-2019', 'dd-mm-yyyy'), 145);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (146, 'jigsaw', 'storage barn', to_date('03-12-2004', 'dd-mm-yyyy'), 146);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (147, 'hacksaw', 'basement', to_date('16-06-2013', 'dd-mm-yyyy'), 147);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (148, 'crowbar', 'equipment rack', to_date('22-09-2019', 'dd-mm-yyyy'), 148);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (149, 'pipe wrench', 'storage container', to_date('03-11-2017', 'dd-mm-yyyy'), 149);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (150, 'staple gun', 'garden shed', to_date('28-12-2019', 'dd-mm-yyyy'), 150);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (151, 'level', 'tool chest', to_date('18-01-2020', 'dd-mm-yyyy'), 151);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (152, 'nut driver', 'corner cabinet', to_date('01-08-2002', 'dd-mm-yyyy'), 152);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (153, 'level', 'pallet rack', to_date('28-12-2006', 'dd-mm-yyyy'), 153);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (154, 'clamps', 'storage closet', to_date('08-03-2020', 'dd-mm-yyyy'), 154);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (155, 'nail gun', 'job site box', to_date('02-10-2016', 'dd-mm-yyyy'), 155);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (156, 'punch set', 'corner cabinet', to_date('22-07-2010', 'dd-mm-yyyy'), 156);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (157, 'chainsaw', 'utility room', to_date('18-01-2010', 'dd-mm-yyyy'), 157);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (158, 'oscillating tool', 'storage pod', to_date('24-09-2019', 'dd-mm-yyyy'), 158);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (159, 'pliers', 'closet organizer', to_date('16-04-2018', 'dd-mm-yyyy'), 159);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (160, 'stud finder', 'equipment locker', to_date('25-09-2013', 'dd-mm-yyyy'), 160);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (161, 'pipe wrench', 'storage locker', to_date('13-09-2010', 'dd-mm-yyyy'), 161);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (162, 'wire strippers', 'corner cabinet', to_date('12-08-2007', 'dd-mm-yyyy'), 162);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (163, 'trowel', 'storage unit', to_date('16-09-2005', 'dd-mm-yyyy'), 163);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (164, 'screwdriver', 'attic', to_date('18-10-2013', 'dd-mm-yyyy'), 164);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (165, 'rivet gun', 'job site box', to_date('09-10-2016', 'dd-mm-yyyy'), 165);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (166, 'power planer', 'attic', to_date('12-07-2004', 'dd-mm-yyyy'), 166);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (167, 'tape measure', 'storage container', to_date('18-05-2007', 'dd-mm-yyyy'), 167);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (168, 'screwdriver', 'utility cart', to_date('01-12-2012', 'dd-mm-yyyy'), 168);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (169, 'laser level', 'basement', to_date('21-11-2001', 'dd-mm-yyyy'), 169);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (170, 'crimping tool', 'storage closet', to_date('21-12-2015', 'dd-mm-yyyy'), 170);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (171, 'air compressor', 'tool chest', to_date('22-12-2010', 'dd-mm-yyyy'), 171);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (172, 'punch set', 'equipment room', to_date('29-12-2020', 'dd-mm-yyyy'), 172);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (173, 'saw', 'mobile storage unit', to_date('06-01-2001', 'dd-mm-yyyy'), 173);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (174, 'multimeter', 'storage locker', to_date('04-05-2022', 'dd-mm-yyyy'), 174);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (175, 'hacksaw', 'storage locker', to_date('02-03-2009', 'dd-mm-yyyy'), 175);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (176, 'chisel', 'storage pod', to_date('13-07-2015', 'dd-mm-yyyy'), 176);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (177, 'multimeter', 'storage pod', to_date('03-09-2012', 'dd-mm-yyyy'), 177);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (178, 'stud finder', 'equipment room', to_date('06-01-2008', 'dd-mm-yyyy'), 178);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (179, 'level', 'tool belt', to_date('21-01-2004', 'dd-mm-yyyy'), 179);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (180, 'multimeter', 'basement', to_date('07-03-2016', 'dd-mm-yyyy'), 180);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (181, 'air compressor', 'tool bag', to_date('12-07-2019', 'dd-mm-yyyy'), 181);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (182, 'bench grinder', 'garden shed', to_date('09-02-2013', 'dd-mm-yyyy'), 182);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (183, 'measuring wheel', 'corner cabinet', to_date('26-01-2019', 'dd-mm-yyyy'), 183);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (184, 'soldering iron', 'pallet rack', to_date('25-11-2006', 'dd-mm-yyyy'), 184);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (185, 'shop vacuum', 'storage container', to_date('11-11-2009', 'dd-mm-yyyy'), 185);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (186, 'nut driver', 'basement', to_date('14-04-2004', 'dd-mm-yyyy'), 186);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (187, 'miter saw', 'equipment locker', to_date('28-11-2003', 'dd-mm-yyyy'), 187);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (188, 'chainsaw', 'shelving unit', to_date('09-09-2000', 'dd-mm-yyyy'), 188);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (189, 'tile cutter', 'rolling cart', to_date('13-05-2009', 'dd-mm-yyyy'), 189);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (190, 'calipers', 'utility room', to_date('11-11-2019', 'dd-mm-yyyy'), 190);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (191, 'air compressor', 'storage unit', to_date('16-08-2007', 'dd-mm-yyyy'), 191);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (192, 'pliers', 'attic', to_date('19-03-2016', 'dd-mm-yyyy'), 192);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (193, 'trowel', 'portable tool box.', to_date('25-10-2017', 'dd-mm-yyyy'), 193);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (194, 'router', 'pallet rack', to_date('30-10-2010', 'dd-mm-yyyy'), 194);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (195, 'soldering iron', 'workbench', to_date('24-09-2009', 'dd-mm-yyyy'), 195);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (196, 'trowel', 'lockable cabinet', to_date('06-05-2007', 'dd-mm-yyyy'), 196);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (197, 'Allen wrench (hex key)', 'roof rack', to_date('21-04-2017', 'dd-mm-yyyy'), 197);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (198, 'laser level', 'shelving unit', to_date('11-05-2014', 'dd-mm-yyyy'), 198);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (199, 'drill', 'utility box', to_date('21-03-2014', 'dd-mm-yyyy'), 199);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (200, 'wire strippers', 'equipment room', to_date('30-07-2010', 'dd-mm-yyyy'), 200);
commit;
prompt 200 records committed...
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (201, 'miter saw', 'tool bag', to_date('09-01-2007', 'dd-mm-yyyy'), 201);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (202, 'soldering iron', 'roof rack', to_date('01-12-2020', 'dd-mm-yyyy'), 202);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (203, 'air compressor', 'under stairs storage', to_date('07-10-2001', 'dd-mm-yyyy'), 203);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (204, 'saw', 'tool belt', to_date('23-05-2007', 'dd-mm-yyyy'), 204);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (205, 'hammer', 'rolling cart', to_date('06-07-2001', 'dd-mm-yyyy'), 205);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (206, 'shop vacuum', 'storage unit', to_date('21-06-2014', 'dd-mm-yyyy'), 206);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (207, 'sander', 'equipment room', to_date('17-09-2018', 'dd-mm-yyyy'), 207);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (208, 'angle grinder', 'garage', to_date('23-04-2020', 'dd-mm-yyyy'), 208);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (209, 'soldering iron', 'roof rack', to_date('18-11-2007', 'dd-mm-yyyy'), 209);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (210, 'pipe wrench', 'equipment rack', to_date('01-05-2018', 'dd-mm-yyyy'), 210);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (211, 'adjustable spanner', 'tool bag', to_date('12-02-2010', 'dd-mm-yyyy'), 211);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (212, 'stud finder', 'workbench', to_date('07-04-2000', 'dd-mm-yyyy'), 212);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (213, 'crimping tool', 'drawer', to_date('05-07-2003', 'dd-mm-yyyy'), 213);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (214, 'wire strippers', 'garage', to_date('09-08-2009', 'dd-mm-yyyy'), 214);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (215, 'staple gun', 'vehicle trunk', to_date('26-11-2001', 'dd-mm-yyyy'), 215);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (216, 'soldering iron', 'basement', to_date('12-11-2011', 'dd-mm-yyyy'), 216);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (217, 'shop vacuum', 'storage cage', to_date('21-05-2014', 'dd-mm-yyyy'), 217);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (218, 'utility knife', 'basement', to_date('15-04-2006', 'dd-mm-yyyy'), 218);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (219, 'nut driver', 'pegboard', to_date('29-09-2009', 'dd-mm-yyyy'), 219);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (220, 'sander', 'utility box', to_date('10-04-2020', 'dd-mm-yyyy'), 220);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (221, 'air compressor', 'utility truck', to_date('30-04-2013', 'dd-mm-yyyy'), 221);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (222, 'tile cutter', 'garden shed', to_date('19-07-2008', 'dd-mm-yyyy'), 222);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (223, 'fish tape', 'tool belt', to_date('08-07-2001', 'dd-mm-yyyy'), 223);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (224, 'Allen wrench (hex key)', 'under stairs storage', to_date('15-02-2016', 'dd-mm-yyyy'), 224);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (225, 'calipers', 'utility truck', to_date('22-04-2016', 'dd-mm-yyyy'), 225);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (226, 'chainsaw', 'vehicle trunk', to_date('25-09-2013', 'dd-mm-yyyy'), 226);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (227, 'utility knife', 'under stairs storage', to_date('31-05-2004', 'dd-mm-yyyy'), 227);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (228, 'drill', 'tool bag', to_date('27-09-2011', 'dd-mm-yyyy'), 228);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (229, 'miter saw', 'shelving unit', to_date('07-07-2011', 'dd-mm-yyyy'), 229);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (230, 'clamps', 'utility trailer', to_date('07-04-2016', 'dd-mm-yyyy'), 230);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (231, 'punch set', 'basement', to_date('14-07-2018', 'dd-mm-yyyy'), 231);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (232, 'chainsaw', 'storage barn', to_date('11-05-2004', 'dd-mm-yyyy'), 232);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (233, 'Allen wrench (hex key)', 'tool shed', to_date('23-09-2014', 'dd-mm-yyyy'), 233);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (234, 'calipers', 'garden shed', to_date('05-06-2006', 'dd-mm-yyyy'), 234);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (235, 'sander', 'storage cage', to_date('06-05-2009', 'dd-mm-yyyy'), 235);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (236, 'hacksaw', 'drawer', to_date('19-12-2007', 'dd-mm-yyyy'), 236);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (237, 'caulking gun', 'tool chest', to_date('26-08-2018', 'dd-mm-yyyy'), 237);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (238, 'jigsaw', 'toolbox', to_date('31-03-2012', 'dd-mm-yyyy'), 238);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (239, 'clamps', 'storage pod', to_date('26-09-2015', 'dd-mm-yyyy'), 239);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (240, 'miter saw', 'wall hooks', to_date('22-07-2019', 'dd-mm-yyyy'), 240);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (241, 'nail gun', 'equipment shed', to_date('08-12-2020', 'dd-mm-yyyy'), 241);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (242, 'multimeter', 'storage tent', to_date('12-02-2017', 'dd-mm-yyyy'), 242);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (243, 'torque wrench', 'equipment locker', to_date('05-03-2005', 'dd-mm-yyyy'), 243);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (244, 'utility knife', 'utility trailer', to_date('11-06-2009', 'dd-mm-yyyy'), 244);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (245, 'drill', 'hanging rack', to_date('19-05-2007', 'dd-mm-yyyy'), 245);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (246, 'router', 'storage container', to_date('08-11-2002', 'dd-mm-yyyy'), 246);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (247, 'nail gun', 'storage locker', to_date('08-06-2008', 'dd-mm-yyyy'), 247);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (248, 'drill', 'toolbox', to_date('02-01-2007', 'dd-mm-yyyy'), 248);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (249, 'hacksaw', 'portable tool box.', to_date('25-07-2014', 'dd-mm-yyyy'), 249);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (250, 'chisel', 'toolbox', to_date('20-04-2011', 'dd-mm-yyyy'), 250);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (251, 'drill', 'storage pod', to_date('08-04-2008', 'dd-mm-yyyy'), 251);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (252, 'wrench', 'storage container', to_date('21-09-2020', 'dd-mm-yyyy'), 252);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (253, 'sander', 'equipment shed', to_date('04-06-2015', 'dd-mm-yyyy'), 253);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (254, 'shop vacuum', 'pegboard', to_date('08-09-2002', 'dd-mm-yyyy'), 254);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (255, 'router', 'hanging rack', to_date('28-07-2005', 'dd-mm-yyyy'), 255);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (256, 'chisel', 'storage bin', to_date('21-03-2021', 'dd-mm-yyyy'), 256);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (257, 'calipers', 'utility room', to_date('12-12-2005', 'dd-mm-yyyy'), 257);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (258, 'circular saw', 'roof rack', to_date('07-06-2020', 'dd-mm-yyyy'), 258);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (259, 'socket set', 'storage unit', to_date('14-08-2015', 'dd-mm-yyyy'), 259);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (260, 'punch set', 'utility room', to_date('06-03-2004', 'dd-mm-yyyy'), 260);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (261, 'fish tape', 'equipment locker', to_date('29-02-2000', 'dd-mm-yyyy'), 261);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (262, 'adjustable spanner', 'hanging rack', to_date('06-06-2017', 'dd-mm-yyyy'), 262);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (263, 'socket set', 'closet organizer', to_date('01-11-2018', 'dd-mm-yyyy'), 263);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (264, 'oscillating tool', 'mobile storage unit', to_date('08-03-2011', 'dd-mm-yyyy'), 264);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (265, 'sander', 'utility trailer', to_date('17-05-2009', 'dd-mm-yyyy'), 265);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (266, 'stud finder', 'tool bag', to_date('11-09-2010', 'dd-mm-yyyy'), 266);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (267, 'miter saw', 'utility truck', to_date('21-09-2017', 'dd-mm-yyyy'), 267);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (268, 'calipers', 'tool bag', to_date('22-08-2016', 'dd-mm-yyyy'), 268);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (269, 'pliers', 'utility truck', to_date('15-02-2015', 'dd-mm-yyyy'), 269);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (270, 'nail gun', 'storage container', to_date('17-01-2004', 'dd-mm-yyyy'), 270);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (271, 'socket set', 'attic', to_date('15-11-2018', 'dd-mm-yyyy'), 271);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (272, 'adjustable spanner', 'job site box', to_date('03-02-2006', 'dd-mm-yyyy'), 272);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (273, 'heat gun', 'tool bag', to_date('04-11-2023', 'dd-mm-yyyy'), 273);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (274, 'utility knife', 'lockable cabinet', to_date('30-03-2019', 'dd-mm-yyyy'), 274);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (275, 'multimeter', 'utility truck', to_date('19-12-2006', 'dd-mm-yyyy'), 275);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (276, 'adjustable spanner', 'equipment shed', to_date('08-02-2021', 'dd-mm-yyyy'), 276);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (277, 'wire strippers', 'tool belt', to_date('26-02-2007', 'dd-mm-yyyy'), 277);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (278, 'chainsaw', 'tool shed', to_date('22-09-2001', 'dd-mm-yyyy'), 278);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (279, 'hacksaw', 'roof rack', to_date('24-11-2007', 'dd-mm-yyyy'), 279);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (280, 'jigsaw', 'rolling cart', to_date('13-05-2000', 'dd-mm-yyyy'), 280);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (281, 'trowel', 'roof rack', to_date('27-05-2021', 'dd-mm-yyyy'), 281);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (282, 'wire strippers', 'tool shed', to_date('18-10-2001', 'dd-mm-yyyy'), 282);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (283, 'torque wrench', 'utility trailer', to_date('06-08-2005', 'dd-mm-yyyy'), 283);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (284, 'router', 'drawer', to_date('13-03-2002', 'dd-mm-yyyy'), 284);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (285, 'level', 'attic', to_date('02-01-2008', 'dd-mm-yyyy'), 285);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (286, 'shop vacuum', 'storage pod', to_date('30-07-2022', 'dd-mm-yyyy'), 286);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (287, 'calipers', 'workbench', to_date('10-03-2015', 'dd-mm-yyyy'), 287);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (288, 'drill', 'storage tent', to_date('04-07-2021', 'dd-mm-yyyy'), 288);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (289, 'hammer', 'under stairs storage', to_date('05-08-2015', 'dd-mm-yyyy'), 289);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (290, 'vise', 'shelving unit', to_date('14-04-2020', 'dd-mm-yyyy'), 290);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (291, 'saw', 'cabinet', to_date('06-09-2016', 'dd-mm-yyyy'), 291);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (292, 'screwdriver', 'cabinet', to_date('13-09-2022', 'dd-mm-yyyy'), 292);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (293, 'nail gun', 'equipment rack', to_date('21-02-2019', 'dd-mm-yyyy'), 293);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (294, 'drill', 'workbench', to_date('28-04-2016', 'dd-mm-yyyy'), 294);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (295, 'router', 'storage cage', to_date('12-07-2015', 'dd-mm-yyyy'), 295);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (296, 'vise', 'workbench', to_date('15-02-2018', 'dd-mm-yyyy'), 296);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (297, 'router', 'equipment room', to_date('08-07-2016', 'dd-mm-yyyy'), 297);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (298, 'stud finder', 'utility room', to_date('30-11-2020', 'dd-mm-yyyy'), 298);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (299, 'saw', 'shelving unit', to_date('07-11-2018', 'dd-mm-yyyy'), 299);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (300, 'power planer', 'storage closet', to_date('16-07-2003', 'dd-mm-yyyy'), 300);
commit;
prompt 300 records committed...
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (301, 'screwdriver', 'roof rack', to_date('09-11-2000', 'dd-mm-yyyy'), 301);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (302, 'screwdriver', 'storage pod', to_date('25-10-2005', 'dd-mm-yyyy'), 302);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (303, 'level', 'tool cabinet', to_date('17-05-2012', 'dd-mm-yyyy'), 303);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (304, 'socket set', 'storage bin', to_date('14-05-2003', 'dd-mm-yyyy'), 304);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (305, 'adjustable spanner', 'vehicle trunk', to_date('07-09-2017', 'dd-mm-yyyy'), 305);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (306, 'fish tape', 'utility trailer', to_date('27-08-2000', 'dd-mm-yyyy'), 306);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (307, 'jigsaw', 'storage container', to_date('21-11-2004', 'dd-mm-yyyy'), 307);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (308, 'torque wrench', 'garage', to_date('06-12-2000', 'dd-mm-yyyy'), 308);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (309, 'pipe wrench', 'hanging rack', to_date('25-12-2013', 'dd-mm-yyyy'), 309);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (310, 'hammer', 'storage barn', to_date('28-05-2006', 'dd-mm-yyyy'), 310);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (311, 'adjustable spanner', 'hanging rack', to_date('11-10-2019', 'dd-mm-yyyy'), 311);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (312, 'nut driver', 'storage cage', to_date('04-07-2018', 'dd-mm-yyyy'), 312);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (313, 'vise', 'pegboard', to_date('21-07-2014', 'dd-mm-yyyy'), 313);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (314, 'air compressor', 'corner cabinet', to_date('17-12-2005', 'dd-mm-yyyy'), 314);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (315, 'saw', 'equipment shed', to_date('14-10-2015', 'dd-mm-yyyy'), 315);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (316, 'clamps', 'modular storage system', to_date('03-08-2013', 'dd-mm-yyyy'), 316);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (317, 'utility knife', 'portable tool box.', to_date('19-06-2006', 'dd-mm-yyyy'), 317);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (318, 'socket set', 'pallet rack', to_date('19-05-2019', 'dd-mm-yyyy'), 318);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (319, 'tile cutter', 'storage locker', to_date('24-07-2015', 'dd-mm-yyyy'), 319);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (320, 'chisel', 'equipment room', to_date('30-05-2013', 'dd-mm-yyyy'), 320);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (321, 'level', 'utility room', to_date('21-06-2006', 'dd-mm-yyyy'), 321);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (322, 'multimeter', 'closet organizer', to_date('07-02-2012', 'dd-mm-yyyy'), 322);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (323, 'drill', 'utility truck', to_date('22-12-2000', 'dd-mm-yyyy'), 323);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (324, 'heat gun', 'utility trailer', to_date('31-01-2021', 'dd-mm-yyyy'), 324);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (325, 'tile cutter', 'portable tool box.', to_date('02-08-2018', 'dd-mm-yyyy'), 325);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (326, 'punch set', 'storage closet', to_date('28-09-2002', 'dd-mm-yyyy'), 326);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (327, 'angle grinder', 'toolbox', to_date('27-11-2010', 'dd-mm-yyyy'), 327);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (328, 'air compressor', 'portable tool box.', to_date('04-08-2006', 'dd-mm-yyyy'), 328);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (329, 'clamps', 'storage bin', to_date('04-03-2006', 'dd-mm-yyyy'), 329);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (330, 'shop vacuum', 'storage locker', to_date('19-08-2021', 'dd-mm-yyyy'), 330);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (331, 'soldering iron', 'toolbox', to_date('12-08-2012', 'dd-mm-yyyy'), 331);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (332, 'torque wrench', 'cabinet', to_date('11-09-2011', 'dd-mm-yyyy'), 332);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (333, 'tile cutter', 'shelving unit', to_date('25-10-2008', 'dd-mm-yyyy'), 333);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (334, 'router', 'utility room', to_date('25-09-2012', 'dd-mm-yyyy'), 334);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (335, 'hacksaw', 'storage tent', to_date('27-08-2018', 'dd-mm-yyyy'), 335);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (336, 'trowel', 'closet organizer', to_date('21-01-2017', 'dd-mm-yyyy'), 336);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (337, 'rivet gun', 'storage tent', to_date('19-06-2008', 'dd-mm-yyyy'), 337);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (338, 'wrench', 'pallet rack', to_date('20-04-2019', 'dd-mm-yyyy'), 338);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (339, 'chisel', 'equipment locker', to_date('16-05-2008', 'dd-mm-yyyy'), 339);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (340, 'air compressor', 'equipment shed', to_date('17-10-2023', 'dd-mm-yyyy'), 340);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (341, 'angle grinder', 'storage barn', to_date('09-08-2001', 'dd-mm-yyyy'), 341);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (342, 'Allen wrench (hex key)', 'storage container', to_date('16-05-2008', 'dd-mm-yyyy'), 342);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (343, 'trowel', 'storage pod', to_date('30-01-2017', 'dd-mm-yyyy'), 343);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (344, 'adjustable spanner', 'storage tent', to_date('09-10-2009', 'dd-mm-yyyy'), 344);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (345, 'angle grinder', 'wall hooks', to_date('04-11-2014', 'dd-mm-yyyy'), 345);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (346, 'power planer', 'equipment room', to_date('23-12-2000', 'dd-mm-yyyy'), 346);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (347, 'level', 'workshop', to_date('15-06-2012', 'dd-mm-yyyy'), 347);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (348, 'calipers', 'workbench', to_date('13-06-2007', 'dd-mm-yyyy'), 348);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (349, 'stud finder', 'storage tent', to_date('23-11-2000', 'dd-mm-yyyy'), 349);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (350, 'multimeter', 'mobile storage unit', to_date('11-03-2020', 'dd-mm-yyyy'), 350);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (351, 'crowbar', 'equipment locker', to_date('12-11-2005', 'dd-mm-yyyy'), 351);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (352, 'pipe wrench', 'tool cabinet', to_date('16-12-2023', 'dd-mm-yyyy'), 352);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (353, 'vise', 'shelving unit', to_date('06-04-2017', 'dd-mm-yyyy'), 353);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (354, 'vise', 'storage closet', to_date('21-02-2004', 'dd-mm-yyyy'), 354);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (355, 'angle grinder', 'tool chest', to_date('27-01-2006', 'dd-mm-yyyy'), 355);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (356, 'tape measure', 'utility box', to_date('09-12-2013', 'dd-mm-yyyy'), 356);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (357, 'power planer', 'attic', to_date('10-12-2007', 'dd-mm-yyyy'), 357);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (358, 'trowel', 'utility room', to_date('21-02-2006', 'dd-mm-yyyy'), 358);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (359, 'fish tape', 'equipment rack', to_date('25-02-2009', 'dd-mm-yyyy'), 359);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (360, 'rivet gun', 'storage locker', to_date('06-09-2000', 'dd-mm-yyyy'), 360);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (361, 'pipe wrench', 'roof rack', to_date('17-09-2013', 'dd-mm-yyyy'), 361);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (362, 'fish tape', 'tool shed', to_date('08-12-2018', 'dd-mm-yyyy'), 362);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (363, 'saw', 'corner cabinet', to_date('31-10-2006', 'dd-mm-yyyy'), 363);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (364, 'pipe wrench', 'storage bin', to_date('26-12-2011', 'dd-mm-yyyy'), 364);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (365, 'caulking gun', 'utility truck', to_date('22-06-2022', 'dd-mm-yyyy'), 365);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (366, 'screwdriver', 'tool shed', to_date('18-05-2023', 'dd-mm-yyyy'), 366);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (367, 'fish tape', 'utility trailer', to_date('25-07-2001', 'dd-mm-yyyy'), 367);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (368, 'clamps', 'storage bin', to_date('29-11-2010', 'dd-mm-yyyy'), 368);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (369, 'adjustable spanner', 'shelving unit', to_date('06-02-2007', 'dd-mm-yyyy'), 369);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (370, 'measuring wheel', 'tool cabinet', to_date('27-08-2021', 'dd-mm-yyyy'), 370);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (371, 'oscillating tool', 'garage', to_date('07-09-2022', 'dd-mm-yyyy'), 371);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (372, 'multimeter', 'basement', to_date('07-10-2007', 'dd-mm-yyyy'), 372);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (373, 'stud finder', 'storage bin', to_date('31-01-2003', 'dd-mm-yyyy'), 373);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (374, 'crowbar', 'storage barn', to_date('15-08-2014', 'dd-mm-yyyy'), 374);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (375, 'measuring wheel', 'utility cart', to_date('29-01-2023', 'dd-mm-yyyy'), 375);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (376, 'tile cutter', 'storage bin', to_date('25-07-2013', 'dd-mm-yyyy'), 376);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (377, 'shop vacuum', 'cabinet', to_date('29-09-2011', 'dd-mm-yyyy'), 377);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (378, 'calipers', 'utility room', to_date('27-09-2009', 'dd-mm-yyyy'), 378);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (379, 'wrench', 'under stairs storage', to_date('10-05-2001', 'dd-mm-yyyy'), 379);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (380, 'wire strippers', 'storage unit', to_date('01-04-2009', 'dd-mm-yyyy'), 380);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (381, 'calipers', 'workshop', to_date('05-06-2004', 'dd-mm-yyyy'), 381);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (382, 'fish tape', 'wall hooks', to_date('25-02-2007', 'dd-mm-yyyy'), 382);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (383, 'miter saw', 'storage pod', to_date('10-06-2023', 'dd-mm-yyyy'), 383);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (384, 'utility knife', 'utility room', to_date('22-01-2014', 'dd-mm-yyyy'), 384);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (385, 'caulking gun', 'storage pod', to_date('10-01-2019', 'dd-mm-yyyy'), 385);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (386, 'calipers', 'workbench', to_date('08-02-2014', 'dd-mm-yyyy'), 386);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (387, 'fish tape', 'equipment shed', to_date('11-01-2017', 'dd-mm-yyyy'), 387);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (388, 'fish tape', 'wall hooks', to_date('27-02-2004', 'dd-mm-yyyy'), 388);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (389, 'crowbar', 'cabinet', to_date('13-08-2007', 'dd-mm-yyyy'), 389);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (390, 'drill', 'utility box', to_date('13-02-2023', 'dd-mm-yyyy'), 390);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (391, 'nail gun', 'attic', to_date('04-05-2016', 'dd-mm-yyyy'), 391);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (392, 'level', 'modular storage system', to_date('01-11-2018', 'dd-mm-yyyy'), 392);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (393, 'miter saw', 'equipment shed', to_date('22-12-2018', 'dd-mm-yyyy'), 393);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (394, 'nut driver', 'wall hooks', to_date('05-04-2016', 'dd-mm-yyyy'), 394);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (395, 'crimping tool', 'toolbox', to_date('03-04-2017', 'dd-mm-yyyy'), 395);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (396, 'adjustable spanner', 'utility box', to_date('10-01-2024', 'dd-mm-yyyy'), 396);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (397, 'soldering iron', 'drawer', to_date('02-03-2024', 'dd-mm-yyyy'), 397);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (398, 'rivet gun', 'mobile storage unit', to_date('14-07-2015', 'dd-mm-yyyy'), 398);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (399, 'pipe wrench', 'storage barn', to_date('21-06-2011', 'dd-mm-yyyy'), 399);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (400, 'chainsaw', 'tool cabinet', to_date('15-06-2003', 'dd-mm-yyyy'), 400);
commit;
prompt 400 records committed...
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (401, 'tape measure', 'shelving unit', to_date('24-03-2005', 'dd-mm-yyyy'), 401);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (402, 'screwdriver', 'vehicle trunk', to_date('04-01-2012', 'dd-mm-yyyy'), 402);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (403, 'vise', 'cabinet', to_date('28-07-2000', 'dd-mm-yyyy'), 403);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (404, 'tile cutter', 'attic', to_date('16-04-2004', 'dd-mm-yyyy'), 404);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (405, 'shop vacuum', 'storage cage', to_date('30-01-2014', 'dd-mm-yyyy'), 405);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (406, 'rivet gun', 'cabinet', to_date('07-06-2023', 'dd-mm-yyyy'), 406);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (407, 'pipe wrench', 'pegboard', to_date('22-07-2014', 'dd-mm-yyyy'), 407);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (408, 'adjustable spanner', 'cabinet', to_date('06-04-2015', 'dd-mm-yyyy'), 408);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (409, 'clamps', 'toolbox', to_date('25-09-2011', 'dd-mm-yyyy'), 409);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (410, 'tape measure', 'equipment shed', to_date('19-02-2004', 'dd-mm-yyyy'), 410);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (411, 'bench grinder', 'equipment room', to_date('02-05-2020', 'dd-mm-yyyy'), 411);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (412, 'wrench', 'equipment room', to_date('28-08-2020', 'dd-mm-yyyy'), 412);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (413, 'wire strippers', 'storage barn', to_date('17-11-2004', 'dd-mm-yyyy'), 413);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (414, 'heat gun', 'utility room', to_date('28-02-2014', 'dd-mm-yyyy'), 414);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (415, 'calipers', 'tool cabinet', to_date('17-11-2022', 'dd-mm-yyyy'), 415);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (416, 'jigsaw', 'drawer', to_date('05-08-2023', 'dd-mm-yyyy'), 416);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (417, 'pipe wrench', 'pallet rack', to_date('26-11-2011', 'dd-mm-yyyy'), 417);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (418, 'shop vacuum', 'vehicle trunk', to_date('11-10-2020', 'dd-mm-yyyy'), 418);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (419, 'utility knife', 'lockable cabinet', to_date('28-09-2014', 'dd-mm-yyyy'), 419);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (420, 'wrench', 'utility room', to_date('07-02-2007', 'dd-mm-yyyy'), 420);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (421, 'staple gun', 'wall hooks', to_date('09-08-2000', 'dd-mm-yyyy'), 421);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (422, 'shop vacuum', 'shelving unit', to_date('22-05-2017', 'dd-mm-yyyy'), 422);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (423, 'pliers', 'portable tool box.', to_date('01-04-2016', 'dd-mm-yyyy'), 423);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (424, 'nail gun', 'toolbox', to_date('08-04-2001', 'dd-mm-yyyy'), 424);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (425, 'pliers', 'job site box', to_date('18-10-2018', 'dd-mm-yyyy'), 425);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (426, 'crimping tool', 'utility room', to_date('26-05-2014', 'dd-mm-yyyy'), 426);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (427, 'vise', 'attic', to_date('19-03-2019', 'dd-mm-yyyy'), 427);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (428, 'measuring wheel', 'attic', to_date('12-06-2019', 'dd-mm-yyyy'), 428);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (429, 'drill', 'tool belt', to_date('16-04-2019', 'dd-mm-yyyy'), 429);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (430, 'multimeter', 'basement', to_date('06-10-2018', 'dd-mm-yyyy'), 430);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (431, 'adjustable spanner', 'tool belt', to_date('03-01-2016', 'dd-mm-yyyy'), 431);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (432, 'punch set', 'vehicle trunk', to_date('22-08-2019', 'dd-mm-yyyy'), 432);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (433, 'router', 'pallet rack', to_date('02-08-2023', 'dd-mm-yyyy'), 433);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (434, 'angle grinder', 'workshop', to_date('05-02-2004', 'dd-mm-yyyy'), 434);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (435, 'utility knife', 'tool chest', to_date('16-07-2011', 'dd-mm-yyyy'), 435);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (436, 'level', 'portable tool box.', to_date('29-09-2004', 'dd-mm-yyyy'), 436);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (437, 'sander', 'garden shed', to_date('10-01-2017', 'dd-mm-yyyy'), 437);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (438, 'crowbar', 'pegboard', to_date('24-03-2000', 'dd-mm-yyyy'), 438);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (439, 'chainsaw', 'utility room', to_date('22-07-2018', 'dd-mm-yyyy'), 439);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (440, 'nut driver', 'attic', to_date('30-09-2018', 'dd-mm-yyyy'), 440);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (441, 'staple gun', 'wall hooks', to_date('05-02-2014', 'dd-mm-yyyy'), 441);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (442, 'chisel', 'tool chest', to_date('11-10-2001', 'dd-mm-yyyy'), 442);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (443, 'oscillating tool', 'workbench', to_date('20-06-2018', 'dd-mm-yyyy'), 443);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (444, 'nail gun', 'storage closet', to_date('17-07-2019', 'dd-mm-yyyy'), 444);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (445, 'Allen wrench (hex key)', 'tool chest', to_date('10-02-2013', 'dd-mm-yyyy'), 445);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (446, 'vise', 'hanging rack', to_date('24-12-2005', 'dd-mm-yyyy'), 446);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (447, 'tape measure', 'mobile storage unit', to_date('10-02-2021', 'dd-mm-yyyy'), 447);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (448, 'nail gun', 'lockable cabinet', to_date('18-02-2002', 'dd-mm-yyyy'), 448);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (449, 'air compressor', 'corner cabinet', to_date('11-12-2000', 'dd-mm-yyyy'), 449);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (450, 'nail gun', 'attic', to_date('22-05-2012', 'dd-mm-yyyy'), 450);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (451, 'sander', 'drawer', to_date('19-02-2000', 'dd-mm-yyyy'), 451);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (452, 'crimping tool', 'storage closet', to_date('01-04-2002', 'dd-mm-yyyy'), 452);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (453, 'crimping tool', 'drawer', to_date('20-01-2005', 'dd-mm-yyyy'), 453);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (454, 'pliers', 'tool shed', to_date('10-07-2016', 'dd-mm-yyyy'), 454);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (455, 'stud finder', 'toolbox', to_date('23-09-2018', 'dd-mm-yyyy'), 455);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (456, 'nail gun', 'rolling cart', to_date('12-06-2003', 'dd-mm-yyyy'), 456);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (457, 'multimeter', 'storage bin', to_date('04-11-2002', 'dd-mm-yyyy'), 457);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (458, 'socket set', 'portable tool box.', to_date('04-07-2011', 'dd-mm-yyyy'), 458);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (459, 'measuring wheel', 'equipment locker', to_date('23-02-2020', 'dd-mm-yyyy'), 459);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (460, 'staple gun', 'hanging rack', to_date('13-08-2018', 'dd-mm-yyyy'), 460);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (461, 'laser level', 'utility truck', to_date('02-02-2012', 'dd-mm-yyyy'), 461);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (462, 'circular saw', 'tool cabinet', to_date('29-08-2017', 'dd-mm-yyyy'), 462);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (463, 'stud finder', 'toolbox', to_date('16-12-2020', 'dd-mm-yyyy'), 463);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (464, 'tape measure', 'tool shed', to_date('18-04-2018', 'dd-mm-yyyy'), 464);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (465, 'Allen wrench (hex key)', 'storage cage', to_date('13-04-2015', 'dd-mm-yyyy'), 465);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (466, 'adjustable spanner', 'basement', to_date('06-02-2021', 'dd-mm-yyyy'), 466);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (467, 'wrench', 'modular storage system', to_date('09-01-2000', 'dd-mm-yyyy'), 467);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (468, 'trowel', 'rolling cart', to_date('20-12-2012', 'dd-mm-yyyy'), 468);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (469, 'chisel', 'tool belt', to_date('26-04-2005', 'dd-mm-yyyy'), 469);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (470, 'vise', 'roof rack', to_date('24-08-2022', 'dd-mm-yyyy'), 470);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (471, 'wrench', 'utility box', to_date('24-08-2015', 'dd-mm-yyyy'), 471);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (472, 'air compressor', 'lockable cabinet', to_date('29-03-2022', 'dd-mm-yyyy'), 472);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (473, 'miter saw', 'attic', to_date('16-12-2010', 'dd-mm-yyyy'), 473);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (474, 'chainsaw', 'utility room', to_date('16-08-2017', 'dd-mm-yyyy'), 474);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (475, 'pipe wrench', 'pegboard', to_date('09-02-2001', 'dd-mm-yyyy'), 475);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (476, 'vise', 'rolling cart', to_date('26-04-2008', 'dd-mm-yyyy'), 476);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (477, 'crowbar', 'tool chest', to_date('07-09-2014', 'dd-mm-yyyy'), 477);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (478, 'tile cutter', 'closet organizer', to_date('24-04-2023', 'dd-mm-yyyy'), 478);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (479, 'wire strippers', 'equipment rack', to_date('11-09-2000', 'dd-mm-yyyy'), 479);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (480, 'air compressor', 'basement', to_date('25-05-2002', 'dd-mm-yyyy'), 480);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (481, 'circular saw', 'equipment locker', to_date('23-04-2020', 'dd-mm-yyyy'), 481);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (482, 'miter saw', 'equipment rack', to_date('20-10-2010', 'dd-mm-yyyy'), 482);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (483, 'nail gun', 'equipment locker', to_date('05-05-2018', 'dd-mm-yyyy'), 483);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (484, 'fish tape', 'hanging rack', to_date('17-09-2005', 'dd-mm-yyyy'), 484);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (485, 'chisel', 'basement', to_date('11-09-2001', 'dd-mm-yyyy'), 485);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (486, 'chisel', 'garden shed', to_date('25-03-2015', 'dd-mm-yyyy'), 486);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (487, 'staple gun', 'storage container', to_date('02-05-2011', 'dd-mm-yyyy'), 487);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (488, 'oscillating tool', 'vehicle trunk', to_date('14-08-2002', 'dd-mm-yyyy'), 488);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (489, 'sander', 'workshop', to_date('14-12-2001', 'dd-mm-yyyy'), 489);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (490, 'crowbar', 'equipment room', to_date('29-01-2003', 'dd-mm-yyyy'), 490);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (491, 'saw', 'storage container', to_date('02-04-2011', 'dd-mm-yyyy'), 491);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (492, 'hacksaw', 'job site box', to_date('07-02-2018', 'dd-mm-yyyy'), 492);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (493, 'multimeter', 'modular storage system', to_date('08-09-2005', 'dd-mm-yyyy'), 493);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (494, 'tile cutter', 'corner cabinet', to_date('20-03-2000', 'dd-mm-yyyy'), 494);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (495, 'calipers', 'tool bag', to_date('29-11-2021', 'dd-mm-yyyy'), 495);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (496, 'angle grinder', 'workshop', to_date('15-01-2013', 'dd-mm-yyyy'), 496);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (497, 'tape measure', 'storage closet', to_date('14-11-2010', 'dd-mm-yyyy'), 497);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (498, 'nail gun', 'equipment room', to_date('07-02-2023', 'dd-mm-yyyy'), 498);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (499, 'jigsaw', 'tool belt', to_date('11-01-2003', 'dd-mm-yyyy'), 499);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (500, 'circular saw', 'utility trailer', to_date('01-02-2021', 'dd-mm-yyyy'), 500);
commit;
prompt 500 records committed...
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (501, 'angle grinder', 'storage bin', to_date('23-06-2007', 'dd-mm-yyyy'), 501);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (502, 'screwdriver', 'shelving unit', to_date('18-07-2014', 'dd-mm-yyyy'), 502);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (503, 'drill', 'tool chest', to_date('18-06-2012', 'dd-mm-yyyy'), 503);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (504, 'hacksaw', 'storage barn', to_date('20-04-2018', 'dd-mm-yyyy'), 504);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (505, 'air compressor', 'tool shed', to_date('07-06-2011', 'dd-mm-yyyy'), 505);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (506, 'oscillating tool', 'storage container', to_date('20-08-2015', 'dd-mm-yyyy'), 506);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (507, 'torque wrench', 'tool shed', to_date('30-09-2005', 'dd-mm-yyyy'), 507);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (508, 'soldering iron', 'storage unit', to_date('22-12-2013', 'dd-mm-yyyy'), 508);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (509, 'laser level', 'lockable cabinet', to_date('10-03-2018', 'dd-mm-yyyy'), 509);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (510, 'measuring wheel', 'equipment locker', to_date('13-07-2013', 'dd-mm-yyyy'), 510);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (511, 'oscillating tool', 'job site box', to_date('10-07-2006', 'dd-mm-yyyy'), 511);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (512, 'nail gun', 'rolling cart', to_date('28-12-2010', 'dd-mm-yyyy'), 512);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (513, 'angle grinder', 'storage container', to_date('30-04-2012', 'dd-mm-yyyy'), 513);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (514, 'utility knife', 'tool shed', to_date('18-02-2023', 'dd-mm-yyyy'), 514);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (515, 'rivet gun', 'tool bag', to_date('09-08-2013', 'dd-mm-yyyy'), 515);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (516, 'oscillating tool', 'storage bin', to_date('25-11-2021', 'dd-mm-yyyy'), 516);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (517, 'socket set', 'under stairs storage', to_date('26-05-2006', 'dd-mm-yyyy'), 517);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (518, 'power planer', 'lockable cabinet', to_date('11-09-2023', 'dd-mm-yyyy'), 518);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (519, 'multimeter', 'tool bag', to_date('12-09-2007', 'dd-mm-yyyy'), 519);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (520, 'pipe wrench', 'storage bin', to_date('24-09-2018', 'dd-mm-yyyy'), 520);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (521, 'clamps', 'storage cage', to_date('11-08-2015', 'dd-mm-yyyy'), 521);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (522, 'wrench', 'tool chest', to_date('01-03-2006', 'dd-mm-yyyy'), 522);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (523, 'chisel', 'workbench', to_date('01-11-2015', 'dd-mm-yyyy'), 523);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (524, 'router', 'equipment rack', to_date('08-11-2014', 'dd-mm-yyyy'), 524);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (525, 'jigsaw', 'lockable cabinet', to_date('27-01-2002', 'dd-mm-yyyy'), 525);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (526, 'tape measure', 'toolbox', to_date('13-03-2006', 'dd-mm-yyyy'), 526);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (527, 'wire strippers', 'modular storage system', to_date('04-04-2004', 'dd-mm-yyyy'), 527);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (528, 'angle grinder', 'tool bag', to_date('30-11-2023', 'dd-mm-yyyy'), 528);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (529, 'level', 'toolbox', to_date('24-08-2021', 'dd-mm-yyyy'), 529);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (530, 'socket set', 'tool shed', to_date('24-10-2003', 'dd-mm-yyyy'), 530);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (531, 'saw', 'storage barn', to_date('17-01-2005', 'dd-mm-yyyy'), 531);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (532, 'oscillating tool', 'utility box', to_date('08-07-2009', 'dd-mm-yyyy'), 532);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (533, 'sander', 'closet organizer', to_date('18-08-2014', 'dd-mm-yyyy'), 533);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (534, 'socket set', 'storage closet', to_date('29-12-2011', 'dd-mm-yyyy'), 534);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (535, 'level', 'storage locker', to_date('16-07-2017', 'dd-mm-yyyy'), 535);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (536, 'level', 'storage cage', to_date('26-12-2017', 'dd-mm-yyyy'), 536);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (537, 'measuring wheel', 'storage bin', to_date('16-06-2017', 'dd-mm-yyyy'), 537);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (538, 'rivet gun', 'storage locker', to_date('23-06-2005', 'dd-mm-yyyy'), 538);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (539, 'crimping tool', 'storage closet', to_date('30-03-2005', 'dd-mm-yyyy'), 539);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (540, 'heat gun', 'under stairs storage', to_date('04-07-2015', 'dd-mm-yyyy'), 540);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (541, 'adjustable spanner', 'storage tent', to_date('29-11-2006', 'dd-mm-yyyy'), 541);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (542, 'tape measure', 'corner cabinet', to_date('22-02-2024', 'dd-mm-yyyy'), 542);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (543, 'drill', 'basement', to_date('27-09-2000', 'dd-mm-yyyy'), 543);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (544, 'soldering iron', 'vehicle trunk', to_date('08-12-2020', 'dd-mm-yyyy'), 544);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (545, 'level', 'utility cart', to_date('22-12-2020', 'dd-mm-yyyy'), 545);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (546, 'nut driver', 'storage barn', to_date('04-08-2017', 'dd-mm-yyyy'), 546);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (547, 'saw', 'workbench', to_date('01-10-2022', 'dd-mm-yyyy'), 547);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (548, 'calipers', 'cabinet', to_date('01-05-2019', 'dd-mm-yyyy'), 548);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (549, 'pipe wrench', 'storage bin', to_date('23-10-2021', 'dd-mm-yyyy'), 549);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (550, 'fish tape', 'utility truck', to_date('30-03-2019', 'dd-mm-yyyy'), 550);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (551, 'circular saw', 'drawer', to_date('02-05-2023', 'dd-mm-yyyy'), 551);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (552, 'wire strippers', 'storage closet', to_date('12-09-2017', 'dd-mm-yyyy'), 552);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (553, 'wire strippers', 'pegboard', to_date('10-12-2011', 'dd-mm-yyyy'), 553);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (554, 'level', 'equipment room', to_date('21-12-2010', 'dd-mm-yyyy'), 554);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (555, 'oscillating tool', 'pallet rack', to_date('12-10-2016', 'dd-mm-yyyy'), 555);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (556, 'measuring wheel', 'toolbox', to_date('09-03-2006', 'dd-mm-yyyy'), 556);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (557, 'miter saw', 'equipment shed', to_date('04-02-2002', 'dd-mm-yyyy'), 557);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (558, 'saw', 'tool cabinet', to_date('17-03-2006', 'dd-mm-yyyy'), 558);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (559, 'angle grinder', 'pegboard', to_date('19-09-2015', 'dd-mm-yyyy'), 559);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (560, 'tape measure', 'pegboard', to_date('02-11-2004', 'dd-mm-yyyy'), 560);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (561, 'soldering iron', 'storage container', to_date('13-06-2015', 'dd-mm-yyyy'), 561);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (562, 'power planer', 'roof rack', to_date('30-09-2014', 'dd-mm-yyyy'), 562);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (563, 'fish tape', 'portable tool box.', to_date('04-08-2010', 'dd-mm-yyyy'), 563);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (564, 'power planer', 'storage closet', to_date('03-07-2019', 'dd-mm-yyyy'), 564);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (565, 'screwdriver', 'utility cart', to_date('03-09-2004', 'dd-mm-yyyy'), 565);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (566, 'chainsaw', 'tool shed', to_date('14-03-2018', 'dd-mm-yyyy'), 566);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (567, 'drill', 'storage unit', to_date('09-02-2017', 'dd-mm-yyyy'), 567);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (568, 'chainsaw', 'pallet rack', to_date('09-07-2002', 'dd-mm-yyyy'), 568);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (569, 'saw', 'vehicle trunk', to_date('19-10-2023', 'dd-mm-yyyy'), 569);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (570, 'soldering iron', 'storage barn', to_date('14-05-2018', 'dd-mm-yyyy'), 570);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (571, 'miter saw', 'storage pod', to_date('03-08-2004', 'dd-mm-yyyy'), 571);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (572, 'pliers', 'drawer', to_date('20-06-2016', 'dd-mm-yyyy'), 572);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (573, 'bench grinder', 'lockable cabinet', to_date('13-05-2011', 'dd-mm-yyyy'), 573);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (574, 'air compressor', 'basement', to_date('29-04-2009', 'dd-mm-yyyy'), 574);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (575, 'saw', 'wall hooks', to_date('04-11-2007', 'dd-mm-yyyy'), 575);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (576, 'tile cutter', 'garden shed', to_date('04-07-2007', 'dd-mm-yyyy'), 576);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (577, 'wire strippers', 'drawer', to_date('05-08-2022', 'dd-mm-yyyy'), 577);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (578, 'measuring wheel', 'tool bag', to_date('11-03-2020', 'dd-mm-yyyy'), 578);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (579, 'adjustable spanner', 'tool bag', to_date('21-11-2005', 'dd-mm-yyyy'), 579);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (580, 'stud finder', 'storage unit', to_date('28-02-2003', 'dd-mm-yyyy'), 580);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (581, 'punch set', 'modular storage system', to_date('05-03-2013', 'dd-mm-yyyy'), 581);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (582, 'wrench', 'tool cabinet', to_date('12-11-2018', 'dd-mm-yyyy'), 582);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (583, 'bench grinder', 'tool belt', to_date('09-02-2003', 'dd-mm-yyyy'), 583);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (584, 'tile cutter', 'equipment room', to_date('18-02-2008', 'dd-mm-yyyy'), 584);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (585, 'tape measure', 'storage unit', to_date('31-03-2000', 'dd-mm-yyyy'), 585);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (586, 'heat gun', 'toolbox', to_date('28-01-2005', 'dd-mm-yyyy'), 586);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (587, 'circular saw', 'storage bin', to_date('28-11-2004', 'dd-mm-yyyy'), 587);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (588, 'circular saw', 'utility truck', to_date('27-12-2013', 'dd-mm-yyyy'), 588);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (589, 'torque wrench', 'storage unit', to_date('23-06-2005', 'dd-mm-yyyy'), 589);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (590, 'crowbar', 'toolbox', to_date('19-08-2022', 'dd-mm-yyyy'), 590);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (591, 'bench grinder', 'mobile storage unit', to_date('11-04-2021', 'dd-mm-yyyy'), 591);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (592, 'bench grinder', 'workshop', to_date('15-11-2012', 'dd-mm-yyyy'), 592);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (593, 'Allen wrench (hex key)', 'attic', to_date('23-05-2013', 'dd-mm-yyyy'), 593);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (594, 'air compressor', 'storage closet', to_date('23-02-2020', 'dd-mm-yyyy'), 594);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (595, 'utility knife', 'storage cage', to_date('06-01-2020', 'dd-mm-yyyy'), 595);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (596, 'jigsaw', 'wall hooks', to_date('13-01-2008', 'dd-mm-yyyy'), 596);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (597, 'bench grinder', 'workbench', to_date('01-11-2014', 'dd-mm-yyyy'), 597);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (598, 'socket set', 'equipment rack', to_date('29-06-2003', 'dd-mm-yyyy'), 598);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (599, 'punch set', 'equipment shed', to_date('23-06-2023', 'dd-mm-yyyy'), 599);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (600, 'wrench', 'tool shed', to_date('29-12-2019', 'dd-mm-yyyy'), 600);
commit;
prompt 600 records committed...
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (601, 'bench grinder', 'storage unit', to_date('12-01-2018', 'dd-mm-yyyy'), 601);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (602, 'miter saw', 'modular storage system', to_date('27-04-2010', 'dd-mm-yyyy'), 602);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (603, 'router', 'drawer', to_date('13-09-2016', 'dd-mm-yyyy'), 603);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (604, 'bench grinder', 'storage cage', to_date('20-10-2020', 'dd-mm-yyyy'), 604);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (605, 'measuring wheel', 'equipment room', to_date('24-07-2012', 'dd-mm-yyyy'), 605);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (606, 'saw', 'toolbox', to_date('21-05-2023', 'dd-mm-yyyy'), 606);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (607, 'vise', 'closet organizer', to_date('07-12-2017', 'dd-mm-yyyy'), 607);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (608, 'soldering iron', 'storage bin', to_date('29-09-2000', 'dd-mm-yyyy'), 608);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (609, 'caulking gun', 'storage barn', to_date('12-08-2022', 'dd-mm-yyyy'), 609);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (610, 'calipers', 'garden shed', to_date('12-01-2018', 'dd-mm-yyyy'), 610);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (611, 'punch set', 'workshop', to_date('17-09-2015', 'dd-mm-yyyy'), 611);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (612, 'multimeter', 'workbench', to_date('16-03-2015', 'dd-mm-yyyy'), 612);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (613, 'multimeter', 'utility cart', to_date('21-01-2005', 'dd-mm-yyyy'), 613);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (614, 'nail gun', 'under stairs storage', to_date('08-09-2006', 'dd-mm-yyyy'), 614);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (615, 'multimeter', 'tool shed', to_date('06-09-2014', 'dd-mm-yyyy'), 615);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (616, 'measuring wheel', 'storage locker', to_date('26-02-2017', 'dd-mm-yyyy'), 616);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (617, 'jigsaw', 'rolling cart', to_date('04-11-2006', 'dd-mm-yyyy'), 617);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (618, 'chainsaw', 'under stairs storage', to_date('06-10-2021', 'dd-mm-yyyy'), 618);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (619, 'sander', 'storage locker', to_date('24-02-2003', 'dd-mm-yyyy'), 619);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (620, 'heat gun', 'wall hooks', to_date('25-02-2012', 'dd-mm-yyyy'), 620);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (621, 'tape measure', 'equipment rack', to_date('20-10-2010', 'dd-mm-yyyy'), 621);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (622, 'nail gun', 'hanging rack', to_date('13-09-2008', 'dd-mm-yyyy'), 622);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (623, 'laser level', 'tool bag', to_date('30-01-2024', 'dd-mm-yyyy'), 623);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (624, 'oscillating tool', 'closet organizer', to_date('17-10-2014', 'dd-mm-yyyy'), 624);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (625, 'heat gun', 'basement', to_date('27-04-2017', 'dd-mm-yyyy'), 625);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (626, 'crowbar', 'under stairs storage', to_date('16-11-2017', 'dd-mm-yyyy'), 626);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (627, 'tile cutter', 'mobile storage unit', to_date('04-05-2005', 'dd-mm-yyyy'), 627);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (628, 'tape measure', 'storage container', to_date('10-02-2017', 'dd-mm-yyyy'), 628);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (629, 'Allen wrench (hex key)', 'drawer', to_date('27-09-2020', 'dd-mm-yyyy'), 629);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (630, 'fish tape', 'shelving unit', to_date('21-01-2002', 'dd-mm-yyyy'), 630);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (631, 'bench grinder', 'storage locker', to_date('23-06-2002', 'dd-mm-yyyy'), 631);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (632, 'drill', 'storage locker', to_date('09-02-2016', 'dd-mm-yyyy'), 632);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (633, 'stud finder', 'attic', to_date('29-09-2004', 'dd-mm-yyyy'), 633);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (634, 'angle grinder', 'roof rack', to_date('05-04-2007', 'dd-mm-yyyy'), 634);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (635, 'bench grinder', 'pegboard', to_date('27-01-2014', 'dd-mm-yyyy'), 635);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (636, 'socket set', 'equipment shed', to_date('20-08-2008', 'dd-mm-yyyy'), 636);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (637, 'pipe wrench', 'pegboard', to_date('29-07-2014', 'dd-mm-yyyy'), 637);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (638, 'crowbar', 'hanging rack', to_date('13-02-2003', 'dd-mm-yyyy'), 638);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (639, 'jigsaw', 'hanging rack', to_date('05-12-2010', 'dd-mm-yyyy'), 639);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (640, 'clamps', 'utility box', to_date('14-12-2012', 'dd-mm-yyyy'), 640);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (641, 'heat gun', 'utility truck', to_date('16-03-2007', 'dd-mm-yyyy'), 641);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (642, 'torque wrench', 'toolbox', to_date('28-08-2007', 'dd-mm-yyyy'), 642);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (643, 'shop vacuum', 'tool belt', to_date('09-01-2004', 'dd-mm-yyyy'), 643);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (644, 'bench grinder', 'utility truck', to_date('07-01-2013', 'dd-mm-yyyy'), 644);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (645, 'power planer', 'storage tent', to_date('15-10-2008', 'dd-mm-yyyy'), 645);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (646, 'tape measure', 'storage closet', to_date('02-07-2006', 'dd-mm-yyyy'), 646);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (647, 'air compressor', 'equipment rack', to_date('09-09-2006', 'dd-mm-yyyy'), 647);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (648, 'fish tape', 'portable tool box.', to_date('11-11-2017', 'dd-mm-yyyy'), 648);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (649, 'pliers', 'storage closet', to_date('30-06-2002', 'dd-mm-yyyy'), 649);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (650, 'fish tape', 'garden shed', to_date('17-02-2019', 'dd-mm-yyyy'), 650);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (651, 'heat gun', 'portable tool box.', to_date('09-03-2018', 'dd-mm-yyyy'), 651);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (652, 'tape measure', 'pallet rack', to_date('26-04-2023', 'dd-mm-yyyy'), 652);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (653, 'crimping tool', 'rolling cart', to_date('11-07-2015', 'dd-mm-yyyy'), 653);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (654, 'punch set', 'hanging rack', to_date('12-10-2017', 'dd-mm-yyyy'), 654);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (655, 'vise', 'modular storage system', to_date('24-01-2017', 'dd-mm-yyyy'), 655);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (656, 'chisel', 'storage barn', to_date('19-12-2007', 'dd-mm-yyyy'), 656);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (657, 'pipe wrench', 'roof rack', to_date('23-10-2009', 'dd-mm-yyyy'), 657);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (658, 'chainsaw', 'storage bin', to_date('31-03-2015', 'dd-mm-yyyy'), 658);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (659, 'oscillating tool', 'attic', to_date('23-12-2006', 'dd-mm-yyyy'), 659);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (660, 'heat gun', 'tool belt', to_date('25-06-2004', 'dd-mm-yyyy'), 660);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (661, 'level', 'storage barn', to_date('25-12-2008', 'dd-mm-yyyy'), 661);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (662, 'wrench', 'corner cabinet', to_date('17-03-2015', 'dd-mm-yyyy'), 662);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (663, 'screwdriver', 'pallet rack', to_date('21-07-2018', 'dd-mm-yyyy'), 663);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (664, 'rivet gun', 'rolling cart', to_date('10-06-2003', 'dd-mm-yyyy'), 664);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (665, 'saw', 'lockable cabinet', to_date('10-07-2005', 'dd-mm-yyyy'), 665);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (666, 'punch set', 'garden shed', to_date('11-04-2008', 'dd-mm-yyyy'), 666);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (667, 'power planer', 'portable tool box.', to_date('25-04-2001', 'dd-mm-yyyy'), 667);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (668, 'stud finder', 'storage tent', to_date('02-11-2008', 'dd-mm-yyyy'), 668);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (669, 'chisel', 'shelving unit', to_date('01-05-2020', 'dd-mm-yyyy'), 669);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (670, 'calipers', 'storage unit', to_date('20-08-2009', 'dd-mm-yyyy'), 670);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (671, 'crimping tool', 'garden shed', to_date('19-11-2004', 'dd-mm-yyyy'), 671);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (672, 'staple gun', 'garden shed', to_date('26-06-2014', 'dd-mm-yyyy'), 672);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (673, 'punch set', 'drawer', to_date('20-10-2015', 'dd-mm-yyyy'), 673);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (674, 'measuring wheel', 'portable tool box.', to_date('26-03-2019', 'dd-mm-yyyy'), 674);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (675, 'fish tape', 'storage container', to_date('14-03-2015', 'dd-mm-yyyy'), 675);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (676, 'utility knife', 'utility trailer', to_date('28-12-2014', 'dd-mm-yyyy'), 676);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (677, 'tile cutter', 'tool cabinet', to_date('28-06-2022', 'dd-mm-yyyy'), 677);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (678, 'utility knife', 'under stairs storage', to_date('25-03-2009', 'dd-mm-yyyy'), 678);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (679, 'chainsaw', 'vehicle trunk', to_date('18-03-2002', 'dd-mm-yyyy'), 679);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (680, 'miter saw', 'vehicle trunk', to_date('11-11-2001', 'dd-mm-yyyy'), 680);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (681, 'crowbar', 'workshop', to_date('04-05-2023', 'dd-mm-yyyy'), 681);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (682, 'angle grinder', 'equipment room', to_date('30-12-2000', 'dd-mm-yyyy'), 682);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (683, 'shop vacuum', 'job site box', to_date('12-04-2016', 'dd-mm-yyyy'), 683);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (684, 'power planer', 'utility cart', to_date('19-02-2022', 'dd-mm-yyyy'), 684);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (685, 'angle grinder', 'drawer', to_date('18-12-2015', 'dd-mm-yyyy'), 685);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (686, 'Allen wrench (hex key)', 'rolling cart', to_date('24-11-2009', 'dd-mm-yyyy'), 686);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (687, 'staple gun', 'under stairs storage', to_date('01-03-2007', 'dd-mm-yyyy'), 687);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (688, 'wrench', 'modular storage system', to_date('11-05-2020', 'dd-mm-yyyy'), 688);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (689, 'laser level', 'storage tent', to_date('13-07-2002', 'dd-mm-yyyy'), 689);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (690, 'power planer', 'storage cage', to_date('01-11-2004', 'dd-mm-yyyy'), 690);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (691, 'chisel', 'storage bin', to_date('22-10-2012', 'dd-mm-yyyy'), 691);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (692, 'trowel', 'tool cabinet', to_date('24-11-2012', 'dd-mm-yyyy'), 692);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (693, 'tile cutter', 'basement', to_date('16-04-2001', 'dd-mm-yyyy'), 693);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (694, 'soldering iron', 'vehicle trunk', to_date('22-05-2011', 'dd-mm-yyyy'), 694);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (695, 'caulking gun', 'equipment shed', to_date('19-02-2017', 'dd-mm-yyyy'), 695);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (696, 'fish tape', 'rolling cart', to_date('31-01-2013', 'dd-mm-yyyy'), 696);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (697, 'pliers', 'job site box', to_date('05-08-2010', 'dd-mm-yyyy'), 697);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (698, 'crowbar', 'garden shed', to_date('28-10-2009', 'dd-mm-yyyy'), 698);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (699, 'bench grinder', 'storage bin', to_date('22-02-2015', 'dd-mm-yyyy'), 699);
insert into EQUIPMENT (equipmentid, equipmentname, place, purchasedate, deptid)
values (700, 'screwdriver', 'storage barn', to_date('19-04-2002', 'dd-mm-yyyy'), 700);
commit;
prompt 700 records loaded
prompt Loading LOCATION_...
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (1, 81, 'W817', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (2, 35, 'U255', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (3, 87, 'S350', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (4, 53, 'O766', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (5, 51, 'Q616', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (6, 56, 'S972', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (7, 86, 'E973', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (8, 95, 'E462', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (9, 78, 'G789', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (10, 32, 'R574', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (11, 66, 'Y091', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (12, 51, 'Q149', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (13, 59, 'J817', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (14, 2, 'N529', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (15, 34, 'C739', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (16, 2, 'O566', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (17, 92, 'I805', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (18, 12, 'P074', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (19, 43, 'Y413', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (20, 57, 'Z593', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (21, 16, 'T422', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (22, 5, 'B311', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (23, 31, 'X878', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (24, 11, 'G125', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (25, 37, 'Y510', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (26, 62, 'M204', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (27, 96, 'P970', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (28, 38, 'U410', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (29, 7, 'O909', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (30, 94, 'R340', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (31, 38, 'X312', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (32, 97, 'Z042', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (33, 82, 'E464', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (34, 31, 'P846', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (35, 96, 'R443', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (36, 5, 'B381', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (37, 70, 'P050', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (38, 36, 'X446', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (39, 21, 'T433', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (40, 79, 'D757', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (41, 15, 'R321', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (42, 93, 'F450', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (43, 20, 'I806', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (44, 89, 'Q027', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (45, 60, 'L807', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (46, 19, 'G080', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (47, 28, 'P283', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (48, 63, 'O659', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (49, 71, 'G496', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (50, 10, 'D332', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (51, 96, 'X006', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (52, 93, 'B331', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (53, 92, 'N331', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (54, 14, 'P159', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (55, 86, 'Q248', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (56, 99, 'I849', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (57, 42, 'J925', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (58, 27, 'H998', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (59, 92, 'A188', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (60, 60, 'J491', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (61, 12, 'G680', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (62, 87, 'U953', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (63, 11, 'Z240', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (64, 90, 'Y481', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (65, 71, 'V903', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (66, 54, 'N946', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (67, 20, 'U416', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (68, 93, 'I041', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (69, 7, 'D850', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (70, 31, 'Y583', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (71, 27, 'Y584', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (72, 90, 'Y721', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (73, 38, 'X358', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (74, 17, 'P795', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (75, 80, 'P922', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (76, 36, 'P666', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (77, 78, 'J837', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (78, 68, 'K257', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (79, 99, 'D870', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (80, 27, 'K191', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (81, 54, 'S908', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (82, 89, 'Z228', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (83, 13, 'V250', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (84, 57, 'Y815', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (85, 53, 'X508', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (86, 41, 'X449', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (87, 100, 'D293', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (88, 80, 'Y611', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (89, 46, 'J192', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (90, 60, 'I355', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (91, 64, 'J327', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (92, 12, 'Q437', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (93, 91, 'B541', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (94, 66, 'J543', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (95, 46, 'C286', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (96, 74, 'W182', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (97, 93, 'Q818', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (98, 55, 'W681', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (99, 90, 'A992', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (100, 80, 'E723', 'Available');
commit;
prompt 100 records committed...
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (101, 35, 'N687', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (102, 68, 'I500', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (103, 15, 'C964', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (104, 33, 'Z329', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (105, 16, 'R492', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (106, 54, 'S714', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (107, 81, 'X147', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (108, 74, 'W677', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (109, 31, 'R574', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (110, 11, 'Z540', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (111, 30, 'B787', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (112, 68, 'C857', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (113, 22, 'Z374', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (114, 73, 'R945', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (115, 79, 'T757', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (116, 99, 'T345', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (117, 44, 'N840', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (118, 95, 'J276', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (119, 7, 'Z494', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (120, 41, 'P879', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (121, 65, 'T426', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (122, 50, 'A909', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (123, 85, 'W785', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (124, 77, 'O858', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (125, 81, 'V813', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (126, 17, 'E038', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (127, 47, 'X255', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (128, 81, 'S657', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (129, 21, 'Y245', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (130, 75, 'K031', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (131, 83, 'D136', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (132, 11, 'S166', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (133, 59, 'Z233', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (134, 99, 'A472', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (135, 68, 'E901', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (136, 14, 'E102', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (137, 50, 'J425', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (138, 78, 'K589', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (139, 60, 'F984', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (140, 32, 'J975', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (141, 17, 'M990', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (142, 47, 'U637', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (143, 49, 'Q385', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (144, 95, 'N888', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (145, 71, 'N016', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (146, 99, 'U318', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (147, 15, 'U862', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (148, 98, 'V092', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (149, 46, 'F812', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (150, 54, 'J469', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (151, 7, 'R452', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (152, 36, 'U129', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (153, 22, 'R728', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (154, 1, 'W917', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (155, 91, 'L457', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (156, 47, 'I861', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (157, 26, 'V544', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (158, 21, 'Z243', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (159, 68, 'T928', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (160, 68, 'H013', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (161, 1, 'Z949', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (162, 91, 'P029', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (163, 4, 'E720', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (164, 90, 'I186', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (165, 17, 'T179', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (166, 35, 'I449', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (167, 12, 'C123', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (168, 79, 'F091', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (169, 61, 'P779', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (170, 71, 'T011', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (171, 13, 'N578', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (172, 99, 'N193', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (173, 91, 'L841', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (174, 69, 'L873', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (175, 62, 'X292', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (176, 61, 'F610', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (177, 20, 'I526', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (178, 30, 'G856', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (179, 87, 'A949', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (180, 67, 'Y580', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (181, 14, 'I160', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (182, 88, 'P946', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (183, 44, 'G240', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (184, 19, 'W176', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (185, 5, 'X497', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (186, 74, 'K428', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (187, 50, 'D610', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (188, 10, 'K166', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (189, 38, 'B876', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (190, 53, 'M178', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (191, 100, 'O650', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (192, 82, 'S416', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (193, 91, 'N849', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (194, 38, 'Y603', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (195, 60, 'A595', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (196, 66, 'I353', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (197, 79, 'W548', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (198, 16, 'D020', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (199, 86, 'H776', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (200, 29, 'I091', 'Occupied');
commit;
prompt 200 records committed...
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (201, 40, 'D072', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (202, 36, 'B300', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (203, 14, 'H140', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (204, 39, 'B009', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (205, 3, 'S089', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (206, 70, 'E625', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (207, 97, 'P242', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (208, 84, 'I071', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (209, 50, 'L462', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (210, 12, 'K785', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (211, 56, 'K797', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (212, 87, 'I919', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (213, 27, 'V613', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (214, 57, 'K134', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (215, 14, 'U387', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (216, 86, 'Z564', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (217, 99, 'J477', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (218, 70, 'D368', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (219, 14, 'I076', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (220, 52, 'O959', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (221, 71, 'S145', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (222, 87, 'C644', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (223, 12, 'O677', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (224, 48, 'S226', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (225, 48, 'Q976', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (226, 58, 'V201', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (227, 87, 'V953', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (228, 91, 'D018', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (229, 15, 'H849', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (230, 100, 'G480', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (231, 86, 'Z793', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (232, 98, 'E455', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (233, 15, 'M955', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (234, 91, 'T495', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (235, 24, 'O975', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (236, 84, 'L676', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (237, 96, 'Z494', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (238, 8, 'L013', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (239, 62, 'G670', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (240, 75, 'D329', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (241, 58, 'O546', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (242, 21, 'C330', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (243, 51, 'V735', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (244, 58, 'G353', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (245, 11, 'S355', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (246, 2, 'L690', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (247, 18, 'Y994', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (248, 31, 'C295', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (249, 83, 'I712', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (250, 74, 'R639', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (251, 54, 'T871', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (252, 44, 'B827', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (253, 57, 'N580', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (254, 21, 'K442', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (255, 52, 'O394', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (256, 80, 'L456', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (257, 57, 'Z111', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (258, 64, 'F295', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (259, 43, 'A120', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (260, 29, 'I819', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (261, 69, 'G833', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (262, 78, 'Y600', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (263, 18, 'N162', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (264, 92, 'F994', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (265, 50, 'F885', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (266, 67, 'P110', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (267, 75, 'H724', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (268, 13, 'N069', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (269, 60, 'K306', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (270, 61, 'M346', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (271, 23, 'D380', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (272, 54, 'M862', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (273, 51, 'D431', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (274, 20, 'P365', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (275, 27, 'T983', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (276, 24, 'P686', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (277, 33, 'J716', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (278, 67, 'S316', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (279, 38, 'Z745', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (280, 72, 'N894', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (281, 55, 'E995', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (282, 88, 'D658', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (283, 14, 'E871', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (284, 57, 'B139', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (285, 99, 'Y358', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (286, 52, 'H927', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (287, 87, 'Z569', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (288, 38, 'M414', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (289, 9, 'T897', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (290, 83, 'Q048', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (291, 61, 'P595', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (292, 33, 'X252', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (293, 60, 'K082', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (294, 55, 'U524', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (295, 14, 'B354', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (296, 47, 'V048', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (297, 88, 'Z694', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (298, 45, 'B552', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (299, 41, 'E396', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (300, 38, 'I303', 'Occupied');
commit;
prompt 300 records committed...
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (301, 22, 'M211', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (302, 52, 'Z037', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (303, 57, 'Z104', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (304, 12, 'X157', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (305, 21, 'O440', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (306, 81, 'R613', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (307, 72, 'Y496', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (308, 32, 'J359', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (309, 52, 'L866', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (310, 3, 'Z382', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (311, 90, 'H969', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (312, 14, 'B770', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (313, 83, 'R854', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (314, 81, 'J492', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (315, 23, 'F990', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (316, 10, 'S355', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (317, 75, 'J851', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (318, 42, 'Q927', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (319, 78, 'X974', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (320, 66, 'O966', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (321, 32, 'W381', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (322, 5, 'I025', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (323, 11, 'F607', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (324, 36, 'N530', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (325, 68, 'V056', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (326, 7, 'Z849', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (327, 42, 'C316', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (328, 11, 'P810', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (329, 44, 'X653', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (330, 51, 'N323', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (331, 52, 'P688', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (332, 24, 'W670', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (333, 17, 'J765', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (334, 39, 'P356', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (335, 91, 'Y802', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (336, 4, 'J207', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (337, 88, 'C024', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (338, 22, 'Q095', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (339, 6, 'U613', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (340, 31, 'G119', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (341, 25, 'A580', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (342, 20, 'Q533', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (343, 43, 'Q980', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (344, 17, 'X806', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (345, 25, 'R215', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (346, 82, 'M135', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (347, 68, 'G251', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (348, 22, 'E344', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (349, 27, 'A370', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (350, 2, 'F963', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (351, 99, 'L501', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (352, 55, 'C337', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (353, 86, 'J445', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (354, 50, 'H024', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (355, 15, 'M644', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (356, 26, 'I288', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (357, 71, 'P460', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (358, 78, 'Q027', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (359, 41, 'N740', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (360, 17, 'C272', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (361, 60, 'E844', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (362, 65, 'C993', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (363, 38, 'F276', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (364, 84, 'I969', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (365, 25, 'A845', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (366, 9, 'M716', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (367, 47, 'P250', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (368, 7, 'I237', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (369, 95, 'T434', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (370, 55, 'L066', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (371, 22, 'R511', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (372, 36, 'X299', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (373, 98, 'N903', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (374, 50, 'M570', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (375, 100, 'K759', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (376, 58, 'H350', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (377, 16, 'W143', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (378, 18, 'T388', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (379, 8, 'Q339', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (380, 44, 'M416', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (381, 18, 'F572', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (382, 69, 'Z854', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (383, 65, 'W874', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (384, 22, 'Q078', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (385, 20, 'V742', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (386, 25, 'U719', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (387, 75, 'V271', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (388, 8, 'E802', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (389, 89, 'N942', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (390, 100, 'B404', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (391, 24, 'Y870', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (392, 5, 'O404', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (393, 46, 'N755', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (394, 75, 'V109', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (395, 97, 'E674', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (396, 8, 'G109', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (397, 68, 'S660', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (398, 24, 'L909', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (399, 21, 'J854', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (400, 93, 'U163', 'Occupied');
commit;
prompt 400 records committed...
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (401, 58, 'N710', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (402, 20, 'J022', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (403, 79, 'I599', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (404, 5, 'U060', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (405, 12, 'P289', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (406, 93, 'B569', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (407, 34, 'I065', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (408, 51, 'Y176', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (409, 6, 'N930', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (410, 27, 'N127', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (411, 48, 'Z643', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (412, 75, 'L906', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (413, 28, 'P034', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (414, 83, 'A657', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (415, 19, 'C856', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (416, 48, 'B870', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (417, 51, 'U383', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (418, 10, 'F974', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (419, 45, 'M284', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (420, 5, 'R446', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (421, 11, 'H943', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (422, 40, 'C796', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (423, 19, 'L405', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (424, 94, 'V815', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (425, 73, 'Y314', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (426, 12, 'A118', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (427, 76, 'E909', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (428, 33, 'O879', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (429, 96, 'O987', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (430, 33, 'R468', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (431, 74, 'D033', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (432, 48, 'F051', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (433, 100, 'J826', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (434, 8, 'N793', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (435, 37, 'U241', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (436, 13, 'V128', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (437, 74, 'K254', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (438, 24, 'O006', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (439, 68, 'E184', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (440, 39, 'Y868', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (441, 53, 'U979', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (442, 53, 'T687', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (443, 80, 'W585', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (444, 83, 'Y749', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (445, 67, 'K786', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (446, 47, 'S884', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (447, 5, 'T659', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (448, 72, 'R897', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (449, 24, 'G889', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (450, 96, 'H038', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (451, 81, 'D237', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (452, 70, 'G336', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (453, 98, 'W407', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (454, 1, 'K522', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (455, 32, 'D656', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (456, 49, 'U533', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (457, 11, 'I862', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (458, 46, 'Q468', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (459, 86, 'T536', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (460, 41, 'Z383', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (461, 9, 'B488', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (462, 76, 'C448', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (463, 74, 'L667', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (464, 79, 'G476', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (465, 20, 'V322', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (466, 94, 'T045', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (467, 100, 'K175', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (468, 39, 'I884', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (469, 69, 'B116', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (470, 17, 'K277', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (471, 81, 'S770', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (472, 33, 'F237', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (473, 90, 'R158', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (474, 12, 'G985', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (475, 46, 'H591', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (476, 10, 'Z828', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (477, 78, 'S163', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (478, 42, 'Y692', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (479, 34, 'A030', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (480, 69, 'T281', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (481, 30, 'J457', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (482, 22, 'S285', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (483, 18, 'K689', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (484, 80, 'W628', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (485, 90, 'K391', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (486, 52, 'M421', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (487, 43, 'F136', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (488, 81, 'A580', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (489, 53, 'W564', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (490, 68, 'U206', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (491, 4, 'H749', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (492, 27, 'D444', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (493, 54, 'X468', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (494, 25, 'R987', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (495, 14, 'Z324', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (496, 12, 'W078', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (497, 78, 'V310', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (498, 17, 'H085', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (499, 32, 'D069', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (500, 96, 'G748', 'Occupied');
commit;
prompt 500 records committed...
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (501, 81, 'K171', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (502, 87, 'Z990', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (503, 68, 'N914', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (504, 79, 'L378', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (505, 3, 'D718', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (506, 65, 'A095', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (507, 65, 'L385', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (508, 51, 'R473', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (509, 70, 'Z311', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (510, 72, 'K576', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (511, 31, 'Q843', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (512, 11, 'E101', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (513, 43, 'K272', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (514, 91, 'Q658', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (515, 71, 'E041', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (516, 76, 'S669', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (517, 41, 'C639', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (518, 76, 'A387', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (519, 83, 'J923', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (520, 68, 'M763', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (521, 69, 'B191', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (522, 48, 'S265', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (523, 21, 'G674', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (524, 90, 'I491', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (525, 54, 'V980', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (526, 12, 'E209', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (527, 29, 'A561', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (528, 60, 'L921', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (529, 26, 'X366', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (530, 61, 'Z424', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (531, 15, 'F121', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (532, 63, 'U759', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (533, 9, 'J037', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (534, 23, 'C665', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (535, 5, 'L209', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (536, 27, 'C754', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (537, 99, 'V239', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (538, 86, 'F819', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (539, 73, 'S202', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (540, 27, 'J952', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (541, 49, 'M679', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (542, 55, 'N673', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (543, 59, 'I804', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (544, 45, 'B370', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (545, 75, 'P416', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (546, 59, 'J039', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (547, 98, 'C035', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (548, 13, 'Y591', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (549, 48, 'Q682', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (550, 14, 'Q565', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (551, 52, 'V869', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (552, 92, 'D643', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (553, 50, 'R320', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (554, 32, 'L482', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (555, 30, 'O615', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (556, 22, 'B667', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (557, 65, 'E478', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (558, 7, 'T946', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (559, 73, 'E564', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (560, 89, 'H623', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (561, 58, 'A003', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (562, 74, 'Y021', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (563, 75, 'E585', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (564, 42, 'R104', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (565, 65, 'J746', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (566, 55, 'U459', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (567, 91, 'I196', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (568, 80, 'H480', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (569, 24, 'G078', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (570, 43, 'K987', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (571, 6, 'S832', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (572, 24, 'E749', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (573, 22, 'T650', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (574, 94, 'J897', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (575, 73, 'K868', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (576, 7, 'M932', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (577, 53, 'L730', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (578, 13, 'X463', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (579, 45, 'T878', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (580, 40, 'G606', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (581, 53, 'I670', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (582, 24, 'R413', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (583, 82, 'P943', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (584, 78, 'F063', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (585, 27, 'O273', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (586, 25, 'E008', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (587, 12, 'Z655', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (588, 43, 'W796', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (589, 89, 'D558', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (590, 58, 'X189', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (591, 46, 'S837', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (592, 57, 'C634', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (593, 96, 'L624', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (594, 1, 'D889', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (595, 44, 'F020', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (596, 18, 'I700', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (597, 15, 'I750', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (598, 93, 'K047', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (599, 10, 'G434', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (600, 60, 'R238', 'Occupied');
commit;
prompt 600 records committed...
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (601, 7, 'B976', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (602, 19, 'W463', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (603, 97, 'Y536', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (604, 8, 'I938', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (605, 16, 'O332', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (606, 24, 'F854', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (607, 10, 'N590', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (608, 79, 'L727', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (609, 12, 'Y653', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (610, 1, 'P132', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (611, 31, 'I407', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (612, 22, 'O164', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (613, 6, 'K711', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (614, 28, 'L489', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (615, 87, 'T004', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (616, 74, 'A272', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (617, 49, 'K875', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (618, 99, 'D173', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (619, 100, 'X661', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (620, 17, 'W699', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (621, 97, 'Q868', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (622, 3, 'P807', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (623, 83, 'Z498', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (624, 76, 'U546', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (625, 83, 'P134', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (626, 45, 'A902', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (627, 7, 'D819', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (628, 76, 'I527', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (629, 53, 'C908', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (630, 22, 'D449', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (631, 91, 'J133', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (632, 13, 'S229', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (633, 17, 'I129', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (634, 71, 'R657', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (635, 53, 'H360', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (636, 100, 'E301', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (637, 92, 'B178', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (638, 81, 'X190', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (639, 57, 'F546', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (640, 13, 'X418', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (641, 86, 'Y647', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (642, 95, 'T508', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (643, 97, 'K240', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (644, 63, 'O015', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (645, 82, 'M533', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (646, 63, 'K970', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (647, 61, 'O587', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (648, 53, 'C186', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (649, 98, 'U882', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (650, 33, 'T440', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (651, 54, 'M372', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (652, 39, 'M922', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (653, 25, 'P002', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (654, 64, 'M278', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (655, 62, 'R083', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (656, 21, 'W952', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (657, 96, 'R432', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (658, 2, 'R704', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (659, 30, 'K228', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (660, 100, 'A909', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (661, 20, 'V983', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (662, 82, 'D572', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (663, 17, 'U281', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (664, 97, 'N215', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (665, 17, 'Z583', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (666, 49, 'Q397', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (667, 77, 'N990', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (668, 71, 'X663', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (669, 66, 'B303', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (670, 93, 'N233', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (671, 63, 'Y058', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (672, 68, 'T925', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (673, 76, 'Z531', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (674, 65, 'B978', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (675, 80, 'C138', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (676, 81, 'W073', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (677, 2, 'J685', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (678, 89, 'A175', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (679, 99, 'S940', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (680, 21, 'X268', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (681, 73, 'V993', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (682, 93, 'Z599', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (683, 15, 'K377', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (684, 67, 'J052', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (685, 33, 'H898', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (686, 92, 'G680', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (687, 41, 'G222', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (688, 91, 'A560', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (689, 3, 'G270', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (690, 76, 'Q728', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (691, 91, 'V369', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (692, 85, 'V066', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (693, 55, 'C221', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (694, 3, 'H860', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (695, 81, 'I488', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (696, 95, 'A871', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (697, 78, 'N072', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (698, 96, 'N034', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (699, 56, 'G965', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (700, 68, 'Y642', 'Occupied');
commit;
prompt 700 records committed...
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (701, 82, 'P391', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (702, 70, 'P270', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (703, 38, 'P470', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (704, 74, 'P774', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (705, 69, 'M601', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (706, 68, 'X221', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (707, 30, 'J792', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (708, 91, 'I094', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (709, 74, 'T405', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (710, 44, 'U861', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (711, 94, 'U319', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (712, 15, 'G235', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (713, 10, 'K578', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (714, 7, 'D300', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (715, 34, 'L128', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (716, 71, 'D391', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (717, 5, 'O054', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (718, 40, 'D330', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (719, 95, 'K965', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (720, 96, 'R184', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (721, 57, 'E239', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (722, 89, 'U435', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (723, 56, 'B082', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (724, 34, 'S567', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (725, 45, 'K716', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (726, 22, 'Y408', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (727, 11, 'M400', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (728, 37, 'E445', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (729, 28, 'C147', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (730, 4, 'K907', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (731, 1, 'H764', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (732, 83, 'K617', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (733, 39, 'F567', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (734, 63, 'E004', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (735, 59, 'P929', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (736, 34, 'B578', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (737, 93, 'X900', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (738, 61, 'T851', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (739, 12, 'Q502', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (740, 14, 'X817', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (741, 59, 'Q461', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (742, 27, 'M749', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (743, 32, 'F119', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (744, 25, 'W226', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (745, 40, 'D109', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (746, 79, 'A456', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (747, 84, 'Q841', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (748, 85, 'H856', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (749, 37, 'Q972', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (750, 57, 'L265', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (751, 74, 'W952', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (752, 88, 'R543', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (753, 52, 'V110', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (754, 5, 'M559', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (755, 78, 'U703', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (756, 40, 'H459', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (757, 42, 'L961', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (758, 12, 'B957', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (759, 66, 'B994', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (760, 82, 'Y795', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (761, 45, 'E223', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (762, 93, 'Z059', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (763, 5, 'H240', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (764, 85, 'O634', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (765, 86, 'P591', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (766, 53, 'U583', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (767, 84, 'N450', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (768, 13, 'N451', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (769, 72, 'A690', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (770, 8, 'C145', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (771, 96, 'B702', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (772, 94, 'M192', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (773, 48, 'X107', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (774, 49, 'W731', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (775, 13, 'E248', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (776, 46, 'G936', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (777, 14, 'Y635', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (778, 6, 'H249', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (779, 48, 'A787', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (780, 23, 'N383', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (781, 20, 'F172', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (782, 10, 'Q766', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (783, 60, 'J629', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (784, 82, 'H434', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (785, 38, 'T903', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (786, 12, 'M086', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (787, 55, 'Z169', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (788, 86, 'I675', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (789, 19, 'M297', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (790, 27, 'O825', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (791, 47, 'Y676', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (792, 99, 'S234', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (793, 64, 'O720', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (794, 78, 'U232', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (795, 86, 'E680', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (796, 49, 'F978', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (797, 51, 'A808', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (798, 35, 'I881', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (799, 64, 'V086', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (800, 51, 'T977', 'Occupied');
commit;
prompt 800 records committed...
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (801, 30, 'T855', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (802, 16, 'D390', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (803, 46, 'W021', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (804, 27, 'W979', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (805, 26, 'W451', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (806, 75, 'K564', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (807, 54, 'R003', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (808, 50, 'U599', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (809, 48, 'A934', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (810, 55, 'H321', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (811, 49, 'K490', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (812, 44, 'U025', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (813, 53, 'S500', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (814, 49, 'F497', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (815, 50, 'D652', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (816, 43, 'T018', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (817, 1, 'A903', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (818, 90, 'T824', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (819, 93, 'M444', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (820, 87, 'P203', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (821, 87, 'X542', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (822, 11, 'L367', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (823, 46, 'F734', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (824, 61, 'P626', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (825, 79, 'D812', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (826, 65, 'S524', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (827, 25, 'N500', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (828, 84, 'S968', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (829, 11, 'Z495', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (830, 40, 'S284', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (831, 31, 'R725', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (832, 60, 'Z457', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (833, 18, 'K107', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (834, 62, 'E632', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (835, 18, 'K330', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (836, 60, 'G702', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (837, 79, 'T737', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (838, 9, 'V783', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (839, 37, 'A410', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (840, 83, 'M184', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (841, 12, 'S322', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (842, 54, 'S596', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (843, 65, 'F710', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (844, 53, 'D764', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (845, 36, 'M685', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (846, 21, 'P633', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (847, 50, 'Q390', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (848, 5, 'Q553', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (849, 61, 'L259', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (850, 12, 'D834', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (851, 78, 'Y310', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (852, 11, 'O865', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (853, 28, 'X607', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (854, 57, 'V250', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (855, 70, 'R392', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (856, 74, 'B526', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (857, 83, 'J749', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (858, 47, 'X679', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (859, 93, 'N393', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (860, 27, 'J262', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (861, 19, 'J676', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (862, 48, 'H703', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (863, 85, 'R896', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (864, 55, 'K340', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (865, 6, 'I098', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (866, 38, 'A792', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (867, 4, 'M775', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (868, 48, 'H843', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (869, 26, 'I646', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (870, 32, 'S613', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (871, 45, 'N759', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (872, 45, 'R706', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (873, 17, 'M028', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (874, 54, 'P725', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (875, 99, 'Q940', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (876, 26, 'K792', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (877, 1, 'U227', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (878, 93, 'B593', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (879, 7, 'Q611', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (880, 27, 'I004', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (881, 5, 'M230', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (882, 17, 'U557', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (883, 91, 'I964', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (884, 86, 'K941', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (885, 83, 'I282', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (886, 80, 'O049', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (887, 72, 'L377', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (888, 95, 'Q361', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (889, 31, 'Z239', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (890, 22, 'G316', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (891, 33, 'R036', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (892, 69, 'P038', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (893, 22, 'R209', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (894, 52, 'I721', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (895, 5, 'D438', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (896, 11, 'R297', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (897, 14, 'A772', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (898, 33, 'R310', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (899, 47, 'H781', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (900, 30, 'E538', 'Occupied');
commit;
prompt 900 records committed...
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (901, 44, 'G945', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (902, 19, 'U332', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (903, 76, 'R657', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (904, 51, 'J883', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (905, 75, 'V350', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (906, 47, 'S946', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (907, 69, 'D197', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (908, 53, 'K421', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (909, 64, 'P586', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (910, 4, 'G705', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (911, 27, 'R408', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (912, 51, 'U709', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (913, 13, 'M205', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (914, 83, 'A411', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (915, 25, 'J114', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (916, 57, 'R944', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (917, 1, 'J026', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (918, 41, 'Y831', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (919, 100, 'Y565', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (920, 70, 'Z263', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (921, 35, 'Z775', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (922, 55, 'J852', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (923, 23, 'N842', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (924, 34, 'Z079', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (925, 93, 'A553', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (926, 82, 'I855', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (927, 23, 'Y059', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (928, 87, 'T705', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (929, 63, 'B169', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (930, 87, 'T576', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (931, 74, 'J928', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (932, 54, 'C355', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (933, 12, 'M652', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (934, 19, 'Y298', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (935, 16, 'L217', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (936, 22, 'C200', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (937, 7, 'E526', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (938, 48, 'Y448', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (939, 46, 'K741', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (940, 9, 'R462', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (941, 42, 'V286', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (942, 20, 'W103', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (943, 56, 'U110', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (944, 90, 'W784', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (945, 87, 'D922', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (946, 76, 'G948', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (947, 21, 'V198', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (948, 91, 'T454', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (949, 26, 'G677', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (950, 51, 'P123', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (951, 12, 'V252', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (952, 55, 'P504', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (953, 56, 'U698', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (954, 37, 'S219', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (955, 43, 'H521', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (956, 77, 'P905', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (957, 36, 'R634', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (958, 28, 'K296', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (959, 22, 'A852', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (960, 95, 'T968', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (961, 77, 'Z900', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (962, 11, 'N386', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (963, 75, 'N136', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (964, 37, 'P910', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (965, 31, 'B411', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (966, 89, 'E031', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (967, 93, 'M212', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (968, 4, 'Y595', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (969, 19, 'K067', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (970, 74, 'A901', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (971, 12, 'D479', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (972, 62, 'Q084', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (973, 41, 'X115', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (974, 19, 'O755', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (975, 64, 'J275', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (976, 67, 'Z917', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (977, 99, 'J780', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (978, 94, 'T309', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (979, 65, 'V623', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (980, 20, 'T794', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (981, 8, 'S695', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (982, 25, 'X265', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (983, 37, 'G458', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (984, 1, 'R783', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (985, 83, 'P101', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (986, 35, 'Y370', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (987, 19, 'N691', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (988, 96, 'L340', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (989, 82, 'E973', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (990, 14, 'P247', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (991, 59, 'K648', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (992, 20, 'A540', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (993, 66, 'Z119', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (994, 61, 'S548', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (995, 98, 'D899', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (996, 65, 'X741', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (997, 91, 'C985', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (998, 21, 'N107', 'Available');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (999, 89, 'K490', 'Occupied');
insert into LOCATION_ (locationid, floorid, areaid, availability)
values (1000, 24, 'K282', 'Available');
commit;
prompt 1000 records loaded
prompt Loading MAINTENANCEREQUEST_...
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (1, 'Medium', 646, 433);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (2, 'High', 560, 995);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (3, 'Low', 660, 366);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (4, 'Medium', 568, 661);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (5, 'High', 259, 85);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (6, 'Medium', 385, 383);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (7, 'Low', 286, 973);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (8, 'Medium', 185, 453);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (9, 'Medium', 61, 691);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (10, 'Medium', 35, 782);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (11, 'Medium', 265, 500);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (12, 'High', 168, 85);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (13, 'Low', 520, 893);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (14, 'High', 675, 168);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (15, 'Medium', 262, 972);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (16, 'Low', 137, 803);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (17, 'Low', 239, 418);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (18, 'Medium', 352, 327);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (19, 'Low', 201, 22);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (20, 'Medium', 41, 453);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (21, 'High', 616, 19);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (22, 'Medium', 416, 942);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (23, 'Low', 719, 798);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (24, 'High', 526, 11);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (25, 'Medium', 497, 194);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (26, 'High', 319, 276);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (27, 'High', 137, 958);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (28, 'Low', 70, 810);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (29, 'Medium', 516, 1000);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (30, 'Medium', 220, 761);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (31, 'Medium', 249, 779);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (32, 'High', 219, 142);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (33, 'Low', 156, 702);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (34, 'Medium', 12, 201);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (35, 'Medium', 317, 97);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (36, 'Medium', 225, 107);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (37, 'Low', 545, 154);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (38, 'Low', 717, 416);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (39, 'Medium', 729, 966);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (40, 'High', 265, 801);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (41, 'Low', 92, 116);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (42, 'Medium', 410, 127);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (43, 'High', 92, 984);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (44, 'Low', 39, 636);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (45, 'Medium', 110, 381);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (46, 'Low', 448, 554);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (47, 'High', 708, 631);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (48, 'Low', 399, 765);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (49, 'Medium', 50, 229);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (50, 'High', 222, 247);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (51, 'Medium', 333, 212);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (52, 'Low', 149, 55);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (53, 'High', 276, 883);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (54, 'High', 353, 954);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (55, 'Medium', 194, 648);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (56, 'Medium', 712, 825);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (57, 'Low', 733, 407);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (58, 'High', 165, 950);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (59, 'High', 396, 977);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (60, 'High', 19, 970);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (61, 'Low', 441, 364);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (62, 'Low', 470, 918);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (63, 'High', 695, 998);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (64, 'High', 104, 579);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (65, 'Medium', 578, 682);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (66, 'Low', 437, 516);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (67, 'High', 122, 330);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (68, 'Medium', 473, 375);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (69, 'Low', 546, 924);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (70, 'High', 86, 305);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (71, 'Low', 340, 363);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (72, 'Low', 456, 162);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (73, 'High', 101, 372);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (74, 'High', 48, 394);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (75, 'High', 282, 30);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (76, 'Medium', 216, 472);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (77, 'Medium', 318, 240);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (78, 'Medium', 50, 188);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (79, 'Low', 194, 229);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (80, 'Medium', 589, 174);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (81, 'Medium', 211, 290);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (82, 'High', 557, 714);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (83, 'Medium', 531, 721);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (84, 'High', 86, 831);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (85, 'High', 249, 980);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (86, 'Medium', 302, 101);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (87, 'High', 319, 879);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (88, 'High', 159, 914);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (89, 'Medium', 282, 700);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (90, 'Low', 635, 747);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (91, 'Medium', 672, 16);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (92, 'Low', 345, 255);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (93, 'Medium', 564, 350);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (94, 'High', 466, 918);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (95, 'Medium', 695, 635);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (96, 'High', 163, 383);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (97, 'Low', 202, 753);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (98, 'Medium', 66, 990);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (99, 'Low', 53, 300);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (100, 'Medium', 73, 59);
commit;
prompt 100 records committed...
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (101, 'Medium', 159, 409);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (102, 'Low', 404, 224);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (103, 'Medium', 167, 200);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (104, 'High', 70, 663);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (105, 'Medium', 528, 7);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (106, 'Low', 544, 847);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (107, 'Low', 208, 336);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (108, 'Low', 741, 908);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (109, 'Low', 614, 238);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (110, 'Low', 203, 742);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (111, 'Medium', 453, 922);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (112, 'High', 542, 930);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (113, 'Low', 60, 698);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (114, 'High', 174, 215);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (115, 'Medium', 248, 684);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (116, 'Low', 203, 112);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (117, 'High', 88, 811);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (118, 'High', 121, 619);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (119, 'Low', 742, 925);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (120, 'High', 16, 276);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (121, 'Medium', 82, 317);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (122, 'Low', 606, 915);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (123, 'Low', 494, 814);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (124, 'Low', 606, 356);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (125, 'High', 633, 296);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (126, 'Low', 102, 873);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (127, 'Low', 616, 203);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (128, 'High', 404, 59);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (129, 'Medium', 690, 12);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (130, 'Medium', 204, 318);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (131, 'Low', 35, 421);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (132, 'Low', 684, 952);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (133, 'Medium', 424, 832);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (134, 'Low', 54, 266);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (135, 'Medium', 186, 138);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (136, 'Medium', 80, 400);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (137, 'High', 496, 965);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (138, 'High', 190, 949);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (139, 'Medium', 618, 80);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (140, 'High', 25, 706);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (141, 'High', 633, 117);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (142, 'Medium', 594, 706);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (143, 'High', 424, 560);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (144, 'High', 261, 608);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (145, 'Medium', 279, 544);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (146, 'Medium', 197, 813);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (147, 'Medium', 10, 251);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (148, 'High', 579, 928);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (149, 'Medium', 453, 99);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (150, 'High', 207, 19);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (151, 'Low', 223, 166);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (152, 'Medium', 484, 200);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (153, 'Medium', 605, 540);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (154, 'High', 660, 260);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (155, 'High', 143, 725);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (156, 'Medium', 119, 450);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (157, 'High', 343, 27);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (158, 'Medium', 496, 31);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (159, 'Medium', 404, 506);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (160, 'High', 205, 454);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (161, 'Medium', 499, 333);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (162, 'Low', 205, 989);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (163, 'High', 168, 494);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (164, 'Low', 585, 980);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (165, 'Medium', 13, 750);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (166, 'High', 21, 304);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (167, 'Medium', 393, 666);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (168, 'Medium', 643, 709);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (169, 'Low', 542, 1);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (170, 'High', 240, 570);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (171, 'Low', 72, 160);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (172, 'Medium', 176, 965);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (173, 'High', 14, 38);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (174, 'High', 83, 579);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (175, 'Medium', 132, 838);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (176, 'Medium', 640, 672);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (177, 'Low', 363, 50);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (178, 'Low', 108, 854);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (179, 'Medium', 137, 55);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (180, 'Medium', 661, 438);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (181, 'Medium', 558, 314);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (182, 'High', 454, 549);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (183, 'Low', 729, 683);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (184, 'High', 547, 152);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (185, 'Medium', 425, 668);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (186, 'Medium', 494, 888);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (187, 'Medium', 453, 154);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (188, 'High', 248, 878);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (189, 'Low', 454, 133);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (190, 'Medium', 348, 877);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (191, 'High', 741, 770);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (192, 'Medium', 631, 971);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (193, 'Low', 515, 701);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (194, 'Medium', 268, 331);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (195, 'Low', 300, 949);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (196, 'Low', 442, 290);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (197, 'Medium', 693, 317);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (198, 'High', 317, 469);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (199, 'Low', 498, 294);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (200, 'Medium', 118, 851);
commit;
prompt 200 records committed...
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (201, 'Medium', 671, 347);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (202, 'Medium', 298, 339);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (203, 'High', 366, 439);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (204, 'Low', 363, 391);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (205, 'Low', 412, 675);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (206, 'Low', 312, 537);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (207, 'High', 583, 634);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (208, 'Medium', 65, 238);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (209, 'Low', 454, 86);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (210, 'Medium', 60, 696);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (211, 'High', 472, 451);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (212, 'Low', 511, 645);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (213, 'Medium', 307, 518);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (214, 'Medium', 368, 1000);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (215, 'Medium', 630, 746);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (216, 'High', 398, 760);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (217, 'Low', 692, 556);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (218, 'Low', 684, 609);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (219, 'Medium', 549, 829);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (220, 'Medium', 628, 93);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (221, 'Low', 569, 769);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (222, 'Medium', 457, 413);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (223, 'Low', 19, 925);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (224, 'Medium', 431, 198);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (225, 'Medium', 612, 128);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (226, 'Medium', 641, 483);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (227, 'Medium', 381, 174);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (228, 'Medium', 183, 513);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (229, 'Low', 452, 238);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (230, 'Medium', 613, 138);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (231, 'Medium', 468, 373);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (232, 'High', 690, 966);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (233, 'Medium', 175, 946);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (234, 'High', 582, 724);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (235, 'High', 205, 237);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (236, 'High', 649, 847);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (237, 'Medium', 246, 573);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (238, 'Low', 658, 542);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (239, 'Medium', 180, 38);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (240, 'High', 628, 679);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (241, 'High', 4, 28);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (242, 'High', 584, 511);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (243, 'Low', 73, 989);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (244, 'Medium', 249, 87);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (245, 'Medium', 618, 95);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (246, 'Low', 15, 182);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (247, 'High', 333, 876);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (248, 'Medium', 346, 194);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (249, 'Medium', 140, 939);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (250, 'Low', 544, 667);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (251, 'Low', 554, 297);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (252, 'Low', 145, 365);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (253, 'Medium', 529, 786);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (254, 'Medium', 665, 345);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (255, 'Medium', 533, 740);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (256, 'High', 270, 450);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (257, 'Medium', 203, 948);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (258, 'Low', 674, 207);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (259, 'Low', 309, 987);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (260, 'Low', 596, 390);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (261, 'High', 298, 974);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (262, 'Medium', 562, 506);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (263, 'Low', 287, 662);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (264, 'Medium', 438, 429);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (265, 'Low', 278, 517);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (266, 'Medium', 648, 665);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (267, 'Medium', 479, 865);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (268, 'Medium', 568, 319);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (269, 'Medium', 679, 904);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (270, 'High', 436, 397);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (271, 'Medium', 281, 115);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (272, 'Low', 382, 432);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (273, 'High', 667, 171);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (274, 'Medium', 411, 605);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (275, 'Medium', 331, 289);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (276, 'Low', 281, 287);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (277, 'Medium', 91, 504);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (278, 'High', 35, 637);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (279, 'Low', 140, 601);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (280, 'Medium', 99, 145);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (281, 'Low', 428, 138);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (282, 'Low', 281, 768);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (283, 'Medium', 215, 331);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (284, 'High', 199, 737);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (285, 'Low', 169, 800);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (286, 'Medium', 396, 312);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (287, 'High', 479, 394);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (288, 'Medium', 7, 761);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (289, 'Low', 697, 37);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (290, 'Low', 330, 439);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (291, 'Low', 631, 863);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (292, 'Medium', 738, 460);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (293, 'Medium', 499, 71);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (294, 'Medium', 515, 326);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (295, 'Low', 257, 20);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (296, 'Medium', 278, 319);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (297, 'High', 693, 740);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (298, 'Medium', 59, 6);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (299, 'Low', 628, 24);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (300, 'High', 76, 103);
commit;
prompt 300 records committed...
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (301, 'High', 182, 340);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (302, 'Medium', 307, 590);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (303, 'High', 433, 275);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (304, 'Low', 645, 121);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (305, 'High', 385, 489);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (306, 'Medium', 657, 121);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (307, 'Medium', 37, 256);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (308, 'High', 485, 180);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (309, 'Medium', 572, 455);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (310, 'Low', 399, 279);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (311, 'High', 258, 343);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (312, 'High', 97, 792);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (313, 'High', 716, 490);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (314, 'High', 228, 861);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (315, 'Low', 58, 573);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (316, 'Medium', 290, 229);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (317, 'High', 255, 107);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (318, 'Medium', 138, 152);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (319, 'Medium', 356, 568);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (320, 'Low', 185, 813);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (321, 'High', 125, 87);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (322, 'Low', 49, 276);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (323, 'High', 50, 231);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (324, 'Medium', 667, 286);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (325, 'Medium', 323, 159);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (326, 'High', 35, 230);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (327, 'Medium', 128, 506);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (328, 'High', 459, 589);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (329, 'Low', 165, 793);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (330, 'Low', 358, 90);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (331, 'High', 18, 783);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (332, 'Low', 320, 182);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (333, 'Low', 432, 62);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (334, 'Medium', 618, 60);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (335, 'High', 686, 714);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (336, 'Low', 236, 376);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (337, 'Low', 82, 204);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (338, 'Medium', 415, 302);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (339, 'Medium', 95, 780);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (340, 'High', 368, 604);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (341, 'High', 112, 681);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (342, 'Low', 631, 62);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (343, 'Low', 450, 487);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (344, 'Medium', 393, 865);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (345, 'High', 223, 643);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (346, 'Low', 461, 934);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (347, 'High', 731, 633);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (348, 'Low', 632, 682);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (349, 'High', 669, 223);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (350, 'Medium', 494, 284);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (351, 'High', 442, 901);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (352, 'Medium', 557, 332);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (353, 'High', 306, 236);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (354, 'Low', 302, 5);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (355, 'High', 282, 824);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (356, 'Medium', 603, 486);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (357, 'High', 720, 833);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (358, 'High', 541, 695);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (359, 'Medium', 329, 105);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (360, 'Low', 688, 124);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (361, 'Low', 735, 392);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (362, 'Medium', 137, 251);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (363, 'High', 69, 736);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (364, 'Low', 28, 745);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (365, 'Low', 6, 346);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (366, 'High', 7, 205);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (367, 'High', 116, 904);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (368, 'Medium', 634, 745);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (369, 'Low', 493, 163);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (370, 'High', 477, 268);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (371, 'Medium', 45, 150);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (372, 'Medium', 31, 865);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (373, 'High', 90, 255);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (374, 'Low', 513, 215);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (375, 'Medium', 441, 47);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (376, 'Medium', 297, 612);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (377, 'High', 224, 883);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (378, 'High', 176, 3);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (379, 'Medium', 658, 966);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (380, 'High', 684, 555);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (381, 'Medium', 459, 175);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (382, 'Low', 237, 937);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (383, 'High', 385, 892);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (384, 'Low', 416, 661);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (385, 'Medium', 164, 505);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (386, 'Low', 357, 702);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (387, 'Medium', 688, 127);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (388, 'Low', 498, 98);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (389, 'Medium', 727, 16);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (390, 'Medium', 657, 771);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (391, 'High', 468, 28);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (392, 'Low', 233, 415);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (393, 'Low', 425, 831);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (394, 'Low', 337, 788);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (395, 'High', 75, 883);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (396, 'Medium', 102, 880);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (397, 'Low', 5, 623);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (398, 'Low', 582, 55);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (399, 'Medium', 595, 859);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (400, 'Low', 438, 261);
commit;
prompt 400 records committed...
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (401, 'High', 716, 624);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (402, 'Medium', 736, 120);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (403, 'High', 232, 794);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (404, 'High', 423, 100);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (405, 'Medium', 117, 731);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (406, 'Medium', 338, 28);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (407, 'Low', 275, 995);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (408, 'Medium', 612, 242);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (409, 'High', 302, 653);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (410, 'Medium', 740, 695);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (411, 'High', 90, 922);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (412, 'Medium', 481, 896);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (413, 'High', 540, 369);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (414, 'Medium', 697, 997);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (415, 'Low', 402, 147);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (416, 'Low', 682, 207);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (417, 'Low', 529, 568);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (418, 'High', 422, 648);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (419, 'High', 18, 113);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (420, 'Low', 314, 435);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (421, 'Medium', 4, 26);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (422, 'Medium', 573, 231);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (423, 'Low', 139, 201);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (424, 'Low', 336, 134);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (425, 'Medium', 500, 220);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (426, 'Low', 732, 543);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (427, 'Medium', 42, 452);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (428, 'Low', 228, 258);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (429, 'Medium', 740, 56);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (430, 'Medium', 15, 391);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (431, 'Low', 358, 548);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (432, 'High', 428, 81);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (433, 'Low', 301, 76);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (434, 'Medium', 198, 339);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (435, 'High', 489, 366);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (436, 'High', 727, 851);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (437, 'Medium', 61, 512);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (438, 'High', 446, 575);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (439, 'Medium', 339, 984);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (440, 'Low', 515, 922);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (441, 'Medium', 7, 65);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (442, 'Low', 500, 493);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (443, 'High', 489, 203);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (444, 'Medium', 337, 823);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (445, 'Low', 136, 99);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (446, 'Medium', 410, 466);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (447, 'Low', 351, 99);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (448, 'High', 504, 754);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (449, 'Medium', 466, 843);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (450, 'High', 77, 546);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (451, 'Low', 106, 456);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (452, 'Medium', 247, 540);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (453, 'Medium', 82, 355);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (454, 'Low', 55, 887);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (455, 'Medium', 660, 360);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (456, 'Medium', 694, 559);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (457, 'Low', 649, 990);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (458, 'High', 730, 793);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (459, 'High', 550, 43);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (460, 'High', 433, 271);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (461, 'Low', 219, 406);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (462, 'High', 137, 371);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (463, 'High', 689, 908);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (464, 'Low', 74, 662);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (465, 'Low', 361, 133);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (466, 'Medium', 658, 17);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (467, 'Low', 141, 718);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (468, 'Low', 293, 723);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (469, 'Low', 450, 683);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (470, 'Medium', 408, 931);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (471, 'Low', 622, 130);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (472, 'High', 664, 54);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (473, 'Low', 200, 941);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (474, 'Low', 203, 656);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (475, 'High', 436, 106);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (476, 'Medium', 51, 4);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (477, 'Medium', 385, 830);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (478, 'Medium', 330, 782);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (479, 'High', 51, 42);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (480, 'Low', 357, 416);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (481, 'High', 129, 133);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (482, 'High', 135, 157);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (483, 'Low', 206, 829);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (484, 'Low', 180, 463);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (485, 'High', 203, 1);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (486, 'Medium', 652, 926);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (487, 'Low', 173, 606);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (488, 'Medium', 22, 922);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (489, 'Medium', 445, 475);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (490, 'High', 264, 254);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (491, 'Medium', 659, 254);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (492, 'High', 314, 137);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (493, 'Medium', 380, 860);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (494, 'Low', 502, 708);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (495, 'Medium', 72, 450);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (496, 'High', 301, 59);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (497, 'High', 253, 819);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (498, 'Low', 374, 651);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (499, 'Low', 686, 935);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (500, 'High', 470, 143);
commit;
prompt 500 records committed...
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (501, 'High', 534, 849);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (502, 'Medium', 596, 492);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (503, 'Low', 738, 350);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (504, 'Low', 429, 833);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (505, 'High', 346, 274);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (506, 'High', 121, 209);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (507, 'Low', 157, 329);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (508, 'Medium', 432, 658);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (509, 'Medium', 495, 34);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (510, 'High', 226, 864);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (511, 'Medium', 618, 55);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (512, 'Medium', 146, 905);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (513, 'High', 9, 11);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (514, 'Medium', 228, 465);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (515, 'Low', 547, 629);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (516, 'High', 178, 997);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (517, 'High', 400, 875);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (518, 'Low', 634, 195);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (519, 'Medium', 445, 945);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (520, 'Low', 585, 652);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (521, 'Medium', 688, 109);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (522, 'Medium', 406, 695);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (523, 'High', 669, 525);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (524, 'High', 255, 347);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (525, 'Medium', 397, 927);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (526, 'Medium', 123, 949);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (527, 'Medium', 178, 8);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (528, 'Medium', 159, 626);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (529, 'Medium', 434, 574);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (530, 'High', 175, 132);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (531, 'High', 65, 5);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (532, 'Medium', 187, 449);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (533, 'Medium', 380, 908);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (534, 'Low', 218, 629);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (535, 'High', 315, 593);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (536, 'High', 437, 207);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (537, 'Medium', 423, 40);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (538, 'Medium', 511, 68);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (539, 'High', 659, 459);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (540, 'Medium', 669, 882);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (541, 'Medium', 559, 269);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (542, 'High', 663, 51);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (543, 'Low', 450, 144);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (544, 'High', 224, 966);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (545, 'Medium', 4, 222);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (546, 'High', 237, 807);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (547, 'High', 21, 498);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (548, 'Low', 693, 90);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (549, 'Medium', 413, 915);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (550, 'Medium', 584, 30);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (551, 'Low', 202, 581);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (552, 'Low', 369, 600);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (553, 'High', 600, 24);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (554, 'Medium', 293, 121);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (555, 'Medium', 508, 120);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (556, 'Low', 85, 217);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (557, 'Medium', 44, 381);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (558, 'Medium', 94, 226);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (559, 'High', 79, 46);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (560, 'Medium', 93, 913);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (561, 'Medium', 314, 812);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (562, 'High', 7, 765);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (563, 'Low', 36, 306);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (564, 'Low', 130, 862);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (565, 'High', 438, 79);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (566, 'Medium', 561, 237);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (567, 'Low', 653, 122);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (568, 'Medium', 576, 619);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (569, 'Medium', 415, 454);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (570, 'Low', 511, 885);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (571, 'High', 343, 841);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (572, 'Low', 631, 930);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (573, 'High', 83, 374);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (574, 'Low', 178, 189);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (575, 'Low', 67, 100);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (576, 'Low', 683, 70);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (577, 'Low', 490, 885);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (578, 'Low', 90, 268);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (579, 'Medium', 441, 906);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (580, 'High', 379, 84);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (581, 'Medium', 372, 721);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (582, 'High', 613, 229);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (583, 'High', 325, 904);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (584, 'Medium', 362, 20);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (585, 'High', 600, 364);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (586, 'Low', 551, 118);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (587, 'Low', 98, 446);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (588, 'Medium', 71, 967);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (589, 'Low', 177, 153);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (590, 'Low', 680, 859);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (591, 'Medium', 18, 361);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (592, 'Low', 59, 473);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (593, 'High', 661, 871);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (594, 'Medium', 39, 612);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (595, 'Medium', 584, 357);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (596, 'Low', 418, 985);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (597, 'Medium', 628, 762);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (598, 'Medium', 312, 243);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (599, 'Medium', 639, 494);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (600, 'High', 12, 976);
commit;
prompt 600 records committed...
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (601, 'Medium', 636, 305);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (602, 'Medium', 408, 886);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (603, 'High', 232, 899);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (604, 'Low', 142, 298);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (605, 'High', 204, 879);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (606, 'Medium', 221, 917);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (607, 'Medium', 104, 489);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (608, 'Medium', 28, 239);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (609, 'Low', 556, 216);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (610, 'Low', 694, 290);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (611, 'High', 646, 442);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (612, 'High', 56, 44);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (613, 'Low', 467, 727);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (614, 'Low', 309, 17);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (615, 'Medium', 520, 959);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (616, 'Medium', 47, 298);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (617, 'High', 333, 770);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (618, 'Medium', 301, 994);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (619, 'Medium', 377, 86);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (620, 'Low', 36, 717);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (621, 'Medium', 137, 2);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (622, 'Medium', 86, 496);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (623, 'High', 286, 467);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (624, 'Medium', 210, 658);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (625, 'Low', 638, 135);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (626, 'Low', 255, 994);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (627, 'Low', 168, 491);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (628, 'High', 8, 228);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (629, 'High', 305, 206);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (630, 'Medium', 49, 56);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (631, 'Medium', 329, 946);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (632, 'Low', 678, 598);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (633, 'High', 430, 925);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (634, 'Low', 3, 128);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (635, 'High', 229, 410);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (636, 'Low', 271, 498);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (637, 'High', 251, 836);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (638, 'Medium', 483, 824);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (639, 'Medium', 94, 723);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (640, 'Low', 391, 85);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (641, 'Low', 497, 826);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (642, 'Low', 460, 695);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (643, 'Low', 110, 374);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (644, 'High', 654, 653);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (645, 'Medium', 176, 551);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (646, 'High', 649, 777);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (647, 'High', 567, 220);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (648, 'High', 208, 453);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (649, 'Low', 624, 13);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (650, 'Low', 471, 22);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (651, 'Low', 260, 368);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (652, 'Low', 428, 174);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (653, 'Medium', 142, 346);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (654, 'Medium', 66, 719);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (655, 'High', 320, 747);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (656, 'Medium', 311, 267);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (657, 'Low', 306, 301);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (658, 'Medium', 667, 742);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (659, 'Medium', 308, 886);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (660, 'High', 536, 459);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (661, 'Low', 283, 181);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (662, 'Low', 625, 995);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (663, 'Low', 595, 79);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (664, 'High', 181, 690);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (665, 'High', 333, 1000);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (666, 'Low', 11, 218);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (667, 'Low', 673, 718);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (668, 'High', 615, 590);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (669, 'Low', 518, 853);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (670, 'High', 555, 504);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (671, 'Low', 66, 807);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (672, 'Medium', 106, 100);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (673, 'Low', 208, 458);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (674, 'High', 734, 586);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (675, 'Low', 181, 856);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (676, 'High', 507, 239);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (677, 'Medium', 523, 925);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (678, 'Medium', 698, 386);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (679, 'Medium', 684, 133);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (680, 'Medium', 502, 34);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (681, 'Low', 290, 871);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (682, 'High', 266, 737);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (683, 'Low', 4, 1);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (684, 'Medium', 695, 380);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (685, 'Medium', 650, 540);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (686, 'High', 49, 511);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (687, 'High', 692, 319);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (688, 'Low', 489, 882);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (689, 'Medium', 738, 147);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (690, 'Low', 323, 256);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (691, 'High', 379, 784);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (692, 'High', 299, 858);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (693, 'Medium', 444, 688);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (694, 'High', 503, 986);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (695, 'High', 557, 378);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (696, 'High', 414, 798);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (697, 'Low', 307, 478);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (698, 'High', 339, 805);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (699, 'Low', 344, 856);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (700, 'Medium', 678, 559);
commit;
prompt 700 records committed...
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (701, 'Low', 124, 434);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (702, 'Medium', 224, 405);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (703, 'Medium', 3, 572);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (704, 'Low', 686, 301);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (705, 'Medium', 609, 124);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (706, 'Low', 394, 768);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (707, 'Medium', 714, 42);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (708, 'Medium', 612, 483);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (709, 'Low', 304, 847);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (710, 'Low', 603, 144);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (711, 'High', 15, 157);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (712, 'High', 138, 911);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (713, 'High', 618, 630);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (714, 'High', 554, 870);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (715, 'Medium', 652, 48);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (716, 'Medium', 84, 626);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (717, 'High', 429, 722);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (718, 'Low', 29, 296);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (719, 'Medium', 67, 748);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (720, 'Low', 346, 185);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (721, 'High', 192, 544);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (722, 'High', 429, 718);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (723, 'High', 577, 44);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (724, 'High', 585, 562);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (725, 'Medium', 356, 93);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (726, 'High', 562, 56);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (727, 'Low', 546, 914);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (728, 'High', 277, 280);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (729, 'Medium', 130, 676);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (730, 'Low', 109, 367);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (731, 'Low', 683, 454);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (732, 'Medium', 435, 640);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (733, 'High', 131, 305);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (734, 'Low', 259, 647);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (735, 'Medium', 280, 285);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (736, 'Low', 277, 270);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (737, 'Medium', 107, 72);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (738, 'High', 364, 481);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (739, 'Medium', 662, 977);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (740, 'High', 89, 534);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (741, 'Medium', 665, 126);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (742, 'High', 676, 722);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (743, 'High', 577, 350);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (744, 'Medium', 701, 745);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (745, 'Low', 437, 385);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (746, 'Medium', 284, 507);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (747, 'High', 101, 400);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (748, 'Medium', 236, 648);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (749, 'Low', 219, 765);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (750, 'Medium', 410, 92);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (751, 'Low', 396, 807);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (752, 'Low', 624, 789);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (753, 'Low', 2, 13);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (754, 'Low', 113, 167);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (755, 'Low', 416, 475);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (756, 'Low', 100, 932);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (757, 'Medium', 624, 168);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (758, 'High', 675, 521);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (759, 'Low', 651, 59);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (760, 'High', 286, 527);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (761, 'High', 676, 520);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (762, 'Low', 319, 624);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (763, 'Medium', 434, 140);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (764, 'High', 189, 561);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (765, 'Low', 130, 878);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (766, 'Medium', 79, 727);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (767, 'High', 706, 558);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (768, 'Low', 554, 929);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (769, 'Low', 149, 743);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (770, 'High', 316, 453);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (771, 'Low', 704, 683);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (772, 'Medium', 103, 167);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (773, 'Medium', 238, 55);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (774, 'Medium', 45, 307);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (775, 'Low', 657, 604);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (776, 'Low', 454, 431);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (777, 'Low', 551, 413);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (778, 'High', 461, 901);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (779, 'High', 443, 683);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (780, 'High', 376, 875);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (781, 'High', 203, 259);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (782, 'Medium', 207, 454);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (783, 'Medium', 207, 66);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (784, 'High', 111, 713);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (785, 'High', 705, 989);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (786, 'Medium', 659, 211);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (787, 'Medium', 162, 18);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (788, 'High', 659, 903);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (789, 'Medium', 412, 486);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (790, 'Medium', 336, 760);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (791, 'High', 22, 474);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (792, 'High', 198, 777);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (793, 'Medium', 598, 806);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (794, 'Medium', 207, 874);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (795, 'Medium', 227, 767);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (796, 'High', 341, 549);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (797, 'High', 575, 966);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (798, 'Medium', 694, 163);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (799, 'Low', 456, 763);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (800, 'High', 93, 621);
commit;
prompt 800 records committed...
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (801, 'High', 376, 967);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (802, 'Low', 547, 886);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (803, 'Low', 306, 612);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (804, 'High', 465, 982);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (805, 'High', 486, 363);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (806, 'Medium', 149, 574);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (807, 'Medium', 517, 420);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (808, 'High', 482, 421);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (809, 'Low', 290, 961);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (810, 'Low', 292, 23);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (811, 'Low', 599, 111);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (812, 'Medium', 648, 661);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (813, 'High', 350, 570);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (814, 'Medium', 228, 348);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (815, 'Medium', 447, 97);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (816, 'Medium', 14, 343);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (817, 'Medium', 682, 686);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (818, 'Low', 378, 150);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (819, 'High', 669, 221);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (820, 'High', 345, 45);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (821, 'High', 693, 371);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (822, 'High', 184, 137);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (823, 'High', 74, 581);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (824, 'Low', 578, 994);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (825, 'Low', 404, 309);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (826, 'High', 478, 882);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (827, 'Low', 571, 625);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (828, 'Medium', 109, 382);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (829, 'Low', 536, 65);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (830, 'Medium', 343, 859);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (831, 'High', 630, 227);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (832, 'Low', 542, 347);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (833, 'Medium', 652, 104);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (834, 'High', 340, 113);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (835, 'Medium', 456, 446);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (836, 'Medium', 716, 488);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (837, 'High', 677, 134);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (838, 'High', 334, 865);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (839, 'High', 223, 330);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (840, 'Medium', 549, 775);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (841, 'Medium', 435, 687);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (842, 'Low', 616, 619);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (843, 'Low', 737, 452);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (844, 'Low', 683, 331);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (845, 'Medium', 118, 88);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (846, 'Medium', 400, 80);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (847, 'Medium', 96, 776);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (848, 'Medium', 74, 657);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (849, 'Low', 328, 134);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (850, 'Medium', 428, 739);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (851, 'Low', 197, 585);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (852, 'High', 615, 605);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (853, 'Medium', 259, 568);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (854, 'Medium', 224, 112);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (855, 'High', 430, 343);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (856, 'High', 136, 613);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (857, 'Low', 381, 734);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (858, 'High', 417, 621);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (859, 'Low', 495, 692);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (860, 'High', 303, 885);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (861, 'Low', 254, 836);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (862, 'Low', 27, 903);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (863, 'Medium', 678, 981);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (864, 'Low', 719, 439);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (865, 'High', 29, 250);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (866, 'High', 298, 103);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (867, 'High', 104, 544);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (868, 'High', 168, 439);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (869, 'Low', 87, 881);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (870, 'Low', 223, 799);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (871, 'Medium', 120, 473);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (872, 'Low', 108, 819);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (873, 'High', 135, 311);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (874, 'Low', 668, 252);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (875, 'High', 209, 876);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (876, 'Medium', 702, 924);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (877, 'Low', 722, 955);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (878, 'Medium', 177, 685);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (879, 'High', 712, 563);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (880, 'High', 301, 857);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (881, 'High', 311, 484);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (882, 'Low', 673, 901);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (883, 'High', 344, 699);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (884, 'Low', 107, 604);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (885, 'Medium', 567, 846);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (886, 'Medium', 592, 870);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (887, 'Low', 253, 264);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (888, 'High', 475, 134);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (889, 'Low', 56, 345);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (890, 'Low', 429, 122);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (891, 'Medium', 423, 576);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (892, 'High', 546, 386);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (893, 'High', 698, 841);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (894, 'High', 71, 489);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (895, 'Low', 81, 89);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (896, 'Medium', 404, 347);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (897, 'Low', 528, 538);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (898, 'Medium', 18, 439);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (899, 'High', 94, 43);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (900, 'Low', 424, 767);
commit;
prompt 900 records committed...
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (901, 'Medium', 626, 275);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (902, 'High', 344, 585);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (903, 'Medium', 701, 44);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (904, 'Medium', 542, 477);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (905, 'Low', 343, 92);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (906, 'Medium', 221, 524);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (907, 'High', 34, 344);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (908, 'Low', 308, 178);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (909, 'High', 304, 307);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (910, 'High', 306, 54);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (911, 'Medium', 584, 395);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (912, 'Low', 233, 824);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (913, 'Low', 318, 242);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (914, 'High', 668, 47);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (915, 'Medium', 498, 569);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (916, 'Low', 500, 124);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (917, 'Medium', 554, 132);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (918, 'High', 292, 287);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (919, 'Medium', 555, 771);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (920, 'High', 234, 527);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (921, 'High', 58, 84);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (922, 'High', 656, 582);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (923, 'Low', 262, 110);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (924, 'Medium', 13, 103);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (925, 'Medium', 365, 577);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (926, 'High', 122, 220);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (927, 'High', 33, 720);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (928, 'Medium', 376, 342);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (929, 'Low', 406, 304);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (930, 'Low', 712, 655);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (931, 'High', 406, 911);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (932, 'Medium', 558, 17);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (933, 'Low', 305, 604);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (934, 'Low', 198, 460);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (935, 'Medium', 161, 851);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (936, 'High', 709, 449);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (937, 'Medium', 67, 876);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (938, 'Medium', 36, 788);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (939, 'High', 697, 620);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (940, 'High', 737, 521);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (941, 'Low', 218, 702);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (942, 'Low', 602, 192);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (943, 'High', 731, 258);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (944, 'Low', 635, 711);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (945, 'High', 366, 515);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (946, 'Medium', 596, 47);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (947, 'Medium', 403, 537);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (948, 'High', 623, 691);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (949, 'High', 89, 309);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (950, 'Low', 53, 177);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (951, 'Medium', 652, 332);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (952, 'High', 453, 392);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (953, 'High', 681, 542);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (954, 'Medium', 491, 562);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (955, 'Medium', 725, 903);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (956, 'Low', 633, 798);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (957, 'High', 361, 832);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (958, 'Medium', 553, 667);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (959, 'Medium', 207, 615);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (960, 'Medium', 47, 450);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (961, 'Medium', 645, 900);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (962, 'Medium', 729, 230);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (963, 'Medium', 73, 64);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (964, 'Medium', 661, 299);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (965, 'Medium', 516, 535);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (966, 'Medium', 139, 663);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (967, 'Medium', 306, 6);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (968, 'Low', 132, 689);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (969, 'Medium', 686, 306);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (970, 'Medium', 247, 961);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (971, 'Medium', 313, 916);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (972, 'Medium', 212, 535);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (973, 'High', 353, 982);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (974, 'Medium', 139, 155);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (975, 'Medium', 154, 827);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (976, 'High', 406, 632);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (977, 'High', 417, 410);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (978, 'High', 91, 803);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (979, 'High', 409, 424);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (980, 'Low', 726, 351);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (981, 'Medium', 713, 472);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (982, 'Low', 21, 8);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (983, 'Low', 133, 324);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (984, 'Low', 157, 494);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (985, 'Medium', 61, 101);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (986, 'High', 663, 317);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (987, 'High', 328, 210);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (988, 'Low', 660, 732);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (989, 'Low', 281, 814);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (990, 'High', 164, 944);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (991, 'High', 318, 638);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (992, 'Medium', 249, 634);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (993, 'Low', 451, 690);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (994, 'High', 405, 849);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (995, 'High', 707, 855);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (996, 'High', 351, 280);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (997, 'Medium', 8, 161);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (998, 'High', 732, 350);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (999, 'Low', 546, 917);
insert into MAINTENANCEREQUEST_ (requestid, urgency, deptid, locationid)
values (1000, 'High', 521, 468);
commit;
prompt 1000 records loaded
prompt Loading TASK...
insert into TASK (requestid, startdate, enddate, status, deptid)
values (1, to_date('27-09-2023', 'dd-mm-yyyy'), to_date('04-08-2023', 'dd-mm-yyyy'), 'InProgress', 1);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (2, to_date('28-10-2023', 'dd-mm-yyyy'), to_date('25-12-2023', 'dd-mm-yyyy'), 'Pending', 2);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (3, to_date('13-04-2024', 'dd-mm-yyyy'), to_date('02-05-2024', 'dd-mm-yyyy'), 'InProgress', 3);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (4, to_date('16-07-2023', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'), 'Pending', 4);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (5, to_date('11-05-2024', 'dd-mm-yyyy'), to_date('10-05-2024', 'dd-mm-yyyy'), 'InProgress', 5);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (6, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'), 'Pending', 6);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (7, to_date('20-04-2024', 'dd-mm-yyyy'), to_date('06-06-2024', 'dd-mm-yyyy'), 'Pending', 7);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (8, to_date('10-11-2023', 'dd-mm-yyyy'), to_date('13-12-2023', 'dd-mm-yyyy'), 'Pending', 8);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (9, to_date('06-08-2023', 'dd-mm-yyyy'), to_date('19-12-2023', 'dd-mm-yyyy'), 'Completed', 9);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (10, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('16-05-2024', 'dd-mm-yyyy'), 'Pending', 10);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (11, to_date('19-01-2024', 'dd-mm-yyyy'), to_date('19-12-2023', 'dd-mm-yyyy'), 'Completed', 11);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (12, to_date('03-09-2023', 'dd-mm-yyyy'), to_date('17-08-2023', 'dd-mm-yyyy'), 'InProgress', 12);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (13, to_date('02-10-2023', 'dd-mm-yyyy'), to_date('12-03-2024', 'dd-mm-yyyy'), 'Pending', 13);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (14, to_date('15-01-2024', 'dd-mm-yyyy'), to_date('12-06-2024', 'dd-mm-yyyy'), 'Completed', 14);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (15, to_date('14-03-2024', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'), 'InProgress', 15);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (16, to_date('21-07-2023', 'dd-mm-yyyy'), to_date('29-12-2023', 'dd-mm-yyyy'), 'Pending', 16);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (17, to_date('10-12-2023', 'dd-mm-yyyy'), to_date('13-02-2024', 'dd-mm-yyyy'), 'Completed', 17);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (18, to_date('07-09-2023', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'), 'Completed', 18);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (19, to_date('11-10-2023', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'), 'Pending', 19);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (20, to_date('01-05-2024', 'dd-mm-yyyy'), to_date('20-07-2023', 'dd-mm-yyyy'), 'InProgress', 20);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (21, to_date('25-06-2024', 'dd-mm-yyyy'), to_date('19-07-2023', 'dd-mm-yyyy'), 'Completed', 21);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (22, to_date('19-01-2024', 'dd-mm-yyyy'), to_date('28-10-2023', 'dd-mm-yyyy'), 'Completed', 22);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (23, to_date('26-09-2023', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'), 'Pending', 23);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (24, to_date('27-12-2023', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'), 'InProgress', 24);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (25, to_date('07-07-2023', 'dd-mm-yyyy'), to_date('19-02-2024', 'dd-mm-yyyy'), 'Pending', 25);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (26, to_date('06-11-2023', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'), 'Completed', 26);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (27, to_date('02-11-2023', 'dd-mm-yyyy'), to_date('06-08-2023', 'dd-mm-yyyy'), 'InProgress', 27);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (28, to_date('09-11-2023', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'), 'Completed', 28);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (29, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('07-06-2024', 'dd-mm-yyyy'), 'Completed', 29);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (30, to_date('16-02-2024', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'), 'InProgress', 30);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (31, to_date('08-07-2023', 'dd-mm-yyyy'), to_date('27-10-2023', 'dd-mm-yyyy'), 'Pending', 31);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (32, to_date('23-03-2024', 'dd-mm-yyyy'), to_date('30-04-2024', 'dd-mm-yyyy'), 'Pending', 32);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (33, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('31-07-2023', 'dd-mm-yyyy'), 'InProgress', 33);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (34, to_date('30-04-2024', 'dd-mm-yyyy'), to_date('23-06-2024', 'dd-mm-yyyy'), 'InProgress', 34);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (35, to_date('12-07-2023', 'dd-mm-yyyy'), to_date('28-07-2023', 'dd-mm-yyyy'), 'Pending', 35);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (36, to_date('12-07-2023', 'dd-mm-yyyy'), to_date('29-03-2024', 'dd-mm-yyyy'), 'Completed', 36);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (37, to_date('24-10-2023', 'dd-mm-yyyy'), to_date('31-05-2024', 'dd-mm-yyyy'), 'InProgress', 37);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (38, to_date('02-12-2023', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'), 'Completed', 38);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (39, to_date('24-07-2023', 'dd-mm-yyyy'), to_date('30-09-2023', 'dd-mm-yyyy'), 'Completed', 39);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (40, to_date('02-10-2023', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'), 'InProgress', 40);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (41, to_date('27-10-2023', 'dd-mm-yyyy'), to_date('17-12-2023', 'dd-mm-yyyy'), 'Completed', 41);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (42, to_date('14-05-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 'Completed', 42);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (43, to_date('01-06-2024', 'dd-mm-yyyy'), to_date('14-06-2024', 'dd-mm-yyyy'), 'Pending', 43);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (44, to_date('13-04-2024', 'dd-mm-yyyy'), to_date('23-06-2024', 'dd-mm-yyyy'), 'Pending', 44);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (45, to_date('14-10-2023', 'dd-mm-yyyy'), to_date('06-02-2024', 'dd-mm-yyyy'), 'Pending', 45);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (46, to_date('07-03-2024', 'dd-mm-yyyy'), to_date('07-02-2024', 'dd-mm-yyyy'), 'InProgress', 46);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (47, to_date('23-06-2024', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'), 'Pending', 47);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (48, to_date('08-10-2023', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), 'Completed', 48);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (49, to_date('12-03-2024', 'dd-mm-yyyy'), to_date('09-12-2023', 'dd-mm-yyyy'), 'InProgress', 49);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (50, to_date('06-07-2024', 'dd-mm-yyyy'), to_date('11-05-2024', 'dd-mm-yyyy'), 'InProgress', 50);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (51, to_date('08-07-2023', 'dd-mm-yyyy'), to_date('17-09-2023', 'dd-mm-yyyy'), 'Pending', 51);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (52, to_date('22-10-2023', 'dd-mm-yyyy'), to_date('06-06-2024', 'dd-mm-yyyy'), 'InProgress', 52);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (53, to_date('23-10-2023', 'dd-mm-yyyy'), to_date('13-02-2024', 'dd-mm-yyyy'), 'Completed', 53);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (54, to_date('16-09-2023', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'), 'Completed', 54);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (55, to_date('18-10-2023', 'dd-mm-yyyy'), to_date('14-09-2023', 'dd-mm-yyyy'), 'Pending', 55);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (56, to_date('23-04-2024', 'dd-mm-yyyy'), to_date('31-01-2024', 'dd-mm-yyyy'), 'Pending', 56);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (57, to_date('15-03-2024', 'dd-mm-yyyy'), to_date('03-06-2024', 'dd-mm-yyyy'), 'Pending', 57);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (58, to_date('30-07-2023', 'dd-mm-yyyy'), to_date('27-06-2024', 'dd-mm-yyyy'), 'InProgress', 58);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (59, to_date('05-11-2023', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 'InProgress', 59);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (60, to_date('30-05-2024', 'dd-mm-yyyy'), to_date('20-11-2023', 'dd-mm-yyyy'), 'Pending', 60);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (61, to_date('02-02-2024', 'dd-mm-yyyy'), to_date('19-07-2023', 'dd-mm-yyyy'), 'InProgress', 61);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (62, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('06-12-2023', 'dd-mm-yyyy'), 'Pending', 62);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (63, to_date('20-05-2024', 'dd-mm-yyyy'), to_date('19-10-2023', 'dd-mm-yyyy'), 'Completed', 63);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (64, to_date('04-02-2024', 'dd-mm-yyyy'), to_date('28-05-2024', 'dd-mm-yyyy'), 'Completed', 64);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (65, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('19-01-2024', 'dd-mm-yyyy'), 'Pending', 65);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (66, to_date('09-06-2024', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'), 'InProgress', 66);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (67, to_date('16-07-2023', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'), 'InProgress', 67);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (68, to_date('30-08-2023', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'), 'Completed', 68);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (69, to_date('02-03-2024', 'dd-mm-yyyy'), to_date('04-09-2023', 'dd-mm-yyyy'), 'Completed', 69);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (70, to_date('03-12-2023', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), 'Completed', 70);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (71, to_date('26-09-2023', 'dd-mm-yyyy'), to_date('08-09-2023', 'dd-mm-yyyy'), 'Pending', 71);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (72, to_date('15-07-2023', 'dd-mm-yyyy'), to_date('17-05-2024', 'dd-mm-yyyy'), 'InProgress', 72);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (73, to_date('25-07-2023', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'), 'Pending', 73);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (74, to_date('26-08-2023', 'dd-mm-yyyy'), to_date('24-07-2023', 'dd-mm-yyyy'), 'Completed', 74);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (75, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('15-06-2024', 'dd-mm-yyyy'), 'Pending', 75);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (76, to_date('08-05-2024', 'dd-mm-yyyy'), to_date('10-08-2023', 'dd-mm-yyyy'), 'Pending', 76);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (77, to_date('22-12-2023', 'dd-mm-yyyy'), to_date('26-06-2024', 'dd-mm-yyyy'), 'Pending', 77);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (78, to_date('19-12-2023', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'), 'Pending', 78);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (79, to_date('21-12-2023', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'), 'InProgress', 79);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (80, to_date('22-12-2023', 'dd-mm-yyyy'), to_date('24-06-2024', 'dd-mm-yyyy'), 'Completed', 80);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (81, to_date('09-01-2024', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'), 'Pending', 81);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (82, to_date('05-06-2024', 'dd-mm-yyyy'), to_date('17-05-2024', 'dd-mm-yyyy'), 'Completed', 82);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (83, to_date('22-07-2023', 'dd-mm-yyyy'), to_date('29-10-2023', 'dd-mm-yyyy'), 'Pending', 83);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (84, to_date('01-09-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), 'Completed', 84);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (85, to_date('05-05-2024', 'dd-mm-yyyy'), to_date('14-05-2024', 'dd-mm-yyyy'), 'InProgress', 85);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (86, to_date('23-08-2023', 'dd-mm-yyyy'), to_date('14-03-2024', 'dd-mm-yyyy'), 'Completed', 86);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (87, to_date('26-11-2023', 'dd-mm-yyyy'), to_date('30-10-2023', 'dd-mm-yyyy'), 'Completed', 87);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (88, to_date('03-08-2023', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), 'Pending', 88);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (89, to_date('29-02-2024', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'), 'InProgress', 89);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (90, to_date('22-02-2024', 'dd-mm-yyyy'), to_date('17-04-2024', 'dd-mm-yyyy'), 'Completed', 90);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (91, to_date('16-11-2023', 'dd-mm-yyyy'), to_date('03-08-2023', 'dd-mm-yyyy'), 'Completed', 91);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (92, to_date('24-05-2024', 'dd-mm-yyyy'), to_date('11-07-2023', 'dd-mm-yyyy'), 'InProgress', 92);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (93, to_date('14-12-2023', 'dd-mm-yyyy'), to_date('04-05-2024', 'dd-mm-yyyy'), 'Pending', 93);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (94, to_date('03-06-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 'InProgress', 94);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (95, to_date('29-01-2024', 'dd-mm-yyyy'), to_date('18-09-2023', 'dd-mm-yyyy'), 'Pending', 95);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (96, to_date('05-09-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), 'Pending', 96);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (97, to_date('31-07-2023', 'dd-mm-yyyy'), to_date('29-06-2024', 'dd-mm-yyyy'), 'Pending', 97);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (98, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('01-03-2024', 'dd-mm-yyyy'), 'InProgress', 98);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (99, to_date('05-10-2023', 'dd-mm-yyyy'), to_date('23-04-2024', 'dd-mm-yyyy'), 'InProgress', 99);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (100, to_date('04-08-2023', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'), 'InProgress', 100);
commit;
prompt 100 records committed...
insert into TASK (requestid, startdate, enddate, status, deptid)
values (101, to_date('12-05-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 'Completed', 101);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (102, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('04-08-2023', 'dd-mm-yyyy'), 'Completed', 102);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (103, to_date('15-03-2024', 'dd-mm-yyyy'), to_date('20-06-2024', 'dd-mm-yyyy'), 'Pending', 103);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (104, to_date('27-07-2023', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'), 'Pending', 104);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (105, to_date('25-11-2023', 'dd-mm-yyyy'), to_date('18-12-2023', 'dd-mm-yyyy'), 'InProgress', 105);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (106, to_date('21-06-2024', 'dd-mm-yyyy'), to_date('24-06-2024', 'dd-mm-yyyy'), 'InProgress', 106);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (107, to_date('27-07-2023', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'), 'InProgress', 107);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (108, to_date('12-12-2023', 'dd-mm-yyyy'), to_date('23-03-2024', 'dd-mm-yyyy'), 'Pending', 108);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (109, to_date('17-10-2023', 'dd-mm-yyyy'), to_date('08-02-2024', 'dd-mm-yyyy'), 'Pending', 109);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (110, to_date('21-07-2023', 'dd-mm-yyyy'), to_date('28-09-2023', 'dd-mm-yyyy'), 'InProgress', 110);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (111, to_date('13-07-2023', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'), 'Pending', 111);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (112, to_date('01-02-2024', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'), 'Completed', 112);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (113, to_date('26-02-2024', 'dd-mm-yyyy'), to_date('07-11-2023', 'dd-mm-yyyy'), 'Completed', 113);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (114, to_date('22-11-2023', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'), 'Pending', 114);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (115, to_date('24-06-2024', 'dd-mm-yyyy'), to_date('31-01-2024', 'dd-mm-yyyy'), 'Completed', 115);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (116, to_date('13-02-2024', 'dd-mm-yyyy'), to_date('29-12-2023', 'dd-mm-yyyy'), 'Pending', 116);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (117, to_date('26-03-2024', 'dd-mm-yyyy'), to_date('05-07-2024', 'dd-mm-yyyy'), 'Completed', 117);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (118, to_date('25-07-2023', 'dd-mm-yyyy'), to_date('02-08-2023', 'dd-mm-yyyy'), 'Pending', 118);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (119, to_date('28-07-2023', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'), 'Completed', 119);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (120, to_date('02-10-2023', 'dd-mm-yyyy'), to_date('29-10-2023', 'dd-mm-yyyy'), 'Pending', 120);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (121, to_date('28-05-2024', 'dd-mm-yyyy'), to_date('13-12-2023', 'dd-mm-yyyy'), 'Pending', 121);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (122, to_date('13-07-2023', 'dd-mm-yyyy'), to_date('09-05-2024', 'dd-mm-yyyy'), 'InProgress', 122);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (123, to_date('28-12-2023', 'dd-mm-yyyy'), to_date('25-09-2023', 'dd-mm-yyyy'), 'Pending', 123);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (124, to_date('25-11-2023', 'dd-mm-yyyy'), to_date('03-12-2023', 'dd-mm-yyyy'), 'Pending', 124);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (125, to_date('17-04-2024', 'dd-mm-yyyy'), to_date('17-12-2023', 'dd-mm-yyyy'), 'Pending', 125);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (126, to_date('08-01-2024', 'dd-mm-yyyy'), to_date('04-04-2024', 'dd-mm-yyyy'), 'Pending', 126);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (127, to_date('22-07-2023', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), 'Completed', 127);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (128, to_date('21-07-2023', 'dd-mm-yyyy'), to_date('16-09-2023', 'dd-mm-yyyy'), 'Completed', 128);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (129, to_date('25-03-2024', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'), 'InProgress', 129);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (130, to_date('06-03-2024', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), 'Pending', 130);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (131, to_date('03-05-2024', 'dd-mm-yyyy'), to_date('30-11-2023', 'dd-mm-yyyy'), 'Completed', 131);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (132, to_date('17-03-2024', 'dd-mm-yyyy'), to_date('18-03-2024', 'dd-mm-yyyy'), 'InProgress', 132);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (133, to_date('29-11-2023', 'dd-mm-yyyy'), to_date('18-10-2023', 'dd-mm-yyyy'), 'Pending', 133);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (134, to_date('13-11-2023', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'), 'InProgress', 134);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (135, to_date('13-01-2024', 'dd-mm-yyyy'), to_date('03-01-2024', 'dd-mm-yyyy'), 'InProgress', 135);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (136, to_date('06-02-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 'Pending', 136);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (137, to_date('28-04-2024', 'dd-mm-yyyy'), to_date('15-04-2024', 'dd-mm-yyyy'), 'InProgress', 137);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (138, to_date('06-03-2024', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'), 'Pending', 138);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (139, to_date('02-09-2023', 'dd-mm-yyyy'), to_date('20-08-2023', 'dd-mm-yyyy'), 'Pending', 139);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (140, to_date('15-05-2024', 'dd-mm-yyyy'), to_date('11-11-2023', 'dd-mm-yyyy'), 'Completed', 140);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (141, to_date('01-09-2023', 'dd-mm-yyyy'), to_date('13-02-2024', 'dd-mm-yyyy'), 'Completed', 141);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (142, to_date('21-12-2023', 'dd-mm-yyyy'), to_date('22-02-2024', 'dd-mm-yyyy'), 'Pending', 142);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (143, to_date('29-08-2023', 'dd-mm-yyyy'), to_date('26-11-2023', 'dd-mm-yyyy'), 'Completed', 143);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (144, to_date('16-05-2024', 'dd-mm-yyyy'), to_date('05-08-2023', 'dd-mm-yyyy'), 'InProgress', 144);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (145, to_date('24-06-2024', 'dd-mm-yyyy'), to_date('29-06-2024', 'dd-mm-yyyy'), 'InProgress', 145);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (146, to_date('06-06-2024', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'), 'Completed', 146);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (147, to_date('21-08-2023', 'dd-mm-yyyy'), to_date('10-11-2023', 'dd-mm-yyyy'), 'Completed', 147);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (148, to_date('05-08-2023', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'), 'Completed', 148);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (149, to_date('08-12-2023', 'dd-mm-yyyy'), to_date('12-07-2023', 'dd-mm-yyyy'), 'InProgress', 149);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (150, to_date('24-04-2024', 'dd-mm-yyyy'), to_date('21-10-2023', 'dd-mm-yyyy'), 'Pending', 150);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (151, to_date('13-07-2023', 'dd-mm-yyyy'), to_date('27-02-2024', 'dd-mm-yyyy'), 'Pending', 151);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (152, to_date('02-08-2023', 'dd-mm-yyyy'), to_date('03-11-2023', 'dd-mm-yyyy'), 'Pending', 152);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (153, to_date('16-01-2024', 'dd-mm-yyyy'), to_date('05-02-2024', 'dd-mm-yyyy'), 'Pending', 153);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (154, to_date('08-09-2023', 'dd-mm-yyyy'), to_date('08-02-2024', 'dd-mm-yyyy'), 'Completed', 154);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (155, to_date('05-12-2023', 'dd-mm-yyyy'), to_date('04-09-2023', 'dd-mm-yyyy'), 'Pending', 155);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (156, to_date('31-08-2023', 'dd-mm-yyyy'), to_date('21-01-2024', 'dd-mm-yyyy'), 'Pending', 156);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (157, to_date('09-12-2023', 'dd-mm-yyyy'), to_date('17-10-2023', 'dd-mm-yyyy'), 'Completed', 157);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (158, to_date('06-12-2023', 'dd-mm-yyyy'), to_date('20-09-2023', 'dd-mm-yyyy'), 'InProgress', 158);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (159, to_date('21-11-2023', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'), 'Completed', 159);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (160, to_date('24-03-2024', 'dd-mm-yyyy'), to_date('11-12-2023', 'dd-mm-yyyy'), 'Completed', 160);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (161, to_date('24-03-2024', 'dd-mm-yyyy'), to_date('11-09-2023', 'dd-mm-yyyy'), 'Completed', 161);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (162, to_date('10-06-2024', 'dd-mm-yyyy'), to_date('28-09-2023', 'dd-mm-yyyy'), 'Pending', 162);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (163, to_date('19-01-2024', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), 'Completed', 163);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (164, to_date('04-10-2023', 'dd-mm-yyyy'), to_date('10-09-2023', 'dd-mm-yyyy'), 'Pending', 164);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (165, to_date('19-09-2023', 'dd-mm-yyyy'), to_date('25-04-2024', 'dd-mm-yyyy'), 'InProgress', 165);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (166, to_date('07-08-2023', 'dd-mm-yyyy'), to_date('17-06-2024', 'dd-mm-yyyy'), 'Completed', 166);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (167, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('17-03-2024', 'dd-mm-yyyy'), 'Pending', 167);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (168, to_date('06-02-2024', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'), 'Completed', 168);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (169, to_date('18-04-2024', 'dd-mm-yyyy'), to_date('28-04-2024', 'dd-mm-yyyy'), 'InProgress', 169);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (170, to_date('20-04-2024', 'dd-mm-yyyy'), to_date('15-02-2024', 'dd-mm-yyyy'), 'Pending', 170);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (171, to_date('12-09-2023', 'dd-mm-yyyy'), to_date('08-04-2024', 'dd-mm-yyyy'), 'Pending', 171);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (172, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'), 'Pending', 172);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (173, to_date('06-01-2024', 'dd-mm-yyyy'), to_date('11-11-2023', 'dd-mm-yyyy'), 'Pending', 173);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (174, to_date('24-12-2023', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'), 'Completed', 174);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (175, to_date('13-08-2023', 'dd-mm-yyyy'), to_date('30-04-2024', 'dd-mm-yyyy'), 'Pending', 175);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (176, to_date('15-10-2023', 'dd-mm-yyyy'), to_date('14-01-2024', 'dd-mm-yyyy'), 'InProgress', 176);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (177, to_date('05-08-2023', 'dd-mm-yyyy'), to_date('21-06-2024', 'dd-mm-yyyy'), 'InProgress', 177);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (178, to_date('15-08-2023', 'dd-mm-yyyy'), to_date('27-04-2024', 'dd-mm-yyyy'), 'Completed', 178);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (179, to_date('21-02-2024', 'dd-mm-yyyy'), to_date('11-11-2023', 'dd-mm-yyyy'), 'Completed', 179);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (180, to_date('26-10-2023', 'dd-mm-yyyy'), to_date('27-02-2024', 'dd-mm-yyyy'), 'Completed', 180);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (181, to_date('25-08-2023', 'dd-mm-yyyy'), to_date('17-07-2023', 'dd-mm-yyyy'), 'Completed', 181);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (182, to_date('09-02-2024', 'dd-mm-yyyy'), to_date('25-08-2023', 'dd-mm-yyyy'), 'Pending', 182);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (183, to_date('06-12-2023', 'dd-mm-yyyy'), to_date('23-06-2024', 'dd-mm-yyyy'), 'Completed', 183);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (184, to_date('20-06-2024', 'dd-mm-yyyy'), to_date('31-01-2024', 'dd-mm-yyyy'), 'InProgress', 184);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (185, to_date('08-06-2024', 'dd-mm-yyyy'), to_date('08-03-2024', 'dd-mm-yyyy'), 'Pending', 185);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (186, to_date('06-12-2023', 'dd-mm-yyyy'), to_date('06-03-2024', 'dd-mm-yyyy'), 'InProgress', 186);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (187, to_date('16-02-2024', 'dd-mm-yyyy'), to_date('09-02-2024', 'dd-mm-yyyy'), 'InProgress', 187);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (188, to_date('20-11-2023', 'dd-mm-yyyy'), to_date('29-12-2023', 'dd-mm-yyyy'), 'Completed', 188);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (189, to_date('13-12-2023', 'dd-mm-yyyy'), to_date('20-11-2023', 'dd-mm-yyyy'), 'Pending', 189);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (190, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('05-01-2024', 'dd-mm-yyyy'), 'Pending', 190);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (191, to_date('31-05-2024', 'dd-mm-yyyy'), to_date('12-01-2024', 'dd-mm-yyyy'), 'Pending', 191);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (192, to_date('11-03-2024', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'), 'InProgress', 192);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (193, to_date('22-12-2023', 'dd-mm-yyyy'), to_date('01-11-2023', 'dd-mm-yyyy'), 'InProgress', 193);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (194, to_date('10-04-2024', 'dd-mm-yyyy'), to_date('08-04-2024', 'dd-mm-yyyy'), 'Completed', 194);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (195, to_date('07-11-2023', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'), 'Completed', 195);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (196, to_date('16-07-2023', 'dd-mm-yyyy'), to_date('20-09-2023', 'dd-mm-yyyy'), 'Pending', 196);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (197, to_date('25-04-2024', 'dd-mm-yyyy'), to_date('23-01-2024', 'dd-mm-yyyy'), 'Pending', 197);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (198, to_date('19-06-2024', 'dd-mm-yyyy'), to_date('15-08-2023', 'dd-mm-yyyy'), 'Pending', 198);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (199, to_date('15-06-2024', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'), 'InProgress', 199);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (200, to_date('21-12-2023', 'dd-mm-yyyy'), to_date('22-02-2024', 'dd-mm-yyyy'), 'InProgress', 200);
commit;
prompt 200 records committed...
insert into TASK (requestid, startdate, enddate, status, deptid)
values (201, to_date('22-01-2024', 'dd-mm-yyyy'), to_date('30-04-2024', 'dd-mm-yyyy'), 'InProgress', 201);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (202, to_date('17-12-2023', 'dd-mm-yyyy'), to_date('16-02-2024', 'dd-mm-yyyy'), 'InProgress', 202);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (203, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('08-11-2023', 'dd-mm-yyyy'), 'Pending', 203);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (204, to_date('13-06-2024', 'dd-mm-yyyy'), to_date('13-12-2023', 'dd-mm-yyyy'), 'Pending', 204);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (205, to_date('16-09-2023', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 'InProgress', 205);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (206, to_date('11-09-2023', 'dd-mm-yyyy'), to_date('20-03-2024', 'dd-mm-yyyy'), 'Completed', 206);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (207, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('14-07-2023', 'dd-mm-yyyy'), 'InProgress', 207);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (208, to_date('15-10-2023', 'dd-mm-yyyy'), to_date('25-04-2024', 'dd-mm-yyyy'), 'Completed', 208);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (209, to_date('23-10-2023', 'dd-mm-yyyy'), to_date('02-12-2023', 'dd-mm-yyyy'), 'Completed', 209);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (210, to_date('25-01-2024', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'), 'InProgress', 210);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (211, to_date('18-09-2023', 'dd-mm-yyyy'), to_date('28-06-2024', 'dd-mm-yyyy'), 'Completed', 211);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (212, to_date('30-08-2023', 'dd-mm-yyyy'), to_date('24-11-2023', 'dd-mm-yyyy'), 'InProgress', 212);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (213, to_date('26-04-2024', 'dd-mm-yyyy'), to_date('27-02-2024', 'dd-mm-yyyy'), 'InProgress', 213);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (214, to_date('30-09-2023', 'dd-mm-yyyy'), to_date('15-11-2023', 'dd-mm-yyyy'), 'Completed', 214);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (215, to_date('23-12-2023', 'dd-mm-yyyy'), to_date('25-01-2024', 'dd-mm-yyyy'), 'InProgress', 215);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (216, to_date('04-01-2024', 'dd-mm-yyyy'), to_date('17-04-2024', 'dd-mm-yyyy'), 'Pending', 216);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (217, to_date('13-12-2023', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'), 'Completed', 217);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (218, to_date('09-09-2023', 'dd-mm-yyyy'), to_date('21-01-2024', 'dd-mm-yyyy'), 'Pending', 218);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (219, to_date('06-10-2023', 'dd-mm-yyyy'), to_date('12-02-2024', 'dd-mm-yyyy'), 'Completed', 219);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (220, to_date('20-01-2024', 'dd-mm-yyyy'), to_date('03-05-2024', 'dd-mm-yyyy'), 'InProgress', 220);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (221, to_date('01-07-2024', 'dd-mm-yyyy'), to_date('12-06-2024', 'dd-mm-yyyy'), 'InProgress', 221);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (222, to_date('14-07-2023', 'dd-mm-yyyy'), to_date('22-08-2023', 'dd-mm-yyyy'), 'Completed', 222);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (223, to_date('08-08-2023', 'dd-mm-yyyy'), to_date('29-07-2023', 'dd-mm-yyyy'), 'InProgress', 223);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (224, to_date('18-12-2023', 'dd-mm-yyyy'), to_date('25-11-2023', 'dd-mm-yyyy'), 'InProgress', 224);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (225, to_date('08-03-2024', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), 'InProgress', 225);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (226, to_date('11-04-2024', 'dd-mm-yyyy'), to_date('25-07-2023', 'dd-mm-yyyy'), 'Completed', 226);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (227, to_date('07-08-2023', 'dd-mm-yyyy'), to_date('13-12-2023', 'dd-mm-yyyy'), 'Completed', 227);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (228, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('05-09-2023', 'dd-mm-yyyy'), 'InProgress', 228);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (229, to_date('19-10-2023', 'dd-mm-yyyy'), to_date('21-10-2023', 'dd-mm-yyyy'), 'InProgress', 229);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (230, to_date('23-05-2024', 'dd-mm-yyyy'), to_date('18-12-2023', 'dd-mm-yyyy'), 'Completed', 230);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (231, to_date('18-10-2023', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'), 'InProgress', 231);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (232, to_date('27-09-2023', 'dd-mm-yyyy'), to_date('23-10-2023', 'dd-mm-yyyy'), 'InProgress', 232);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (233, to_date('16-10-2023', 'dd-mm-yyyy'), to_date('13-09-2023', 'dd-mm-yyyy'), 'InProgress', 233);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (234, to_date('22-05-2024', 'dd-mm-yyyy'), to_date('10-06-2024', 'dd-mm-yyyy'), 'Completed', 234);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (235, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'), 'Completed', 235);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (236, to_date('11-11-2023', 'dd-mm-yyyy'), to_date('30-04-2024', 'dd-mm-yyyy'), 'Completed', 236);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (237, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 'InProgress', 237);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (238, to_date('19-01-2024', 'dd-mm-yyyy'), to_date('08-12-2023', 'dd-mm-yyyy'), 'InProgress', 238);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (239, to_date('22-03-2024', 'dd-mm-yyyy'), to_date('22-02-2024', 'dd-mm-yyyy'), 'InProgress', 239);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (240, to_date('05-12-2023', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'), 'InProgress', 240);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (241, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('30-01-2024', 'dd-mm-yyyy'), 'Completed', 241);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (242, to_date('24-06-2024', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'), 'InProgress', 242);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (243, to_date('14-02-2024', 'dd-mm-yyyy'), to_date('27-11-2023', 'dd-mm-yyyy'), 'Completed', 243);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (244, to_date('24-07-2023', 'dd-mm-yyyy'), to_date('05-04-2024', 'dd-mm-yyyy'), 'Pending', 244);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (245, to_date('26-12-2023', 'dd-mm-yyyy'), to_date('19-03-2024', 'dd-mm-yyyy'), 'Pending', 245);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (246, to_date('02-09-2023', 'dd-mm-yyyy'), to_date('25-11-2023', 'dd-mm-yyyy'), 'Completed', 246);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (247, to_date('10-05-2024', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'), 'Completed', 247);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (248, to_date('26-10-2023', 'dd-mm-yyyy'), to_date('09-12-2023', 'dd-mm-yyyy'), 'InProgress', 248);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (249, to_date('28-07-2023', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'), 'InProgress', 249);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (250, to_date('28-05-2024', 'dd-mm-yyyy'), to_date('26-08-2023', 'dd-mm-yyyy'), 'InProgress', 250);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (251, to_date('01-12-2023', 'dd-mm-yyyy'), to_date('21-06-2024', 'dd-mm-yyyy'), 'InProgress', 251);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (252, to_date('29-10-2023', 'dd-mm-yyyy'), to_date('10-05-2024', 'dd-mm-yyyy'), 'InProgress', 252);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (253, to_date('11-06-2024', 'dd-mm-yyyy'), to_date('06-06-2024', 'dd-mm-yyyy'), 'Completed', 253);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (254, to_date('25-08-2023', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), 'Completed', 254);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (255, to_date('11-10-2023', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 'Completed', 255);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (256, to_date('16-12-2023', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'), 'InProgress', 256);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (257, to_date('01-08-2023', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 'Pending', 257);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (258, to_date('11-06-2024', 'dd-mm-yyyy'), to_date('16-12-2023', 'dd-mm-yyyy'), 'InProgress', 258);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (259, to_date('26-06-2024', 'dd-mm-yyyy'), to_date('23-10-2023', 'dd-mm-yyyy'), 'Pending', 259);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (260, to_date('18-07-2023', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'), 'InProgress', 260);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (261, to_date('13-02-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'), 'Pending', 261);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (262, to_date('15-09-2023', 'dd-mm-yyyy'), to_date('13-03-2024', 'dd-mm-yyyy'), 'Pending', 262);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (263, to_date('30-07-2023', 'dd-mm-yyyy'), to_date('12-08-2023', 'dd-mm-yyyy'), 'InProgress', 263);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (264, to_date('10-11-2023', 'dd-mm-yyyy'), to_date('11-12-2023', 'dd-mm-yyyy'), 'InProgress', 264);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (265, to_date('28-05-2024', 'dd-mm-yyyy'), to_date('26-07-2023', 'dd-mm-yyyy'), 'Completed', 265);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (266, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'), 'Completed', 266);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (267, to_date('25-07-2023', 'dd-mm-yyyy'), to_date('24-10-2023', 'dd-mm-yyyy'), 'InProgress', 267);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (268, to_date('03-06-2024', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), 'Pending', 268);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (269, to_date('07-08-2023', 'dd-mm-yyyy'), to_date('02-09-2023', 'dd-mm-yyyy'), 'Completed', 269);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (270, to_date('13-04-2024', 'dd-mm-yyyy'), to_date('30-11-2023', 'dd-mm-yyyy'), 'Pending', 270);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (271, to_date('26-06-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 'Pending', 271);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (272, to_date('28-05-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 'Completed', 272);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (273, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'), 'InProgress', 273);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (274, to_date('12-11-2023', 'dd-mm-yyyy'), to_date('13-01-2024', 'dd-mm-yyyy'), 'InProgress', 274);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (275, to_date('21-02-2024', 'dd-mm-yyyy'), to_date('11-12-2023', 'dd-mm-yyyy'), 'InProgress', 275);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (276, to_date('10-02-2024', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'), 'InProgress', 276);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (277, to_date('27-07-2023', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'), 'InProgress', 277);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (278, to_date('09-11-2023', 'dd-mm-yyyy'), to_date('11-10-2023', 'dd-mm-yyyy'), 'Completed', 278);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (279, to_date('16-10-2023', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'), 'Completed', 279);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (280, to_date('15-06-2024', 'dd-mm-yyyy'), to_date('28-06-2024', 'dd-mm-yyyy'), 'Pending', 280);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (281, to_date('23-06-2024', 'dd-mm-yyyy'), to_date('06-03-2024', 'dd-mm-yyyy'), 'Pending', 281);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (282, to_date('29-04-2024', 'dd-mm-yyyy'), to_date('30-05-2024', 'dd-mm-yyyy'), 'InProgress', 282);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (283, to_date('27-09-2023', 'dd-mm-yyyy'), to_date('22-09-2023', 'dd-mm-yyyy'), 'Pending', 283);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (284, to_date('13-06-2024', 'dd-mm-yyyy'), to_date('28-05-2024', 'dd-mm-yyyy'), 'Pending', 284);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (285, to_date('23-04-2024', 'dd-mm-yyyy'), to_date('24-08-2023', 'dd-mm-yyyy'), 'Pending', 285);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (286, to_date('17-04-2024', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'), 'InProgress', 286);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (287, to_date('28-09-2023', 'dd-mm-yyyy'), to_date('24-05-2024', 'dd-mm-yyyy'), 'InProgress', 287);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (288, to_date('08-05-2024', 'dd-mm-yyyy'), to_date('21-02-2024', 'dd-mm-yyyy'), 'InProgress', 288);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (289, to_date('05-07-2024', 'dd-mm-yyyy'), to_date('25-11-2023', 'dd-mm-yyyy'), 'InProgress', 289);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (290, to_date('26-11-2023', 'dd-mm-yyyy'), to_date('01-03-2024', 'dd-mm-yyyy'), 'Pending', 290);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (291, to_date('06-06-2024', 'dd-mm-yyyy'), to_date('04-03-2024', 'dd-mm-yyyy'), 'InProgress', 291);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (292, to_date('27-04-2024', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'), 'Completed', 292);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (293, to_date('03-06-2024', 'dd-mm-yyyy'), to_date('12-06-2024', 'dd-mm-yyyy'), 'Pending', 293);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (294, to_date('31-10-2023', 'dd-mm-yyyy'), to_date('23-05-2024', 'dd-mm-yyyy'), 'InProgress', 294);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (295, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('25-08-2023', 'dd-mm-yyyy'), 'InProgress', 295);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (296, to_date('16-12-2023', 'dd-mm-yyyy'), to_date('02-11-2023', 'dd-mm-yyyy'), 'InProgress', 296);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (297, to_date('30-10-2023', 'dd-mm-yyyy'), to_date('26-08-2023', 'dd-mm-yyyy'), 'Pending', 297);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (298, to_date('12-03-2024', 'dd-mm-yyyy'), to_date('16-12-2023', 'dd-mm-yyyy'), 'InProgress', 298);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (299, to_date('24-02-2024', 'dd-mm-yyyy'), to_date('20-12-2023', 'dd-mm-yyyy'), 'Completed', 299);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (300, to_date('12-01-2024', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'), 'Completed', 300);
commit;
prompt 300 records committed...
insert into TASK (requestid, startdate, enddate, status, deptid)
values (301, to_date('03-05-2024', 'dd-mm-yyyy'), to_date('14-02-2024', 'dd-mm-yyyy'), 'InProgress', 301);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (302, to_date('01-11-2023', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'), 'Pending', 302);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (303, to_date('22-06-2024', 'dd-mm-yyyy'), to_date('29-05-2024', 'dd-mm-yyyy'), 'InProgress', 303);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (304, to_date('18-03-2024', 'dd-mm-yyyy'), to_date('27-05-2024', 'dd-mm-yyyy'), 'Completed', 304);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (305, to_date('19-08-2023', 'dd-mm-yyyy'), to_date('12-10-2023', 'dd-mm-yyyy'), 'InProgress', 305);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (306, to_date('30-04-2024', 'dd-mm-yyyy'), to_date('23-03-2024', 'dd-mm-yyyy'), 'Pending', 306);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (307, to_date('08-09-2023', 'dd-mm-yyyy'), to_date('17-03-2024', 'dd-mm-yyyy'), 'Pending', 307);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (308, to_date('13-03-2024', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'), 'InProgress', 308);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (309, to_date('14-02-2024', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'), 'Pending', 309);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (310, to_date('23-05-2024', 'dd-mm-yyyy'), to_date('08-05-2024', 'dd-mm-yyyy'), 'Completed', 310);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (311, to_date('23-04-2024', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'), 'Pending', 311);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (312, to_date('21-06-2024', 'dd-mm-yyyy'), to_date('01-04-2024', 'dd-mm-yyyy'), 'Pending', 312);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (313, to_date('12-07-2023', 'dd-mm-yyyy'), to_date('05-03-2024', 'dd-mm-yyyy'), 'Completed', 313);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (314, to_date('13-11-2023', 'dd-mm-yyyy'), to_date('18-06-2024', 'dd-mm-yyyy'), 'InProgress', 314);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (315, to_date('29-03-2024', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'), 'Pending', 315);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (316, to_date('14-05-2024', 'dd-mm-yyyy'), to_date('12-07-2023', 'dd-mm-yyyy'), 'Completed', 316);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (317, to_date('12-06-2024', 'dd-mm-yyyy'), to_date('11-08-2023', 'dd-mm-yyyy'), 'InProgress', 317);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (318, to_date('07-04-2024', 'dd-mm-yyyy'), to_date('04-10-2023', 'dd-mm-yyyy'), 'Completed', 318);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (319, to_date('26-11-2023', 'dd-mm-yyyy'), to_date('20-01-2024', 'dd-mm-yyyy'), 'Pending', 319);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (320, to_date('14-05-2024', 'dd-mm-yyyy'), to_date('20-08-2023', 'dd-mm-yyyy'), 'InProgress', 320);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (321, to_date('24-09-2023', 'dd-mm-yyyy'), to_date('22-11-2023', 'dd-mm-yyyy'), 'Pending', 321);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (322, to_date('20-08-2023', 'dd-mm-yyyy'), to_date('27-07-2023', 'dd-mm-yyyy'), 'Pending', 322);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (323, to_date('08-07-2023', 'dd-mm-yyyy'), to_date('15-12-2023', 'dd-mm-yyyy'), 'InProgress', 323);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (324, to_date('15-11-2023', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'), 'InProgress', 324);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (325, to_date('02-02-2024', 'dd-mm-yyyy'), to_date('22-01-2024', 'dd-mm-yyyy'), 'Pending', 325);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (326, to_date('07-07-2023', 'dd-mm-yyyy'), to_date('08-04-2024', 'dd-mm-yyyy'), 'Completed', 326);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (327, to_date('25-04-2024', 'dd-mm-yyyy'), to_date('02-10-2023', 'dd-mm-yyyy'), 'Pending', 327);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (328, to_date('03-08-2023', 'dd-mm-yyyy'), to_date('26-02-2024', 'dd-mm-yyyy'), 'Pending', 328);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (329, to_date('14-01-2024', 'dd-mm-yyyy'), to_date('31-10-2023', 'dd-mm-yyyy'), 'InProgress', 329);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (330, to_date('21-03-2024', 'dd-mm-yyyy'), to_date('04-11-2023', 'dd-mm-yyyy'), 'Completed', 330);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (331, to_date('11-10-2023', 'dd-mm-yyyy'), to_date('17-08-2023', 'dd-mm-yyyy'), 'Completed', 331);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (332, to_date('07-12-2023', 'dd-mm-yyyy'), to_date('03-11-2023', 'dd-mm-yyyy'), 'InProgress', 332);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (333, to_date('20-03-2024', 'dd-mm-yyyy'), to_date('21-05-2024', 'dd-mm-yyyy'), 'InProgress', 333);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (334, to_date('13-08-2023', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'), 'Completed', 334);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (335, to_date('30-06-2024', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'), 'InProgress', 335);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (336, to_date('01-02-2024', 'dd-mm-yyyy'), to_date('19-06-2024', 'dd-mm-yyyy'), 'Completed', 336);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (337, to_date('20-08-2023', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'), 'InProgress', 337);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (338, to_date('03-01-2024', 'dd-mm-yyyy'), to_date('17-10-2023', 'dd-mm-yyyy'), 'Pending', 338);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (339, to_date('12-04-2024', 'dd-mm-yyyy'), to_date('06-02-2024', 'dd-mm-yyyy'), 'Completed', 339);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (340, to_date('04-06-2024', 'dd-mm-yyyy'), to_date('07-03-2024', 'dd-mm-yyyy'), 'Completed', 340);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (341, to_date('05-01-2024', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'), 'Pending', 341);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (342, to_date('11-10-2023', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'), 'InProgress', 342);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (343, to_date('17-04-2024', 'dd-mm-yyyy'), to_date('18-10-2023', 'dd-mm-yyyy'), 'Pending', 343);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (344, to_date('07-10-2023', 'dd-mm-yyyy'), to_date('12-07-2023', 'dd-mm-yyyy'), 'Pending', 344);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (345, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('08-12-2023', 'dd-mm-yyyy'), 'InProgress', 345);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (346, to_date('22-05-2024', 'dd-mm-yyyy'), to_date('11-12-2023', 'dd-mm-yyyy'), 'Completed', 346);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (347, to_date('26-07-2023', 'dd-mm-yyyy'), to_date('20-08-2023', 'dd-mm-yyyy'), 'InProgress', 347);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (348, to_date('29-10-2023', 'dd-mm-yyyy'), to_date('28-10-2023', 'dd-mm-yyyy'), 'InProgress', 348);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (349, to_date('21-09-2023', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'), 'Pending', 349);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (350, to_date('26-01-2024', 'dd-mm-yyyy'), to_date('07-03-2024', 'dd-mm-yyyy'), 'Completed', 350);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (351, to_date('31-01-2024', 'dd-mm-yyyy'), to_date('07-06-2024', 'dd-mm-yyyy'), 'Completed', 351);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (352, to_date('23-12-2023', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'), 'Pending', 352);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (353, to_date('16-07-2023', 'dd-mm-yyyy'), to_date('18-03-2024', 'dd-mm-yyyy'), 'InProgress', 353);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (354, to_date('07-11-2023', 'dd-mm-yyyy'), to_date('05-07-2024', 'dd-mm-yyyy'), 'Completed', 354);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (355, to_date('20-02-2024', 'dd-mm-yyyy'), to_date('04-06-2024', 'dd-mm-yyyy'), 'Pending', 355);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (356, to_date('28-12-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), 'InProgress', 356);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (357, to_date('09-12-2023', 'dd-mm-yyyy'), to_date('23-04-2024', 'dd-mm-yyyy'), 'Pending', 357);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (358, to_date('27-03-2024', 'dd-mm-yyyy'), to_date('03-01-2024', 'dd-mm-yyyy'), 'InProgress', 358);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (359, to_date('08-03-2024', 'dd-mm-yyyy'), to_date('06-09-2023', 'dd-mm-yyyy'), 'InProgress', 359);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (360, to_date('07-02-2024', 'dd-mm-yyyy'), to_date('01-10-2023', 'dd-mm-yyyy'), 'Completed', 360);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (361, to_date('25-06-2024', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'), 'Completed', 361);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (362, to_date('08-02-2024', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'), 'Completed', 362);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (363, to_date('03-08-2023', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'), 'Pending', 363);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (364, to_date('06-05-2024', 'dd-mm-yyyy'), to_date('06-04-2024', 'dd-mm-yyyy'), 'InProgress', 364);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (365, to_date('02-03-2024', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), 'Pending', 365);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (366, to_date('19-10-2023', 'dd-mm-yyyy'), to_date('22-01-2024', 'dd-mm-yyyy'), 'Pending', 366);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (367, to_date('17-03-2024', 'dd-mm-yyyy'), to_date('06-12-2023', 'dd-mm-yyyy'), 'InProgress', 367);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (368, to_date('02-10-2023', 'dd-mm-yyyy'), to_date('26-07-2023', 'dd-mm-yyyy'), 'Completed', 368);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (369, to_date('09-08-2023', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'), 'Pending', 369);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (370, to_date('11-06-2024', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'), 'Pending', 370);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (371, to_date('26-10-2023', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'), 'Completed', 371);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (372, to_date('08-12-2023', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'), 'InProgress', 372);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (373, to_date('25-01-2024', 'dd-mm-yyyy'), to_date('04-12-2023', 'dd-mm-yyyy'), 'InProgress', 373);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (374, to_date('08-03-2024', 'dd-mm-yyyy'), to_date('13-02-2024', 'dd-mm-yyyy'), 'Pending', 374);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (375, to_date('11-02-2024', 'dd-mm-yyyy'), to_date('25-05-2024', 'dd-mm-yyyy'), 'InProgress', 375);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (376, to_date('09-01-2024', 'dd-mm-yyyy'), to_date('22-10-2023', 'dd-mm-yyyy'), 'Completed', 376);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (377, to_date('20-03-2024', 'dd-mm-yyyy'), to_date('05-02-2024', 'dd-mm-yyyy'), 'Pending', 377);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (378, to_date('20-03-2024', 'dd-mm-yyyy'), to_date('02-07-2024', 'dd-mm-yyyy'), 'Completed', 378);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (379, to_date('09-10-2023', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'), 'Completed', 379);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (380, to_date('22-10-2023', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'), 'Pending', 380);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (381, to_date('23-11-2023', 'dd-mm-yyyy'), to_date('08-05-2024', 'dd-mm-yyyy'), 'InProgress', 381);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (382, to_date('19-07-2023', 'dd-mm-yyyy'), to_date('03-08-2023', 'dd-mm-yyyy'), 'Pending', 382);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (383, to_date('17-06-2024', 'dd-mm-yyyy'), to_date('09-12-2023', 'dd-mm-yyyy'), 'Completed', 383);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (384, to_date('13-04-2024', 'dd-mm-yyyy'), to_date('15-04-2024', 'dd-mm-yyyy'), 'Pending', 384);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (385, to_date('08-10-2023', 'dd-mm-yyyy'), to_date('28-04-2024', 'dd-mm-yyyy'), 'Completed', 385);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (386, to_date('25-05-2024', 'dd-mm-yyyy'), to_date('04-05-2024', 'dd-mm-yyyy'), 'InProgress', 386);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (387, to_date('31-08-2023', 'dd-mm-yyyy'), to_date('25-02-2024', 'dd-mm-yyyy'), 'Pending', 387);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (388, to_date('26-08-2023', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'), 'InProgress', 388);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (389, to_date('30-10-2023', 'dd-mm-yyyy'), to_date('15-02-2024', 'dd-mm-yyyy'), 'Pending', 389);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (390, to_date('25-03-2024', 'dd-mm-yyyy'), to_date('24-03-2024', 'dd-mm-yyyy'), 'InProgress', 390);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (391, to_date('21-03-2024', 'dd-mm-yyyy'), to_date('11-03-2024', 'dd-mm-yyyy'), 'InProgress', 391);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (392, to_date('05-11-2023', 'dd-mm-yyyy'), to_date('06-07-2024', 'dd-mm-yyyy'), 'InProgress', 392);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (393, to_date('13-05-2024', 'dd-mm-yyyy'), to_date('28-02-2024', 'dd-mm-yyyy'), 'Pending', 393);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (394, to_date('26-03-2024', 'dd-mm-yyyy'), to_date('04-11-2023', 'dd-mm-yyyy'), 'InProgress', 394);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (395, to_date('07-09-2023', 'dd-mm-yyyy'), to_date('30-08-2023', 'dd-mm-yyyy'), 'InProgress', 395);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (396, to_date('18-11-2023', 'dd-mm-yyyy'), to_date('11-03-2024', 'dd-mm-yyyy'), 'InProgress', 396);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (397, to_date('09-08-2023', 'dd-mm-yyyy'), to_date('21-08-2023', 'dd-mm-yyyy'), 'Completed', 397);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (398, to_date('02-01-2024', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'), 'Completed', 398);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (399, to_date('06-09-2023', 'dd-mm-yyyy'), to_date('07-01-2024', 'dd-mm-yyyy'), 'Completed', 399);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (400, to_date('22-02-2024', 'dd-mm-yyyy'), to_date('22-03-2024', 'dd-mm-yyyy'), 'Pending', 400);
commit;
prompt 400 records committed...
insert into TASK (requestid, startdate, enddate, status, deptid)
values (401, to_date('24-01-2024', 'dd-mm-yyyy'), to_date('17-05-2024', 'dd-mm-yyyy'), 'Pending', 401);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (402, to_date('11-03-2024', 'dd-mm-yyyy'), to_date('14-09-2023', 'dd-mm-yyyy'), 'InProgress', 402);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (403, to_date('12-11-2023', 'dd-mm-yyyy'), to_date('12-06-2024', 'dd-mm-yyyy'), 'InProgress', 403);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (404, to_date('05-07-2024', 'dd-mm-yyyy'), to_date('18-05-2024', 'dd-mm-yyyy'), 'Pending', 404);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (405, to_date('06-10-2023', 'dd-mm-yyyy'), to_date('18-07-2023', 'dd-mm-yyyy'), 'Pending', 405);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (406, to_date('28-11-2023', 'dd-mm-yyyy'), to_date('02-05-2024', 'dd-mm-yyyy'), 'Pending', 406);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (407, to_date('05-07-2024', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'), 'Completed', 407);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (408, to_date('19-09-2023', 'dd-mm-yyyy'), to_date('08-08-2023', 'dd-mm-yyyy'), 'Pending', 408);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (409, to_date('10-02-2024', 'dd-mm-yyyy'), to_date('10-06-2024', 'dd-mm-yyyy'), 'Pending', 409);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (410, to_date('19-01-2024', 'dd-mm-yyyy'), to_date('08-07-2023', 'dd-mm-yyyy'), 'Pending', 410);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (411, to_date('04-10-2023', 'dd-mm-yyyy'), to_date('30-09-2023', 'dd-mm-yyyy'), 'Completed', 411);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (412, to_date('06-09-2023', 'dd-mm-yyyy'), to_date('26-05-2024', 'dd-mm-yyyy'), 'Pending', 412);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (413, to_date('14-09-2023', 'dd-mm-yyyy'), to_date('28-06-2024', 'dd-mm-yyyy'), 'Pending', 413);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (414, to_date('18-04-2024', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'), 'InProgress', 414);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (415, to_date('29-09-2023', 'dd-mm-yyyy'), to_date('13-11-2023', 'dd-mm-yyyy'), 'Pending', 415);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (416, to_date('22-02-2024', 'dd-mm-yyyy'), to_date('16-11-2023', 'dd-mm-yyyy'), 'InProgress', 416);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (417, to_date('02-06-2024', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), 'Pending', 417);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (418, to_date('15-08-2023', 'dd-mm-yyyy'), to_date('04-08-2023', 'dd-mm-yyyy'), 'InProgress', 418);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (419, to_date('30-12-2023', 'dd-mm-yyyy'), to_date('14-07-2023', 'dd-mm-yyyy'), 'InProgress', 419);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (420, to_date('12-08-2023', 'dd-mm-yyyy'), to_date('07-02-2024', 'dd-mm-yyyy'), 'Pending', 420);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (421, to_date('05-09-2023', 'dd-mm-yyyy'), to_date('22-04-2024', 'dd-mm-yyyy'), 'Pending', 421);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (422, to_date('13-03-2024', 'dd-mm-yyyy'), to_date('26-06-2024', 'dd-mm-yyyy'), 'Pending', 422);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (423, to_date('20-07-2023', 'dd-mm-yyyy'), to_date('04-06-2024', 'dd-mm-yyyy'), 'Pending', 423);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (424, to_date('25-05-2024', 'dd-mm-yyyy'), to_date('05-02-2024', 'dd-mm-yyyy'), 'InProgress', 424);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (425, to_date('31-07-2023', 'dd-mm-yyyy'), to_date('03-06-2024', 'dd-mm-yyyy'), 'InProgress', 425);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (426, to_date('15-12-2023', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), 'Pending', 426);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (427, to_date('02-12-2023', 'dd-mm-yyyy'), to_date('16-02-2024', 'dd-mm-yyyy'), 'InProgress', 427);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (428, to_date('08-08-2023', 'dd-mm-yyyy'), to_date('27-07-2023', 'dd-mm-yyyy'), 'Completed', 428);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (429, to_date('04-02-2024', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), 'Completed', 429);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (430, to_date('06-11-2023', 'dd-mm-yyyy'), to_date('08-06-2024', 'dd-mm-yyyy'), 'Pending', 430);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (431, to_date('15-08-2023', 'dd-mm-yyyy'), to_date('04-04-2024', 'dd-mm-yyyy'), 'Completed', 431);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (432, to_date('14-09-2023', 'dd-mm-yyyy'), to_date('10-08-2023', 'dd-mm-yyyy'), 'Pending', 432);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (433, to_date('03-04-2024', 'dd-mm-yyyy'), to_date('21-01-2024', 'dd-mm-yyyy'), 'Completed', 433);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (434, to_date('28-03-2024', 'dd-mm-yyyy'), to_date('06-02-2024', 'dd-mm-yyyy'), 'Completed', 434);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (435, to_date('17-12-2023', 'dd-mm-yyyy'), to_date('19-07-2023', 'dd-mm-yyyy'), 'Pending', 435);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (436, to_date('11-11-2023', 'dd-mm-yyyy'), to_date('22-03-2024', 'dd-mm-yyyy'), 'Completed', 436);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (437, to_date('27-10-2023', 'dd-mm-yyyy'), to_date('02-12-2023', 'dd-mm-yyyy'), 'InProgress', 437);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (438, to_date('11-11-2023', 'dd-mm-yyyy'), to_date('30-08-2023', 'dd-mm-yyyy'), 'InProgress', 438);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (439, to_date('21-07-2023', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'), 'Completed', 439);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (440, to_date('30-10-2023', 'dd-mm-yyyy'), to_date('03-11-2023', 'dd-mm-yyyy'), 'InProgress', 440);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (441, to_date('20-07-2023', 'dd-mm-yyyy'), to_date('03-02-2024', 'dd-mm-yyyy'), 'Pending', 441);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (442, to_date('30-12-2023', 'dd-mm-yyyy'), to_date('14-02-2024', 'dd-mm-yyyy'), 'InProgress', 442);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (443, to_date('12-09-2023', 'dd-mm-yyyy'), to_date('28-10-2023', 'dd-mm-yyyy'), 'Completed', 443);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (444, to_date('04-05-2024', 'dd-mm-yyyy'), to_date('17-08-2023', 'dd-mm-yyyy'), 'InProgress', 444);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (445, to_date('24-08-2023', 'dd-mm-yyyy'), to_date('19-12-2023', 'dd-mm-yyyy'), 'InProgress', 445);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (446, to_date('12-11-2023', 'dd-mm-yyyy'), to_date('28-12-2023', 'dd-mm-yyyy'), 'Pending', 446);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (447, to_date('01-02-2024', 'dd-mm-yyyy'), to_date('31-05-2024', 'dd-mm-yyyy'), 'Pending', 447);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (448, to_date('22-04-2024', 'dd-mm-yyyy'), to_date('23-10-2023', 'dd-mm-yyyy'), 'Pending', 448);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (449, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('13-12-2023', 'dd-mm-yyyy'), 'Completed', 449);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (450, to_date('20-12-2023', 'dd-mm-yyyy'), to_date('02-06-2024', 'dd-mm-yyyy'), 'Pending', 450);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (451, to_date('25-07-2023', 'dd-mm-yyyy'), to_date('05-04-2024', 'dd-mm-yyyy'), 'InProgress', 451);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (452, to_date('26-10-2023', 'dd-mm-yyyy'), to_date('05-08-2023', 'dd-mm-yyyy'), 'Pending', 452);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (453, to_date('24-07-2023', 'dd-mm-yyyy'), to_date('21-11-2023', 'dd-mm-yyyy'), 'InProgress', 453);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (454, to_date('21-01-2024', 'dd-mm-yyyy'), to_date('20-12-2023', 'dd-mm-yyyy'), 'Pending', 454);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (455, to_date('29-05-2024', 'dd-mm-yyyy'), to_date('12-03-2024', 'dd-mm-yyyy'), 'Completed', 455);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (456, to_date('12-12-2023', 'dd-mm-yyyy'), to_date('14-11-2023', 'dd-mm-yyyy'), 'Pending', 456);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (457, to_date('13-08-2023', 'dd-mm-yyyy'), to_date('01-06-2024', 'dd-mm-yyyy'), 'Completed', 457);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (458, to_date('29-05-2024', 'dd-mm-yyyy'), to_date('28-07-2023', 'dd-mm-yyyy'), 'Completed', 458);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (459, to_date('02-12-2023', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'), 'InProgress', 459);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (460, to_date('16-06-2024', 'dd-mm-yyyy'), to_date('18-10-2023', 'dd-mm-yyyy'), 'InProgress', 460);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (461, to_date('04-03-2024', 'dd-mm-yyyy'), to_date('31-07-2023', 'dd-mm-yyyy'), 'Pending', 461);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (462, to_date('10-02-2024', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'), 'InProgress', 462);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (463, to_date('18-07-2023', 'dd-mm-yyyy'), to_date('03-12-2023', 'dd-mm-yyyy'), 'Completed', 463);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (464, to_date('27-09-2023', 'dd-mm-yyyy'), to_date('03-02-2024', 'dd-mm-yyyy'), 'Pending', 464);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (465, to_date('11-11-2023', 'dd-mm-yyyy'), to_date('26-02-2024', 'dd-mm-yyyy'), 'Completed', 465);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (466, to_date('31-07-2023', 'dd-mm-yyyy'), to_date('01-11-2023', 'dd-mm-yyyy'), 'InProgress', 466);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (467, to_date('26-02-2024', 'dd-mm-yyyy'), to_date('10-05-2024', 'dd-mm-yyyy'), 'InProgress', 467);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (468, to_date('11-02-2024', 'dd-mm-yyyy'), to_date('13-03-2024', 'dd-mm-yyyy'), 'Pending', 468);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (469, to_date('03-11-2023', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'), 'Pending', 469);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (470, to_date('01-10-2023', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'), 'Pending', 470);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (471, to_date('03-09-2023', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'), 'Pending', 471);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (472, to_date('19-03-2024', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'), 'InProgress', 472);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (473, to_date('10-09-2023', 'dd-mm-yyyy'), to_date('07-12-2023', 'dd-mm-yyyy'), 'Pending', 473);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (474, to_date('01-07-2024', 'dd-mm-yyyy'), to_date('12-01-2024', 'dd-mm-yyyy'), 'InProgress', 474);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (475, to_date('16-07-2023', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'), 'Completed', 475);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (476, to_date('17-11-2023', 'dd-mm-yyyy'), to_date('26-05-2024', 'dd-mm-yyyy'), 'Pending', 476);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (477, to_date('01-01-2024', 'dd-mm-yyyy'), to_date('04-11-2023', 'dd-mm-yyyy'), 'InProgress', 477);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (478, to_date('27-01-2024', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'), 'Pending', 478);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (479, to_date('26-09-2023', 'dd-mm-yyyy'), to_date('05-10-2023', 'dd-mm-yyyy'), 'Pending', 479);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (480, to_date('15-12-2023', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'), 'Pending', 480);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (481, to_date('29-10-2023', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), 'Completed', 481);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (482, to_date('11-01-2024', 'dd-mm-yyyy'), to_date('25-11-2023', 'dd-mm-yyyy'), 'Completed', 482);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (483, to_date('02-09-2023', 'dd-mm-yyyy'), to_date('26-02-2024', 'dd-mm-yyyy'), 'Pending', 483);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (484, to_date('26-12-2023', 'dd-mm-yyyy'), to_date('04-09-2023', 'dd-mm-yyyy'), 'Completed', 484);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (485, to_date('21-08-2023', 'dd-mm-yyyy'), to_date('11-07-2023', 'dd-mm-yyyy'), 'Pending', 485);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (486, to_date('24-08-2023', 'dd-mm-yyyy'), to_date('14-09-2023', 'dd-mm-yyyy'), 'InProgress', 486);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (487, to_date('21-10-2023', 'dd-mm-yyyy'), to_date('28-03-2024', 'dd-mm-yyyy'), 'InProgress', 487);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (488, to_date('24-07-2023', 'dd-mm-yyyy'), to_date('23-11-2023', 'dd-mm-yyyy'), 'Completed', 488);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (489, to_date('20-10-2023', 'dd-mm-yyyy'), to_date('21-05-2024', 'dd-mm-yyyy'), 'InProgress', 489);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (490, to_date('04-02-2024', 'dd-mm-yyyy'), to_date('03-07-2024', 'dd-mm-yyyy'), 'InProgress', 490);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (491, to_date('02-06-2024', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'), 'InProgress', 491);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (492, to_date('22-03-2024', 'dd-mm-yyyy'), to_date('25-09-2023', 'dd-mm-yyyy'), 'Completed', 492);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (493, to_date('10-03-2024', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'), 'Pending', 493);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (494, to_date('07-05-2024', 'dd-mm-yyyy'), to_date('31-07-2023', 'dd-mm-yyyy'), 'Completed', 494);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (495, to_date('09-07-2023', 'dd-mm-yyyy'), to_date('17-10-2023', 'dd-mm-yyyy'), 'Pending', 495);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (496, to_date('05-06-2024', 'dd-mm-yyyy'), to_date('20-12-2023', 'dd-mm-yyyy'), 'InProgress', 496);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (497, to_date('16-07-2023', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'), 'Completed', 497);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (498, to_date('09-06-2024', 'dd-mm-yyyy'), to_date('24-01-2024', 'dd-mm-yyyy'), 'Completed', 498);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (499, to_date('18-01-2024', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'), 'Completed', 499);
insert into TASK (requestid, startdate, enddate, status, deptid)
values (500, to_date('17-04-2024', 'dd-mm-yyyy'), to_date('29-10-2023', 'dd-mm-yyyy'), 'Completed', 500);
commit;
prompt 500 records loaded
prompt Enabling foreign key constraints for EMPLOYEE...
alter table EMPLOYEE enable constraint FK_EMPLOYEE_DEPT;
prompt Enabling foreign key constraints for EQUIPMENT...
alter table EQUIPMENT enable constraint FK_EQUIPMENT_DEPT;
prompt Enabling foreign key constraints for MAINTENANCEREQUEST_...
alter table MAINTENANCEREQUEST_ enable constraint FK_MAINTENANCEREQUEST_DEPT;
alter table MAINTENANCEREQUEST_ enable constraint FK_MAINTENANCEREQUEST_LOCATION;
prompt Enabling foreign key constraints for TASK...
alter table TASK enable constraint FK_TASK_DEPT;
alter table TASK enable constraint FK_TASK_MAINTENANCEREQUEST;
prompt Enabling triggers for DEPARTMENT...
alter table DEPARTMENT enable all triggers;
prompt Enabling triggers for EMPLOYEE...
alter table EMPLOYEE enable all triggers;
prompt Enabling triggers for EQUIPMENT...
alter table EQUIPMENT enable all triggers;
prompt Enabling triggers for LOCATION_...
alter table LOCATION_ enable all triggers;
prompt Enabling triggers for MAINTENANCEREQUEST_...
alter table MAINTENANCEREQUEST_ enable all triggers;
prompt Enabling triggers for TASK...
alter table TASK enable all triggers;

set feedback on
set define on
prompt Done
