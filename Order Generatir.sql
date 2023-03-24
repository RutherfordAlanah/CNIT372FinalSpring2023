drop table orders;

CREATE TABLE Orders (
    OrderID         number GENERATED by default on null as IDENTITY(START with 500000 INCREMENT by 1) PRIMARY KEY,
    OrderDate       date,
    OrderTotal      Number(6,2),
    PaymentType     varchar2(255),
    CustomerID      number(15), 
    LocationID      number(15),
    FOREIGN key(CustomerID) references customers (CustomerID),
    FOREIGN key(LocationID) references LOCATIONS (LocationID)
);


INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'17-Jun-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'07-Dec-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'19-Nov-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'07-Oct-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'20-Mar-23',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'19-May-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'14-May-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'03-Feb-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'16-Aug-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'13-Nov-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'09-Jun-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'28-May-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'03-Oct-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'14-Jun-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'06-Dec-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'24-Oct-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'15-Mar-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'04-Aug-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'17-Jun-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'08-May-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'11-Oct-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'14-Aug-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'14-Apr-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'27-Sep-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'18-Jan-23',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'17-Aug-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'02-Sep-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'09-Jan-23',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'30-Jul-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'19-Aug-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'11-Jul-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'02-May-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'16-Dec-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'18-Nov-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'29-Apr-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'26-Aug-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'15-Nov-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'22-Mar-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'02-Jan-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'12-Dec-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'16-Aug-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'29-Dec-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'15-Aug-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'20-Sep-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'09-Nov-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'16-Oct-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'09-Oct-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'26-Jan-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'26-Jun-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'29-Jan-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'05-Mar-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'10-Sep-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'24-Dec-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'30-Dec-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'17-Jan-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'16-Jun-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'31-Dec-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'15-Sep-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'17-Apr-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'23-Apr-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'27-May-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'04-May-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'16-Nov-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'23-Oct-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'30-Jul-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'29-Jan-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'13-Jul-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'22-Jun-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'28-Nov-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'16-Jul-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'20-May-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'25-Nov-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'10-Jun-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'16-Aug-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'11-Mar-23',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'14-Jan-23',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'25-Feb-23',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'06-Sep-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'20-Aug-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'26-Feb-23',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'23-Feb-23',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'26-May-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'03-Jun-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'02-Mar-23',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'12-Jul-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'09-Sep-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'11-Dec-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'11-Feb-23',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'03-Jul-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'07-Nov-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'14-Nov-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'31-Dec-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'07-May-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'22-Aug-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'09-Oct-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'13-Mar-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'06-Nov-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'23-Sep-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'12-Jul-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'16-Jun-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'04-Sep-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'22-Aug-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'28-Nov-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'14-Feb-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'29-Mar-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'08-Dec-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'08-Oct-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'29-Nov-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'27-Aug-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'26-Oct-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'06-Feb-23',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'01-Oct-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'14-Aug-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'21-Aug-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'03-Jun-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'23-Feb-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'05-Dec-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'20-May-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'22-May-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'12-Dec-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'13-Dec-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'22-Aug-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'22-Apr-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'02-Nov-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'24-Sep-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'22-Oct-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'02-Jul-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'14-Nov-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'07-Jul-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'16-Oct-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'14-Jul-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'02-May-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'20-May-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'25-May-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'31-May-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'26-Oct-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'04-Aug-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'22-May-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'22-Jun-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'08-Jan-23',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'07-Sep-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'15-Feb-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'17-Jul-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'11-Nov-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'17-Feb-23',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'09-Jun-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'22-Jun-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'11-Aug-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'15-Feb-23',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'26-Dec-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'08-Apr-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'27-Dec-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'03-May-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'22-Feb-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'30-Oct-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'10-Jan-23',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'15-Jan-23',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'13-May-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'20-Feb-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'15-May-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'07-Jan-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'16-Aug-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'21-Nov-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'04-Mar-23',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'12-Apr-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'08-Oct-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'05-Jun-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'27-Apr-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'08-Mar-23',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'27-Jul-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'04-Oct-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'02-May-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'09-Feb-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'19-Nov-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'07-Feb-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'12-Dec-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'02-Jul-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'01-May-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'06-Jan-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'20-Jan-21',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'14-Mar-23',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'25-Dec-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'29-Jan-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'04-Sep-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'08-May-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'30-Oct-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'28-Apr-21',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'14-Mar-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'20-Apr-20',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'16-Dec-22',NULL,'Credit Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'12-Jun-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'24-Jul-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'23-Jun-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'29-Sep-20',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'06-Dec-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'24-May-22',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'23-Nov-20',NULL,'Cash');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'22-Aug-22',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'16-Jun-21',NULL,'Debt Card');
INSERT INTO Orders (OrderID,Orderdate,OrderTotal,PaymentType)
VALUES (NULL,'29-Aug-20',NULL,'Credit Card');
