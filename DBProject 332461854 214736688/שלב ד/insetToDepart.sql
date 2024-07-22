
insert into Department_1 (DepartId, Departname,budget,maxcapacity,Department_1.currentsize)
select deptid, deptname, budget, maxcapacity, currentsize
from Department d
where d.deptid not in 
(
      select dd.departId
      from department_1 dd
      where dd.departid = d.deptid
      
);
