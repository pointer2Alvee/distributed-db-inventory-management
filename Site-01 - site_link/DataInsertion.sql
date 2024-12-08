--THIS SQL FILE IS DEDICATED ONLY FOR  DATA INSERTATION TO TABLES OF DataBase.sql
set verify off;
SET SERVEROUTPUT ON;

--TABLE: EMPLOYEE
insert into Employee(EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch) VALUES('Azmi', 01318233345,'dhaka', 22000, 'F', 1);
insert into Employee(EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch) VALUES('Rawna', 01718233345,'dhaka', 22000, 'M', 1);
insert into Employee(EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch) VALUES('Ema', 01813233345,'dhaka', 22000, 'F', 1);
insert into Employee(EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch) VALUES('nosheen', 01813233345,'dhaka', 22000, 'F', 1);
insert into Employee(EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch) VALUES('aumi', 01813233345,'dhaka', 22000, 'F', 1);

--TABLE : PRODUCT
INSERT INTO Product(EmployeeId, Title, Category, InStock, SellPrice, Branch) VALUES (1001, 'Saree ', 'FemaleCloth', 15, 2500,1);
INSERT INTO Product(EmployeeId, Title, Category, InStock, SellPrice, Branch) VALUES (1002, 'Pant ', 'FemaleCloth', 15, 2590,1);
INSERT INTO Product(EmployeeId, Title, Category, InStock, SellPrice, Branch) VALUES (1002, 'TShirt ', 'maleCloth', 12, 2550,1);
INSERT INTO Product(EmployeeId, Title, Category, InStock, SellPrice, Branch) VALUES (1003, 'Panjabi ', 'maleCloth', 44, 9050,1);
INSERT INTO Product(EmployeeId, Title, Category, InStock, SellPrice, Branch) VALUES (1004,'Jamdani ', 'FemaleCloth', 3, 5650,1);
INSERT INTO Product(EmployeeId, Title, Category, InStock, SellPrice, Branch) VALUES (1004, 'Shirt ', 'maleCloth', 9, 1000,1);

--TABLE : CUSTOMER // WORKS NEEDS FOR FOEEIGN KEY
INSERT INTO Customer(EmployeeId, Name, PhoneNumber, Gender) VALUES (1001, 'Ashik', 01318233345, 'M');
INSERT INTO Customer(EmployeeId, Name, PhoneNumber, Gender) VALUES (1001, 'Karim', 01318233345, 'M');
INSERT INTO Customer(EmployeeId, Name, PhoneNumber, Gender) VALUES (1002, 'Rahim', 01318233345, 'M');
INSERT INTO Customer(EmployeeId, Name, PhoneNumber, Gender) VALUES (1002, 'Jashim', 01318233345, 'M');
INSERT INTO Customer(EmployeeId, Name, PhoneNumber, Gender) VALUES (1001, 'Nahid', 01318233345, 'M');
INSERT INTO Customer(EmployeeId, Name, PhoneNumber, Gender) VALUES (1002, 'Mina', 01318233345, 'M');

--TABLE : ORDER // WORKS NEEDS FOR FOEEIGN KEY
INSERT INTO OrderDetail(EmployeeId, CustomerId, ProductId, TotalPrice) VALUES (1003, 1001, 1000001, 760.22);
INSERT INTO OrderDetail(EmployeeId, CustomerId, ProductId, TotalPrice) VALUES (1003, 1001, 1000001, 760.22);
INSERT INTO OrderDetail(EmployeeId, CustomerId, ProductId, TotalPrice) VALUES (1003, 1001, 1000001, 760.22);
INSERT INTO OrderDetail(EmployeeId, CustomerId, ProductId, TotalPrice) VALUES (1003, 1001, 1000001, 760.22);
INSERT INTO OrderDetail(EmployeeId, CustomerId, ProductId, TotalPrice) VALUES (1003, 1001, 1000001, 1760.22);
INSERT INTO OrderDetail(EmployeeId, CustomerId, ProductId, TotalPrice) VALUES (1003, 1001, 1000001, 2760.22);


COMMIT;
