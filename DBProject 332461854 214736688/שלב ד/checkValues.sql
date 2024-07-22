select *
from Employee 
where employeeid not in  (
	select EmpId
	from Employee_1;
)


select *
from DEPARTMENT 
where deptid not in  (
	select DepartId
	from DEPARTMENT_1;
)