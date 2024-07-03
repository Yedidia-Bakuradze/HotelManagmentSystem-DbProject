PL/SQL Developer Test script 3.0
22

DECLARE
    v_start_date DATE := TO_DATE('20-MAY-2025', 'DD-MON-YYYY');
    v_num_shifts NUMBER := 10;
BEGIN
    -- Call the procedure to create and assign shifts
    create_and_assign_shifts(v_num_shifts, v_start_date);

    -- Display the created shifts and their assigned employees
    FOR rec IN (SELECT s.Starttime, s.Endtime, e.lastName
                FROM Shift s
                JOIN employeeshift es ON s.Starttime = es.Starttime
                JOIN Employee e ON es.empId = e.Id
                WHERE s.Starttime >= v_start_date) LOOP
        DBMS_OUTPUT.PUT_LINE('Shift from ' || rec.Starttime || ' to ' || rec.Endtime || ' assigned to ' || rec.lastName);
    END LOOP;
    
EXCEPTION
    WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
0
0
