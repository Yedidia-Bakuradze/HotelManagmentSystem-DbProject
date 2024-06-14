select entreylevel,count(*)
from training t
join employeetraining et on et.trainingid = t.trainingid 
where t.trainingname = &<name="name of training" type="string" list="select distinct trainingname from training">
group by entreylevel
order by entreylevel
