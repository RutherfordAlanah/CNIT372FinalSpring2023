--Q4: How do sales differ between the weekdays and the weekend for a given week? 
--------------------------------------------------------------------------------
/*
This question can help the business compare and know how to allocate resources 
accordingly or even when to focus schedule events, promotions, etc.?
*/

CREATE OR REPLACE PROCEDURE Get_Difference_TotalSales_Week_Weekend
    (p_week_start_date_monday IN DATE)
AS
    v_monday_date DATE;
    v_week_total NUMBER(6,2);
    v_weekend_total NUMBER(6,2);
BEGIN
    v_monday_date := p_week_start_date_monday;
    
    IF TRIM(TO_CHAR(v_monday_date, 'Day')) = 'Monday' THEN
        SELECT SUM(ORDERTOTAL) into v_week_total
        FROM ORDERS
        WHERE ORDERDATE BETWEEN v_monday_date AND (v_monday_date + 4);
        
        SELECT SUM(ORDERTOTAL) into v_weekend_total
        FROM ORDERS
        WHERE ORDERDATE BETWEEN (v_monday_date + 5) AND (v_monday_date + 6);
        
        IF v_week_total > v_weekend_total THEN
            DBMS_OUTPUT.PUT_LINE('$' || TO_CHAR(v_week_total - v_weekend_total) || ' more was made during the week than during the weekend.');
        ELSIF v_weekend_total > v_week_total THEN
            DBMS_OUTPUT.PUT_LINE('$' || TO_CHAR(v_weekend_total - v_week_total) || ' more was made during the weekend during than the week.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('The same was made during the week and weekend.');
        END IF;
        
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Total Week Sales');
        DBMS_OUTPUT.PUT_LINE('--------------------');
        DBMS_OUTPUT.PUT_LINE('$' || v_week_total);
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Total Weekend Sales');
        DBMS_OUTPUT.PUT_LINE('--------------------');
        DBMS_OUTPUT.PUT_LINE('$' || v_weekend_total);
    ELSE
        RAISE_APPLICATION_ERROR (-20000, 'Ensure the week start date you entered is a Monday!');
    END IF;
END Get_Difference_TotalSales_Week_Weekend;
/

EXECUTE Get_Difference_TotalSales_Week_Weekend('03-MAY-2021');

/*Q4 Results 

$15.97 more was made during the weekend during than the week.

Total Week Sales
--------------------
$15.4

Total Weekend Sales
--------------------
$31.37

*/

--Q5: Who was the top customer at each of the locationsr?  ? 
--------------------------------------------------------------------------------
/*
This question can help the business if they want to start a loyalty campaign and 
figure out which customer to feature or give a discount to.?
*/
CREATE OR REPLACE PROCEDURE Get_Top_Yearly_Customers_AtLocation
    (p_location_id IN LOCATIONS.LOCATIONID%TYPE)
AS
    CURSOR customer_top_order_total
    IS (SELECT CUSTOMERID
        FROM ORDERS
        WHERE LOCATIONID = p_location_id
        GROUP BY CUSTOMERID 
        HAVING SUM(ORDERTOTAL) = (SELECT MAX(SUM(ORDERTOTAL))
                                    FROM ORDERS
                                    WHERE LOCATIONID = p_location_id
                                    GROUP BY CUSTOMERID));
                                
    current_top_customer customer_top_order_total%ROWTYPE;
    
    current_top_customer_name VARCHAR2(100);
    current_top_customer_total NUMBER;
BEGIN 
    FOR current_top_customer IN customer_top_order_total LOOP
        SELECT FIRSTNAME || ' ' || LASTNAME into current_top_customer_name
        FROM CUSTOMERS
        WHERE CUSTOMERID = current_top_customer.CUSTOMERID;
        
        DBMS_OUTPUT.PUT_LINE(current_top_customer_name);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
END Get_Top_Yearly_Customers_AtLocation;
/

CREATE OR REPLACE PROCEDURE Get_Top_Yearly_Customers_EachLocation
AS
    CURSOR all_locations
    IS (SELECT * FROM LOCATIONS);
    
    current_location all_locations%ROWTYPE;
BEGIN
    FOR current_location IN all_locations LOOP
        DBMS_OUTPUT.PUT_LINE(current_location.locationname);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------');
        Get_Top_Yearly_Customers_AtLocation(current_location.locationid);
    END LOOP;    
END Get_Top_Yearly_Customers_EachLocation;
/

EXECUTE Get_Top_Yearly_Customers_EachLocation;

/*Q5 Results 

Purdue Campus - PMU
-----------------------------------------------------------------------
Courtney Lawrence

Chicago Loop
-----------------------------------------------------------------------
Dolan Baxter

Ocean Beach - Outer Sunset
-----------------------------------------------------------------------
Reagan Puckett

*/

--Q6: What are the top two least ordered flavors, from each location? ? 
--------------------------------------------------------------------------------
/*
This question can help the business decide which flavors to discontinue/drop to 
make room for future flavors.?
*/
CREATE OR REPLACE PROCEDURE Get_Top_2_LeastOrdered_AtLocation
    (p_location_id IN LOCATIONS.LOCATIONID%TYPE)
AS
    CURSOR worst_flavors
    IS (SELECT FLAVORNAME
        FROM FLAVORS
        WHERE FLAVORID IN (SELECT FLAVORID
                            FROM (SELECT FLAVORID, SUM(QUANTITY)
                                    FROM PRODUCTS P
                                    INNER JOIN ORDERLINEITEM OLI
                                    ON P.PRODUCTID = OLI.PRODUCTID
                                    WHERE OLI.PRODUCTID IN (SELECT PRODUCTID
                                                            FROM ORDERLINEITEM OLI
                                                            INNER JOIN ORDERS O
                                                            ON OLI.ORDERID = O.ORDERID
                                                            WHERE LOCATIONID = p_location_id)
                                    GROUP BY FLAVORID
                                    ORDER BY SUM(QUANTITY) ASC)
                            WHERE ROWNUM <= 2));
    
    current_flavor worst_flavors%ROWTYPE;
BEGIN
    FOR current_flavor IN worst_flavors LOOP
        DBMS_OUTPUT.PUT_LINE(current_flavor.FLAVORNAME);
    END LOOP; 
    DBMS_OUTPUT.PUT_LINE('');
END Get_Top_2_LeastOrdered_AtLocation;
/

CREATE OR REPLACE PROCEDURE Top_2_Least_Ordered_Flavors_EachLocation
AS
    CURSOR all_locations
    IS (SELECT * FROM LOCATIONS);
    
    current_location all_locations%ROWTYPE;
BEGIN
    FOR current_location IN all_locations LOOP
        DBMS_OUTPUT.PUT_LINE(current_location.locationname);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------');
        Get_Top_2_LeastOrdered_AtLocation(current_location.locationid);
    END LOOP; 
END Top_2_Least_Ordered_Flavors_EachLocation;
/

EXECUTE Top_2_Least_Ordered_Flavors_EachLocation;

/*Q6 Results 

Purdue Campus - PMU
-----------------------------------------------------------------------
Butter Pecan
Pistachio

Chicago Loop
-----------------------------------------------------------------------
Coffee
Pistachio

Ocean Beach - Outer Sunset
-----------------------------------------------------------------------
Chocolate Chip Cookie Dough
Coffee

*/

--Q7: What are the phone numbers/emails of each of the customers that placed more than X orders?  ? 
--------------------------------------------------------------------------------
/*
This question could provide the business with an easy way to reach out to 
customers and provide them with a discount to promote better customer relations.?
*/

CREATE OR REPLACE PROCEDURE Get_Customer_Contact_For_NumOrders
    (p_number_of_orders IN NUMBER) 
AS
    CURSOR all_customer_ids IS
        (SELECT CUSTOMERID
            FROM ORDERS
            GROUP BY CUSTOMERID
            HAVING COUNT(*) >= p_number_of_orders);
    
    current_customer_id all_customer_ids%ROWTYPE;
    current_customer_email CUSTOMERS.EMAIL%TYPE;
    current_customer_phone CUSTOMERS.PHONE%TYPE;
    current_customer_first CUSTOMERS.FIRSTNAME%TYPE;
    current_customer_last CUSTOMERS.LASTNAME%TYPE;
BEGIN
    FOR current_customer_id IN all_customer_ids LOOP
        SELECT EMAIL, PHONE, FIRSTNAME, LASTNAME into current_customer_email, current_customer_phone, current_customer_first, current_customer_last
        FROM CUSTOMERS
        WHERE CUSTOMERID = current_customer_id.CUSTOMERID;
        
        DBMS_OUTPUT.PUT(current_customer_first || ' ');
        DBMS_OUTPUT.PUT_LINE(current_customer_last);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Email: ' || current_customer_email);
        DBMS_OUTPUT.PUT_LINE('Phone: ' || current_customer_phone);
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END Get_Customer_Contact_For_NumOrders;
/

EXECUTE Get_Customer_Contact_For_NumOrders(5);


/*Q7 Results 

Savannah Lucas
----------------------------------------------
Email: lucas_savannah4960@icloud.com
Phone: 635-746-1371

Malachi Glass
----------------------------------------------
Email: glass-malachi1121@protonmail.org
Phone: 476-234-3285

Reagan Puckett
----------------------------------------------
Email: r-puckett@outlook.ca
Phone: 156-222-1458

*/

--DROP PROCEDURE Get_Difference_TotalSales_Week_Weekend;
--DROP PROCEDURE Get_Top_Yearly_Customers_EachLocation;
--DROP PROCEDURE Get_Top_Yearly_Customers_AtLocation;
--DROP PROCEDURE Top_2_Least_Ordered_Flavors_EachLocation;
--DROP PROCEDURE Get_Customer_Contact_For_NumOrders;
--DROP PROCEDURE Get_Top_2_LeastOrdered_AtLocation;

