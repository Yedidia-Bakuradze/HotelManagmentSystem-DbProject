select d.departid, d.departname , e.id , e.firstname, e.lastname, p.role, p.salary
from department d
join employee e on e.departid = d.departid
join position p on e.posid = p.posid
where d.departid = &<name="Department id:" type="integer" list="select departid from department" >
