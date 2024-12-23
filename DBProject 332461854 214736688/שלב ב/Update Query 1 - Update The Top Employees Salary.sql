Update Position
set salary = salary*1.10

where PosId in
(
select PosId
from Employee e 
natural join 
(
  Select Empid as id ,count(StartTime) as ShiftAmount
  from EmployeeShift
  where StartTime BETWEEN
  TO_DATE('&From', 'YYYY-MM-DD HH24:MI:SS') AND
  TO_DATE('&To', 'YYYY-MM-DD HH24:MI:SS')
  group by Empid
  having count(StartTime) =
  (
   select max(count(StartTime))
   from EmployeeShift
   where StartTime BETWEEN
   TO_DATE('&From', 'YYYY-MM-DD HH24:MI:SS')
   AND
   TO_DATE('&To', 'YYYY-MM-DD HH24:MI:SS')
   group by EmpId
  )
  OR
  Count(StartTime) =
  (
   select max(count(StartTime))
   from EmployeeShift
   where StartTime BETWEEN
   TO_DATE('&From', 'YYYY-MM-DD HH24:MI:SS')
   AND
   TO_DATE('&To', 'YYYY-MM-DD HH24:MI:SS')
   group by EmpId
  ) - 1
  OR
  count(StartTime) =
  (
   select max(count(StartTime))
   from EmployeeShift
   where StartTime BETWEEN
   TO_DATE('&From', 'YYYY-MM-DD HH24:MI:SS')
   AND
   TO_DATE('&To', 'YYYY-MM-DD HH24:MI:SS')
   group by EmpId
  ) - 2

) TopEmployee
);
