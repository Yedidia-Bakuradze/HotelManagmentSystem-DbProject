PL/SQL Developer Test script 3.0
24
Declare
    Cursor EmpList is -- A cursor that holds the employees that we want to add to the new training
        Select Id
        From Employee
        Where ROWNUM <= 50;
    SingleEmp Employee%ROWTYPE;
    ProgramId NUMBER;
    ProgramSDate DATE := TO_DATE('2025-06-01', 'YYYY-MM-DD');
    ProgramEDate DATE := TO_DATE('2025-07-01', 'YYYY-MM-DD');
    Trainer Training.Trainerid%Type;
Begin
    
    Select max(TrainingId) + 1 into ProgramId from Training; -- Get the avilable id for the training
    Trainer :=783264172;
    -- Craete new training
    Insert into Training (TrainingId, TrainingName, EntreyLevel,Trainerid)
    Values (ProgramId, 'New Training', 'Intermediate',Trainer);
    Commit;

    -- Add employees
      For SingleEmp in EmpList loop
        RegisterEmployeeForTraining(SingleEmp.id, ProgramId, ProgramSDate, ProgramEDate); -- Try to add the user to the training
      End loop;
End;
0
1
emp_rec.id
