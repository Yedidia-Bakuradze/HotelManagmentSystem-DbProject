CREATE OR REPLACE FUNCTION CheckEligibility(emp_id IN NUMBER, T_SDate IN DATE, T_EDate IN DATE) RETURN BOOLEAN IS
    LR_List SYS_REFCURSOR;
    LR_Status VARCHAR2(35);
    LR_SDate DATE;
    LR_EDate DATE;


Begin
    Open LR_List For
        Select Status, StartDate, EndDate
        From LeaveRequest
        Where EmpId = emp_id;
    
    Loop
        Fetch LR_List into LR_Status, LR_SDate, LR_EDate;
        Exit when LR_List % NotFound; 
        
        If LR_Status = 'Approved' then
            If LR_SDate <= T_EDate And LR_EDate >= T_SDate then
                Close LR_List;
                return false; 
            End If;
        End If;
    End Loop;
    
    
    Close LR_List;
    return true;

Exception
    When Others then
        IF LR_List % IsOpen then
            DBMS_OUTPUT.PUT_LINE('In Check Status ERROR: ' || SQLERRM);
            Close LR_List;
        End If;
End;
/
