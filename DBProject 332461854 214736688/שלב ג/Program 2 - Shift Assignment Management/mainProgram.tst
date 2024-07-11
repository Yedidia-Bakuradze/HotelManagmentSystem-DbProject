PL/SQL Developer Test script 3.0
16
DECLARE
    v_shift_start_time TIMESTAMP := TO_TIMESTAMP('2023-06-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS');
    v_employee_id NUMBER;
BEGIN
    -- Call the procedure
    create_and_assign_shifts(TO_DATE('10-MAY-23', 'DD-MON-YY'), TO_DATE('13-MAY-23', 'DD-MON-YY'));

    -- Call the function to get an employee for a specific shift
    v_employee_id := get_employee_for_shift(v_shift_start_time);
    
    DBMS_OUTPUT.PUT_LINE('Employee ID for shift starting at ' || v_shift_start_time || ' is: ' || v_employee_id);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
0
0
