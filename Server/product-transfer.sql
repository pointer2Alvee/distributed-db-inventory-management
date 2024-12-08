SET VERIFY OFF;
SET SERVEROUTPUT ON;

--drop PACKAGE ProductTransferPack;

CREATE OR REPLACE PACKAGE ProductTransferPack AS
	PROCEDURE Transfer(pID IN NUMBER, items IN NUMBER);
END ProductTransferPack;
/

CREATE OR REPLACE PACKAGE BODY ProductTransferPack AS

	PROCEDURE Transfer(pID IN NUMBER, items IN NUMBER)
	IS 
	
	pInstock NUMBER;
    pInstocks NUMBER;
    FLAG NUMBER(1) := 0;
    pTitle VARCHAR2(8);
    pCategory VARCHAR2(15);
    pSellprice NUMBER;
	prID NUMBER;
	ps number;
	
	BEGIN
		FOR S IN (select * from Product@site_link) LOOP
			--DBMS_OUTPUT.PUT_LINE(S.instock);   
			pInstock := S.InStock;
			pTitle := S.Title;
			pCategory := S.Category;
			pSellprice := S.SellPrice;
			
			IF S.ProductId = pID THEN
				pInstock := items + pInstock;
				UPDATE Product@site_link SET InStock = pInstock WHERE ProductId = pID;
				select InStock INTO pInstocks from Product@site_link1 where ProductId = pID;
			   
				pInstocks := pInstocks - items;
			    UPDATE Product@site_link1 SET InStock = pInstocks where ProductId = pID;
			   	--DBMS_OUTPUT.PUT_LINE(pInstocks);
				FLAG := 1;  
			ELSE 
				 IF FLAG != 1 THEN
                    FLAG := 0;
                END IF;	
			END IF;
			IF FLAG = 0 THEN
				INSERT INTO Product@site_link(EmployeeId, Title, Category, InStock, SellPrice, Branch) VALUES (9999,pTitle, pCategory, items, pSellprice, 1);
			
				--pInstock1 = pInstock1 - items;
				--UPDATE Product@site_link SET instock = pInstock1;
			END IF;
		
        END LOOP; 
   
		
	END Transfer;
	
END ProductTransferPack;
/
		
DECLARE
    A NUMBER := &ENTER_Product_ID;
    B NUMBER := &ENTER_Number_of_items;
    empID NUMBER;
    no_input EXCEPTION;

BEGIN   

	
	IF B < 0 THEN
		RAISE no_input;
	END IF;
	
	--EXEC 
	ProductTransferPack.Transfer(A,B);
	
	
	EXCEPTION 
	   WHEN no_input THEN 
		  dbms_output.put_line('INVALID INPUT VALUE');

END;
/

commit;