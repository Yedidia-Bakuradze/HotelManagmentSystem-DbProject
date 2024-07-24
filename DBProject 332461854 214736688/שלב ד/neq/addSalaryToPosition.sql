CREATE OR REPLACE PROCEDURE AddSalaryToPosition IS
    prev_deptId Employee_1.DepartId%TYPE := -1;
    generatedId NUMBER := 0;
BEGIN
  --Loop throught the table on the new values
    FOR emp IN (
        SELECT DepartId, salary 
        FROM Employee_1 
        WHERE salary IS NOT NULL
        ORDER BY DepartId
    )
    LOOP
        IF prev_deptId = -1 OR prev_deptId != emp.DepartId THEN
            generatedId := 0;
        ELSE
          --Reset counter
            generatedId := generatedId + 1;
        END IF;

        --Add new row
        INSERT INTO Position (posId, DepartId,MonthPay, role)
        VALUES (generatedId, emp.DepartId, emp.salary, 'New employee.');

        prev_deptId := emp.DepartId;
    END LOOP;
    COMMIT;
END AddSalaryToPosition;
