set verify off;
SET SERVEROUTPUT ON;
--THIS SQL FILE IS DEDICATED ONLY FOR QUERY

--01 SEARCH A PARTICULAR EMPLOYEE INFORMATION AT A PARTICULAR SITE - SWITCH_CASE + INPUT + CURSOR

ACCEPT X NUMBER PROMPT "ENTER EMPLOYEE ID TO BE SEARCHED: "
ACCEPT Y NUMBER PROMPT "ENTER SITE ID:"


DECLARE 

	eID NUMBER := &X;
	siteID NUMBER := &Y;
	eName VARCHAR(13);
	ePhnN NUMBER ;
	eAddr VARCHAR(7);
	eSal NUMBER ;
	eGen CHAR ;
    eBr number(1) ;

BEGIN
	
	CASE siteID
		WHEN 1 THEN
			SELECT EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch INTO eName,ePhnN,eAddr,eSal,eGen,eBr FROM Employee@site_link WHERE EmployeeId = eID;
								
				DBMS_OUTPUT.PUT_LINE('EID        NAME        DOB      PHN       SALARY     GENDER      BRANCH');
				DBMS_OUTPUT.PUT_LINE(eID || '         ' || eName || '          ' || '         ' || ePhnN || '         ' || eSal || '         ' || eGen || '         ' ||eBr );
		
		WHEN 2 THEN
			SELECT EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch INTO eName,ePhnN,eAddr,eSal,eGen,eBr FROM Employee@site_link1 WHERE EmployeeId = eID ;
						
				DBMS_OUTPUT.PUT_LINE('EID        NAME        DOB      PHN       SALARY     GENDER      BRANCH');
				DBMS_OUTPUT.PUT_LINE(eID || '         ' || eName || '          ' || '         ' || ePhnN || '         ' || eSal || '         ' || eGen || '         ' ||eBr );			
		ELSE 
			DBMS_OUTPUT.PUT_LINE('INVALID SITE NUMBER');
	END CASE;
END;
/



ACCEPT W NUMBER PROMPT "ENTER PRODUCT ID TO BE SEARCHED: "
ACCEPT Z NUMBER PROMPT "ENTER SITE ID:"

--02 SEARCH A PARTICULAR PRODUCT INFORMATION AT A PARTICULAR SITE - IF_ELSE + INPUT + CURSOR
DECLARE 
	pID NUMBER := &W;
	siteID NUMBER := &Z;
	--pEmpId NUMBER ;
	pTitle VARCHAR2(8) ;
	pCat VARCHAR2(15) ;
	pStk NUMBER ;
	pSellPrice NUMBER ;
	pBr number(1) ;
	
BEGIN
	
	IF siteID = 1 THEN
		SELECT Title,Category,InStock,SellPrice,Branch INTO pTitle,pCat,pStk,pSellPrice,pBr FROM Product@site_link1 WHERE ProductId = pID;
	
			DBMS_OUTPUT.PUT_LINE('PID        TITLE        CATEGORY      IN-STOCK       SELLPRICE');
			DBMS_OUTPUT.PUT_LINE(pTitle || '          '|| pCat || '          '  || pStk || '         ' || pSellPrice);

	ELSIF siteID = 2 THEN
		SELECT Title,Category,InStock,SellPrice,Branch INTO pTitle,pCat,pStk,pSellPrice,pBr FROM Product@site_link1 WHERE ProductId = pID;

			
			DBMS_OUTPUT.PUT_LINE('PID        TITLE        CATEGORY      IN-STOCK       SELLPRICE');
			DBMS_OUTPUT.PUT_LINE(pTitle || '          '|| pCat || '          '  || pStk || '         ' || pSellPrice);

	END IF;

END;
/

--CALLING FUCNTION AND PROCUDRES 
--BEGIN
	--showAllProduct;
	--showCustomerInfo(2001,2);
--END;
--/



