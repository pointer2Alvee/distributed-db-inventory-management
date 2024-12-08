set verify off;
SET SERVEROUTPUT ON;


DECLARE 
	aID number := &Admin_ID;
	aPass varchar2(30) := '&Password';
    adID number := 0;
    adPass varchar2(30) ;
    A number;
    B varchar(35);
    C number;
    D number(1);
    v number(1);
    
BEGIN

    SELECT adminPass INTO adPass FROM ADMIN WHERE adminID = aID;

    IF adPass = aPass THEN
        DBMS_OUTPUT.PUT_LINE('logged in successfully');
        DBMS_OUTPUT.PUT_LINE('press 1 for site 1,     press 2 for site 2');
        v := &x;
        IF v = 1 THEN
            FOR R IN (SELECT * FROM Employee@site_link) LOOP
            A := R.EmployeeId;
            B := R.EmployeeName;
            C := R.Salary;
            D := R.Branch;
            DBMS_OUTPUT.PUT_LINE('from site 1');
            DBMS_OUTPUT.PUT_LINE('ID        Name        Salary      Branch');
            DBMS_OUTPUT.PUT_LINE(A || '         ' || B || '          ' || C || '         ' || D);
            END LOOP;
        elsif v = 2 THEN
            FOR R IN (SELECT * FROM Employee@site_link1) LOOP
            A := R.EmployeeId;
            B := R.EmployeeName;
            C := R.Salary;
            D := R.Branch;
            DBMS_OUTPUT.PUT_LINE('from site 1');
            DBMS_OUTPUT.PUT_LINE('ID        Name        Salary      Branch');
            DBMS_OUTPUT.PUT_LINE(A || '         ' || B || '          ' || C || '         ' || D);
            END LOOP;    
            
    ELSE    
        DBMS_OUTPUT.PUT_LINE('WRONG ID OR PASSWORD');
    END IF;    

END;
/
