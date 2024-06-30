CREATE OR REPLACE PROCEDURE assign_shifts(start_date DATE, end_date DATE) IS
    v_employee_id NUMBER;
    CURSOR c_shifts IS
        SELECT StartTime 
        FROM Shift s
        WHERE NOT EXISTS (
            SELECT 1 
            FROM EmployeeShift es 
            WHERE es.StartTime = s.StartTime
        )
        AND s.StartTime BETWEEN start_date AND end_date;
    shift_rec c_shifts%ROWTYPE;
BEGIN
    OPEN c_shifts;
    LOOP
        FETCH c_shifts INTO shift_rec;
        EXIT WHEN c_shifts%NOTFOUND;

        BEGIN
            v_employee_id := get_employee_for_shift(shift_rec.StartTime);
            INSERT INTO EmployeeShift (EmpId, StartTime)
            VALUES (v_employee_id, shift_rec.StartTime);
        EXCEPTION
            WHEN OTHERS THEN
                -- Log the shift details for manual review
                INSERT INTO ShiftAssignmentLog (StartTime, Error)
                VALUES (shift_rec.StartTime, SQLERRM);
        END;
    END LOOP;
    CLOSE c_shifts;
END assign_shifts;
/
