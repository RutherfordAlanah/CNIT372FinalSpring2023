DROP PACKAGE Frostbite_IceCream_Questions;
DROP TRIGGER NEW_CUSTOMER;

--Trigger for insert of new customer
CREATE OR REPLACE TRIGGER NEW_CUSTOMER
    AFTER INSERT ON CUSTOMERS
BEGIN
    DBMS_OUTPUT.PUT_LINE('A NEW CUSTOMER HAS COME TO THE ICECREAM SHOP');
END NEW_CUSTOMER;
/

--Package Spec------------------------------------------------------------------
CREATE PACKAGE Frostbite_IceCream_Questions AS
    --Procedures for Q1-3
    PROCEDURE outputinglocationmax;
    PROCEDURE outputinglocationmin;
    PROCEDURE ConeProcedure;
    
    --Procedures for Q4-7
    PROCEDURE Get_Difference_TotalSales_Week_Weekend(p_week_start_date_monday IN DATE);
    PROCEDURE Get_Top_Yearly_Customers_EachLocation;
    PROCEDURE Top_2_Least_Ordered_Flavors_EachLocation;
    PROCEDURE Get_Customer_Contact_For_NumOrders(p_number_of_orders IN NUMBER);
    
    --Procedures for Q8-10
    PROCEDURE MAX_ORDER_FLAVOR;
    PROCEDURE QUANTITY_FLAVOR;
    PROCEDURE AVG_QUANTITY_LOCATION;
    
    PROCEDURE Print_Answers_To_All_Questions;
END Frostbite_IceCream_Questions;
/

--Package Body
CREATE OR REPLACE PACKAGE BODY Frostbite_IceCream_Questions AS
    --Q1: Which shop is the most popular during the summer of 2022 (June-September)? By how much from the lowest shop? (take the highest and subtract by the lowest one)
    /*
    With this data the shop is doing the best can be rewarded and the company might not need to spend as much on advertising on that location
    */
    
    procedure outputinglocationmax
    as 
        v_locationName varchar2(200);
        v_Countmax number;
        v_difference number;
        v_countmin number;
    
        begin
            select loc.locationname,count(ords.locationid) into v_locationName,v_Countmax
            from orders ords
            inner join locations loc
                on loc.locationid=ords.locationid
            where ords.orderdate between to_date('01-06-22','DD-MM-YY') and to_date('31-08-22','DD-MM-YY')
            group by ords.locationid,loc.locationname
            fetch first 1 row only;
            
            select min(count(ords.locationid)) into v_countmin
            from orders ords
            where ords.orderdate between to_date('01-06-22','DD-MM-YY') and to_date('31-08-22','DD-MM-YY')
            group by ords.locationid
            ;
            select 
            v_countmax-v_countmin into v_difference
            from dual;
        
            dbms_output.put_line(v_locationName||' '||v_Countmax);
            dbms_output.put_line('Difference between the max and min is:'||''||v_difference);
        end;
        
    --exec outputinglocationmax();

    /* Question 1 results

    Purdue Campus - PMU 7
    Difference between the max and min is:5

    */

--------------------------------------------------------------------------------
    --Q2: Which one is the least popular during the summer (June-September)?
    /*
    The company needs to focus on this shop to ensure they can stop it from struggling and start making money
    */
    
    procedure outputinglocationmin
    as 
        v_locationName varchar2(200);
        v_countmin number;
    
        begin
            select loc.locationname,count(ords.locationid) into v_locationName,v_Countmin
            from orders ords
            inner join locations loc
                on loc.locationid=ords.locationid
            where ords.orderdate between to_date('01-06-22','DD-MM-YY') and to_date('31-08-22','DD-MM-YY')
            group by ords.locationid,loc.locationname
            order by count(ords.locationid) asc
            fetch first 1 row only;
            
            dbms_output.put_line(v_locationName||' '||v_Countmin);
        end;

    --exec outputinglocationmin();

    /* Question 2 Results
    Ocean Beach - Outer Sunset 2
    */
    
--------------------------------------------------------------------------------
    --Q3: Which type of cone is the most popular and how much do they cost in total?
    /*
    This allows the company to know what cones will be the most popular so they could bulk buy them if they wanted to save some money
    */
    
    procedure ConeProcedure 
    as
        v_containerprice number;
        v_containername varchar2(200);
    begin
        select sum(cont.CONTAINERPRICE*oli.QUANTITY),cont.containername into v_containerprice,v_containername
        from products prod
        inner join orderlineitem oli
            on prod.productid=oli.productid
        inner join containers cont
            on cont.containerid=prod.containerid
        group by cont.containername
        order by sum(cont.CONTAINERPRICE*oli.QUANTITY) desc
        fetch first 1 rows only;
        
        dbms_output.put_line(v_containerprice ||' '|| v_containername);
    end;

    --exec ConeProcedure();
    
    /* Quesiton 3 Result
    31.8 Gallon To-Go
    */
    
--------------------------------------------------------------------------------
    --Q4: How do sales differ between the weekdays and the weekend for a given week? 
    /*
    This question can help the business compare and know how to allocate resources 
    accordingly or even when to focus schedule events, promotions, etc.?
    */
    
    PROCEDURE Get_Difference_TotalSales_Week_Weekend
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
    
    --EXECUTE Get_Difference_TotalSales_Week_Weekend('03-MAY-2021');
    
    /*Q4 Results 
    $15.97 more was made during the weekend during than the week.
    Total Week Sales
    --------------------
    $15.4
    Total Weekend Sales
    --------------------
    $31.37
    */
    
--------------------------------------------------------------------------------
    --Q5: Who was the top customer at each of the locationsr? 
    /*
    This question can help the business if they want to start a loyalty campaign and 
    figure out which customer to feature or give a discount to.?
    */
    PROCEDURE Get_Top_Yearly_Customers_AtLocation
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
    
    PROCEDURE Get_Top_Yearly_Customers_EachLocation
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
    
    --EXECUTE Get_Top_Yearly_Customers_EachLocation;
    
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
    
--------------------------------------------------------------------------------
    --Q6: What are the top two least ordered flavors, from each location? ? 
    /*
    This question can help the business decide which flavors to discontinue/drop to 
    make room for future flavors.?
    */
    PROCEDURE Get_Top_2_LeastOrdered_AtLocation
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
    
    PROCEDURE Top_2_Least_Ordered_Flavors_EachLocation
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
    
    --EXECUTE Top_2_Least_Ordered_Flavors_EachLocation;
    
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
    
--------------------------------------------------------------------------------
    --Q7: What are the phone numbers/emails of each of the customers that placed more than X orders?  ? 
    /*
    This question could provide the business with an easy way to reach out to 
    customers and provide them with a discount to promote better customer relations.?
    */
    
    PROCEDURE Get_Customer_Contact_For_NumOrders
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
    
    --EXECUTE Get_Customer_Contact_For_NumOrders(5);

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
    
--------------------------------------------------------------------------------
    --Q8: What are the most ordered flavors for all locations based on number of orders
    /*
    This question is veryimportant to let the business know what 
    flavors is sold the most based on number of orders. 
    */
    
    PROCEDURE MAX_ORDER_FLAVOR
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
    
    --EXECUTE MAX_ORDER_FLAVOR;
    
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
    
--------------------------------------------------------------------------------
    --Q9: What are the number of scoops sold for each flavor 
    /*this question is usefull to calculate the number of scoops sold for each flavor
    to help business design promotional offers
    */
    
    PROCEDURE QUANTITY_FLAVOR
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
    
    --EXECUTE QUANTITY_FLAVOR;
    
    /* Query Results
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
    
--------------------------------------------------------------------------------
    --Q10: What is the average quantity of icecream per order for given location
    /* This statistic can be useful to improve up marketting strategy and promotional offers
    Eg. Since the avg number of scoops is 2 there can be an offer of buy 3 and get 1 free making customer 
    go for 3 instead of 2 scoops
    */
    
    PROCEDURE AVG_QUANTITY_LOCATION
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
        
    --EXECUTE AVG_QUANTITY_LOCATION();
    
    /* Query Results
    Ocean Beach - Outer Sunset: 1.96
    Purdue Campus - PMU: 1.93
    Chicago Loop: 1.95
    */
    
--------------------------------------------------------------------------------
    PROCEDURE Print_Answers_To_All_Questions
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Questions 1-3 Answers');
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('***Q1: Which shop is the most popular during the summer of 2022 (June-September)? By how much from the lowest shop?');
        DBMS_OUTPUT.PUT_LINE('');
        outputinglocationmax;
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('***Q2: Which one is the least popular during the summer (June-September)?');
        DBMS_OUTPUT.PUT_LINE('');
        outputinglocationmin;
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('***Q3: Which type of cone is the most popular and how much do they cost in total?');
        DBMS_OUTPUT.PUT_LINE('');
        ConeProcedure;
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Questions 4-7 Answers');
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('***Q4: How do sales differ between the weekdays and the weekend for a given week? (03-MAY-2021)');
        DBMS_OUTPUT.PUT_LINE('');
        Get_Difference_TotalSales_Week_Weekend('03-MAY-2021');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('***Q5: Who was the top customer at each of the locations?');
        DBMS_OUTPUT.PUT_LINE('');
        Get_Top_Yearly_Customers_EachLocation;
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('***Q6: What are the top two least ordered flavors, from each location?');
        DBMS_OUTPUT.PUT_LINE('');
        Top_2_Least_Ordered_Flavors_EachLocation;
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('***Q7: What are the phone numbers/emails of each of the customers that placed more than X orders? (5)');
        DBMS_OUTPUT.PUT_LINE('');
        Get_Customer_Contact_For_NumOrders(5);
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Questions 8-10 Answers');
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('***Q8: What are the most ordered flavors for all locations based on number of orders?');
        DBMS_OUTPUT.PUT_LINE('');
        MAX_ORDER_FLAVOR;
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('***Q9: What are the number of scoops sold for each flavor?');
        DBMS_OUTPUT.PUT_LINE('');
        QUANTITY_FLAVOR;
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('***Q10: What is the average quantity of icecream per order for given location?');
        DBMS_OUTPUT.PUT_LINE('');
        AVG_QUANTITY_LOCATION;
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('***Q11: What happens when a new customer comes in? (Trigger)');
        DBMS_OUTPUT.PUT_LINE('');
        INSERT INTO CUSTOMERS VALUES(400100, 'Priyen', 'Shah', 'priyenshah2@gmail.com', '765-413-3314');
    END Print_Answers_To_All_Questions;
END Frostbite_IceCream_Questions;
/

SET SERVEROUTPUT ON;

BEGIN
    DELETE FROM CUSTOMERS
    WHERE CUSTOMERID = 400100;
    
    Frostbite_IceCream_Questions.Print_Answers_To_All_Questions;
END;
/
