CREATE OR REPLACE PROCEDURE RegisterEmployeeForTraining(Emp_Id in Number, training_id in Number, StartProgram in Date, EndProgram in Date) is
    Eligible BOOLEAN;
    
    Cursor EmpList is
        Select e.Id, e.FirstName, e.LastName, l.Status, l.startDate, l.endDate
        From Employee e
        Left join LeaveRequest l on e.Id = l.EmpId
        Where e.Id = Emp_Id;
    
    SingleEmp EmpList % ROWTYPE;

Begin
    Open EmpList;
    Fetch EmpList into SingleEmp;
    
    If EmpList % Found then
        Eligible := CheckEligibility(SingleEmp.id, StartProgram, EndProgram);
        
        If Eligible then
            Insert into EmployeeTraining (TrainedId, TrainingId) values (SingleEmp.id, training_id);
            COMMIT;
            DBMS_OUTPUT.PUT_LINE('Employee ' || SingleEmp.id ||' has been registered for training '|| training_id || ' successfully.');
        Else
            DBMS_OUTPUT.PUT_LINE('Employee ' || SingleEmp.id ||' is not eligible for training.');
        End if;
        
    Else
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
    End if;
    
    Close EmpList;

Exception
  -- If tries to add a user that already exists
    When DUP_VAL_ON_INDEX then
            DBMS_OUTPUT.PUT_LINE('User already Registered ' || SQLERRM);
        Rollback;
  -- If other errors
    When OTHERS then
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        Rollback;
End;
/
