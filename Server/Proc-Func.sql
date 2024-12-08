set verify off;
SET SERVEROUTPUT ON;
--THIS SQL FILE IS DEDICATED ONLY FOR PROCEDURES AND FUNCTION CREATIONS
--PROC AND FUNCS MAY/N BE CALLED HERE

--01 SHOW ALL PRODUCTS IN ALL SITES
CREATE OR REPLACE PROCEDURE showAllProduct IS

	pTitle VARCHAR2(8);
	pCat VARCHAR2(15);
	pStk NUMBER;
	pSellPrice NUMBER;
	pBr NUMBER(1);
	pId NUMBER;

BEGIN
	
	DBMS_OUTPUT.PUT_LINE('PID     TITLE   CATEGORY   IN-STOCK    SELLPRICE      BRANCH'   );
	FOR c IN (SELECT * FROM Product@site_link UNION SELECT * FROM Product@site_link1) 
	LOOP 
		pId := c.ProductId;
		pTitle := c.Title;
		pCat := c.Category;
		pStk := c.InStock;
		pSellPrice := c.SellPrice;
		pBr := c.Branch;
		
		DBMS_OUTPUT.PUT_LINE(pId || '         ' || pTitle || '          ' || pStk || '         ' || pSellPrice || '         ' || pBr);
	END LOOP;

END showAllProduct;
/


--02 SHOW INFO OF A PARTICULAR CUSTOMER

CREATE OR REPLACE PROCEDURE showCustomerInfo(cusID IN NUMBER, siteID IN NUMBER) IS
	cEmployeeId NUMBER;
	cName VARCHAR2(7);
	cPhoneNumber NUMBER ;
	cGender CHAR ;
	cHasMemberShip NUMBER(1);
BEGIN

	IF siteID = 1 THEN
		SELECT EmployeeId,Name,PhoneNumber,Gender,HasMemberShip INTO cEmployeeId,cName,cPhoneNumber,cGender,cHasMemberShip FROM Customer@site_link WHERE CustomerId = cusID;
		DBMS_OUTPUT.PUT_LINE('NAME        PHN        PUR-QTY      SPENT     GEN  ' );
		DBMS_OUTPUT.PUT_LINE( cName || ' ' || cPhoneNumber || ' ' || cGender ||' ' || cHasMemberShip );
	ELSIF siteID = 2 THEN
		SELECT EmployeeId,Name,PhoneNumber,Gender,HasMemberShip INTO cEmployeeId,cName,cPhoneNumber,cGender,cHasMemberShip FROM Customer@site_link WHERE CustomerId = cusID;
		DBMS_OUTPUT.PUT_LINE('NAME        PHN        PUR-QTY      SPENT     GEN  ' );
		DBMS_OUTPUT.PUT_LINE( cName || ' ' || cPhoneNumber || ' ' || cGender ||' ' || cHasMemberShip );
	END IF;

END showCustomerInfo;
/