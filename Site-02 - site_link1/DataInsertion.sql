--THIS SQL FILE IS DEDICATED ONLY FOR  DATA INSERTATION TO TABLES OF DataBase.sql
set verify off;
SET SERVEROUTPUT ON;

--TABLE: EMPLOYEE

insert into Employee(EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch) VALUES('Rahat', 01618233345,'dhaka', 22000, 'M', 2);
insert into Employee(EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch) VALUES('Alvee', 01918233345,'dhaka', 22000, 'M', 2);
insert into Employee(EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch) VALUES('Aumi', 01818233345,'dhaka', 22000, 'M', 2);
insert into Employee(EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch) VALUES('Mustavi', 013182333225,'dhaka', 22000, 'M', 2);
insert into Employee(EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch) VALUES('Anamika', 01318133345,'dhaka', 22000, 'F', 2);
insert into Employee(EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch) VALUES('Katrina', 01718233345,'dhaka', 22000, 'F', 2);
insert into Employee(EmployeeName,PhoneNumber,EmployeeAddress,Salary,Gender,Branch) VALUES('Kareena', 01618233345,'dhaka', 22000, 'F', 2);

--TABLE : PRODUCT
INSERT INTO Product(EmployeeId, Title, Category, InStock, SellPrice, Branch) VALUES (2001, 'Jeans ', 'maleCloth', 23, 950,2);
INSERT INTO Product(EmployeeId, Title, Category, InStock, SellPrice, Branch) VALUES (2003, 'Kaitaki ', 'maleCloth', 13, 5000,2);
INSERT INTO Product(EmployeeId, Title, Category, InStock, SellPrice, Branch) VALUES (2001, '3piece ', 'FemaleCloth', 5, 1250,2);
INSERT INTO Product(EmployeeId, Title, Category, InStock, SellPrice, Branch) VALUES (2005, 'Suit ', 'maleCloth', 32, 670,2);
INSERT INTO Product(EmployeeId, Title, Category, InStock, SellPrice, Branch) VALUES (2005, 'Tie ', 'maleCloth', 8,905,2);

--TABLE : CUSTOMER // WORKS NEEDS FOR FOEEIGN KEY
INSERT INTO Customer(EmployeeId, Name, PhoneNumber, Gender) VALUES (2001, 'Ashik', 01318233345, 'M');
INSERT INTO Customer(EmployeeId, Name, PhoneNumber, Gender) VALUES (2002, 'Rahim', 01318233345, 'M');
INSERT INTO Customer(EmployeeId, Name, PhoneNumber, Gender) VALUES (2001, 'Karim', 01318233345, 'M');
INSERT INTO Customer(EmployeeId, Name, PhoneNumber, Gender) VALUES (2003, 'Jashim', 01318233345, 'M');
INSERT INTO Customer(EmployeeId, Name, PhoneNumber, Gender) VALUES (2004, 'Nahid', 01318233345, 'M');
INSERT INTO Customer(EmployeeId, Name, PhoneNumber, Gender) VALUES (2005, 'Mina', 01318233345, 'M');

--TABLE : ORDER // WORKS NEEDS FOR FOEEIGN KEY
INSERT INTO OrderDetail(EmployeeId, CustomerId, ProductId, TotalPrice) VALUES (2003, 2001, 1000001, 760.22);
INSERT INTO OrderDetail(EmployeeId, CustomerId, ProductId, TotalPrice) VALUES (2005, 2001, 1000001, 760.22);
INSERT INTO OrderDetail(EmployeeId, CustomerId, ProductId, TotalPrice) VALUES (2001, 2001, 1000001, 760.22);
INSERT INTO OrderDetail(EmployeeId, CustomerId, ProductId, TotalPrice) VALUES (2002, 2001, 1000001, 760.22);
INSERT INTO OrderDetail(EmployeeId, CustomerId, ProductId, TotalPrice) VALUES (2003, 2001, 1000001, 760.22);
INSERT INTO OrderDetail(EmployeeId, CustomerId, ProductId, TotalPrice) VALUES (2004, 2001, 1000001, 7760.22);


COMMIT;
