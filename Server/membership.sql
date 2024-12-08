set verify off;
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE HasMemberShip 
IS
	orderId OrderDetail.OrderId%TYPE;
	empId OrderDetail.EmployeeId%TYPE;
	custId OrderDetail.CustomerId%TYPE;
	pId OrderDetail.ProductId%TYPE;
	price OrderDetail.TotalPrice%TYPE;
	csID Number;
	branch_one Number;
	branch_one Number;
	member_one Number;
BEGIN
		--DBMS_OUTPUT.PUT_LINE(1500);
		FOR c IN (SELECT * FROM OrderDetail@site_link UNION SELECT * FROM OrderDetail@site_link1)
		LOOP
			custId := c.CustomerId;
			price := c.TotalPrice;
			--DBMS_OUTPUT.PUT_LINE(custId);	
			IF price >= 1500 THEN
				--Select HasMemberShip into member FROM Customer@site_link WHERE CustomerId = custId;
				--Select HasMemberShip into member FROM Customer@site_link1 WHERE CustomerId = custId;
				DBMS_OUTPUT.PUT_LINE(price);
				UPDATE CUSTOMER@site_link SET HasMemberShip = 1 WHERE CustomerId = custId;
				UPDATE CUSTOMER@site_link1 SET HasMemberShip = 1 WHERE CustomerId = custId;
			END IF;
			--FOR p IN (SELECT OrderId, TotalPrice INTO orderId, price FROM OrderDetail WHERE CustomerId = custId)
			--DBMS_OUTPUT.PUT_LINE(custId);
			--LOOP
				--price := p.TotalPrice;
				--IF price >= 1500 THEN
					--DBMS_OUTPUT.PUT_LINE(price);
				--	UPDATE Customer SET HasMemberShip = 1 WHERE CustomerId = custId;
				--END IF;
			--END LOOP;
		END LOOP;
END HasMemberShip;
/

EXECUTE HasMemberShip;

