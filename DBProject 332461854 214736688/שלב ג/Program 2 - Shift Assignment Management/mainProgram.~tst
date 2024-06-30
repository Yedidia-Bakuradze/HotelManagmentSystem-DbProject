PL/SQL Developer Test script 3.0
19
DECLARE
    v_shift_start_time TIMESTAMP;
    v_employee_id NUMBER;
BEGIN
    -- Call the procedure to assign shifts for the next 7 days
    assign_shifts(TO_DATE('03-JUN-24', 'DD-MON-YY'), TO_DATE('13-JUN-24', 'DD-MON-YY'));

    -- Example shift start time for which we want to find an employee
    v_shift_start_time := TO_TIMESTAMP('2024-07-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS');
    
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
