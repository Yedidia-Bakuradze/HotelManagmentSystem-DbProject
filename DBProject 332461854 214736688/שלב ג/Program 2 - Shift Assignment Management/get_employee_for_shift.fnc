CREATE OR REPLACE FUNCTION get_employee_for_shift(shift_start_time date)
RETURN NUMBER IS
    employee_id NUMBER;
    least_shifts NUMBER := 20;
    CURSOR c_employee IS
        SELECT e.Id
        FROM Employee e
        WHERE NOT EXISTS(
            SELECT 1 
            FROM EmployeeShift es 
            WHERE es.EmpId = e.Id 
            AND es.StartTime = shift_start_time
        );
    ref_cur SYS_REFCURSOR;
BEGIN
    OPEN c_employee;
    LOOP
        FETCH c_employee INTO employee_id;
        EXIT WHEN c_employee%NOTFOUND;

        
        OPEN ref_cur FOR
            SELECT COUNT(*) 
            FROM EmployeeShift 
            WHERE EmpId = employee_id;
        FETCH ref_cur INTO least_shifts;
        CLOSE ref_cur;

        IF least_shifts < 5 THEN 
            RETURN employee_id;
        END IF;
    END LOOP;
    CLOSE c_employee;

    RAISE_APPLICATION_ERROR(-20001, 'No suitable employee found for the shift.');
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Error in get_employee_for_shift: ' || SQLERRM);
END;
/
