alter table Department_1 Add budget      INTEGER null;
alter table Department_1 Add maxcapacity INTEGER null;
alter table Department_1 Add currentsize INTEGER null;

insert into Department_1 (
DepartId,
DepartName,
Department_1.Budget,
Department_1.Maxcapacity,
Department_1.currentsize
)

select deptid, deptname, budget, maxcapacity, currentsize
from Department d
where d.deptid not in 
(
      select dd.departId
      from department_1 dd
      where dd.departid = d.deptid
      
);
