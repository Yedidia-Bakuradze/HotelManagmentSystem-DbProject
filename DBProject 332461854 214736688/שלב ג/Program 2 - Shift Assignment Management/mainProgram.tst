PL/SQL Developer Test script 3.0
19
DECLARE
    v_start_date DATE := TO_DATE('29-MAY-2024', 'DD-MON-YYYY');
    v_num_shifts NUMBER := 10;
BEGIN
<<<<<<< HEAD
    -- Call the procedure
    create_and_assign_shifts(TO_DATE('10-MAY-23', 'DD-MON-YY'), TO_DATE('13-MAY-23', 'DD-MON-YY'));
=======
    create_and_assign_shifts(v_num_shifts, v_start_date);
>>>>>>> 9581c9025b7c05a3fad3c50daf030bb74fbe1142

    FOR rec IN (SELECT s.Starttime, s.Endtime, e.lastName
                FROM Shift s
                JOIN employeeshift es ON s.Starttime = es.Starttime
                JOIN Employee e ON es.empId = e.Id
                WHERE s.Starttime >= v_start_date AND s.Starttime < v_start_date + 7) LOOP
        DBMS_OUTPUT.PUT_LINE('Shift from ' || rec.Starttime || ' to ' || rec.Endtime || ' assigned to ' || rec.lastName);
    END LOOP;
    
EXCEPTION
    WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM); 
END;
/
0
0
