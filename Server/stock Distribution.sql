set verify off;
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE fragment(pId IN NUMBER, prodStock IN NUMBER) 
IS
	distributeStock NUMBER := prodStock;
	stock1 NUMBER;
	stock2 NUMBER;
	BEGIN
		select InStock INTO stock1 from PRODUCT@site_link where ProductId = pId;
		select InStock INTO stock2 from PRODUCT@site_link1 where ProductId = pId;
		IF MOD (distributeStock, 2) = 0 THEN 
			distributeStock := distributeStock / 2;
			stock1 := stock1 + distributeStock;
			stock2 := stock2 + distributeStock;
			UPDATE Product@site_link SET InStock = stock1 WHERE ProductId = pId;  
			UPDATE Product@site_link1 SET InStock = stock2 WHERE ProductId = pId; 
		ELSE
			distributeStock := distributeStock - 1;
			distributeStock := distributeStock / 2;
			stock1 := stock1 + distributeStock;
			stock2 := stock2 + distributeStock;
			UPDATE Product@site_link SET InStock = stock1 WHERE ProductId = pId;
			distributeStock := distributeStock + 1;
			UPDATE Product@site_link1 SET InStock = stock2 WHERE ProductId = pId; 
		END IF;
	END fragment;
/

DECLARE 
A NUMBER := &ENTER_Product_ID;
B NUMBER := &ENTER_Number_of_items;

BEGIN
	fragment(A, B);
END;
/