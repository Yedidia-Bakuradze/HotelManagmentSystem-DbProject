

DELETE FROM employeetraining
WHERE trainingid  IN (
   select trainingid from training
   where trainerid = 704184819
);

delete from training 
where trainerid in (select trainerid from training
where trainerid = 704184819
)
