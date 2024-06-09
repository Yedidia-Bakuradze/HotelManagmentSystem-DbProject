select status,count(*) 
from ( 
     SELECT *
     FROM employee
     WHERE joindate
     BETWEEN (&<name="From" type="date" list="select distinct joinDate from Employee order by joinDate">)
     AND (&< name="To" type="date" list="select distinct joinDate from Employee order by joinDate desc" >)
) e join LeaveRequest lr on e.id = lr.empid

group by status
having
(status = 'Approved' or status = 'Denied')
order by count(*) DESC;
