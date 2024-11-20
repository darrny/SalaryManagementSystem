CREATE OR REPLACE PROCEDURE PaySalary (
    emp_id IN NUMBER,
    salary_month IN VARCHAR2
) IS
    salary_amount NUMBER;
    valid NUMBER;
BEGIN
    -- Check if salary is valid
    valid := CheckValid(emp_id, salary_month);
    IF valid = 1 THEN
        -- Generate salary
        salary_amount := GenerateSalary(emp_id, salary_month);

        -- Perform transaction
        TransectSalary(emp_id, salary_amount, salary_month);
        DBMS_OUTPUT.PUT_LINE('Salary Paid Successfully: ' || salary_amount);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary Payment Invalid.');
    END IF;
END;
/

CREATE OR REPLACE FUNCTION GenerateSalary (
    emp_id IN NUMBER,
    salary_month IN VARCHAR2
) RETURN NUMBER IS
    basic_salary NUMBER;
    allowance NUMBER;
    leave_days NUMBER;
    total_salary NUMBER;
BEGIN
    SELECT Basic, Allowance INTO basic_salary, allowance 
    FROM Salary S, Employee_Salary ES
    WHERE ES.EID = emp_id AND ES.SID = S.SID;

    SELECT L_Days INTO leave_days 
    FROM Leave 
    WHERE EID = emp_id AND L_Month = salary_month;

    -- Calculate salary
    total_salary := (basic_salary + allowance) - (basic_salary / 30 * leave_days);
    RETURN total_salary;
END;
/

