
--What are the most ordered flavors for all locations based on number of orders

/*
This question is veryimportant to let the business know what 
flavors is sold the most based on number of orders. 

*/


CREATE OR REPLACE PROCEDURE MAX_ORDER_FLAVOR
AS 
    F_ID PRODUCTS.FLAVORID%TYPE;
    AMOUNT NUMBER;
    NAME VARCHAR(50);
    CURSOR FLAVOR_COUNT_LIST
    IS 
        SELECT P.FLAVORID, COUNT(*)
        FROM PRODUCTS P INNER JOIN ORDERLINEITEM O ON P.PRODUCTID = O.PRODUCTID
        INNER JOIN FLAVORS F ON F.FLAVORID = P.FLAVORID
        GROUP BY P.FLAVORID
        ORDER BY COUNT(*) DESC;

BEGIN
    OPEN FLAVOR_COUNT_LIST;
    FETCH FLAVOR_COUNT_LIST INTO F_ID, AMOUNT;
    
    WHILE FLAVOR_COUNT_LIST%FOUND LOOP
    
        SELECT FLAVORNAME INTO NAME FROM FLAVORS WHERE FLAVORID = F_ID;
    
        DBMS_OUTPUT.PUT_LINE(NAME || ': ' ||  AMOUNT);
        FETCH FLAVOR_COUNT_LIST INTO F_ID, AMOUNT;
    END LOOP;
    
END MAX_ORDER_FLAVOR;

EXECUTE MAX_ORDER_FLAVOR();

/* Query Results

Vanilla: 50
Strawberry: 48
Birthday Cake: 46
Cookies N Cream: 44
Butter Pecan: 39
Chocolate: 38
Mint Chocolate Chip: 37
Chocolate Chip Cookie Dough: 35
Coffee: 34
Pistachio: 34

*/


--What are the number of scoops sold for each flavor 

/*this question is usefull to calculate the number of scoops sold for each flavor
to help business design promotional offers
*/

CREATE OR REPLACE PROCEDURE QUANTITY_FLAVOR
AS 
    F_ID PRODUCTS.FLAVORID%TYPE;
    AMOUNT NUMBER;
    NAME VARCHAR(50);
    VAL NUMBER;
    CURSOR FLAVOR_COUNT_LIST
    IS 
        SELECT P.FLAVORID, COUNT(*)
        FROM PRODUCTS P INNER JOIN ORDERLINEITEM O ON P.PRODUCTID = O.PRODUCTID
        INNER JOIN FLAVORS F ON F.FLAVORID = P.FLAVORID
        GROUP BY P.FLAVORID
        ORDER BY COUNT(*) DESC;

BEGIN
    OPEN FLAVOR_COUNT_LIST;
    FETCH FLAVOR_COUNT_LIST INTO F_ID, VAL;
    
    WHILE FLAVOR_COUNT_LIST%FOUND LOOP
    
        SELECT FLAVORNAME INTO NAME FROM FLAVORS WHERE FLAVORID = F_ID;
        SELECT SUM(QUANTITY) INTO AMOUNT FROM ORDERLINEITEM O 
        INNER JOIN PRODUCTS P ON P.PRODUCTID = O.PRODUCTID
        WHERE FLAVORID = F_ID;
    
        DBMS_OUTPUT.PUT_LINE(NAME || ': ' ||  AMOUNT);
        FETCH FLAVOR_COUNT_LIST INTO F_ID, VAL;
    END LOOP;
    
    
END;

EXECUTE QUANTITY_FLAVOR();

/*

Birthday Cake: 98
Coffee: 63
Chocolate Chip Cookie Dough: 68
Pistachio: 62
Cookies N Cream: 90
Butter Pecan: 72
Mint Chocolate Chip: 70
Strawberry: 94
Chocolate: 72
Vanilla: 99

*/

--What is the average quantity of icecream per order for given location
/* This statistic can be useful to improve up marketting strategy and promotional offers
Eg. Since the avg number of scoops is 2 there can be an offer of buy 3 and get 1 free making customer 
go for 3 instead of 2 scoops
*/

CREATE OR REPLACE PROCEDURE AVG_QUANTITY_LOCATION
AS

    NAME VARCHAR(50);
    QUAN NUMBER;
    CURSOR c IS
        SELECT TRIM(LOCATIONNAME), ROUND(AVG(QUANTITY),2)
        FROM ORDERLINEITEM O INNER JOIN ORDERS OD ON O.ORDERID = OD.ORDERID
        INNER JOIN LOCATIONS L ON OD.LOCATIONID = L.LOCATIONID
        GROUP BY LOCATIONNAME;
BEGIN
    OPEN C;
    FETCH C INTO NAME, QUAN;
    WHILE C%FOUND LOOP
    
        DBMS_OUTPUT.PUT_LINE(NAME || ': ' ||  QUAN);
        FETCH C INTO NAME, QUAN;
    END LOOP;
END;
    
EXECUTE AVG_QUANTITY_LOCATION();

/*
Ocean Beach - Outer Sunset: 1.96
Purdue Campus - PMU: 1.93
Chicago Loop: 1.95
*/
    
        
    
    
    
