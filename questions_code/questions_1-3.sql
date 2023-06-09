--Which shop is the most popular during the summer of 2022 (June-September)? By how much from the lowest shop? (take the highest and subtract by the lowest one)
/*
With this data the shop is doing the best can be rewarded and the company might not need to spend as much on advertising on that location
*/

create or replace procedure outputinglocationmax
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
/
exec outputinglocationmax();

/* Question 1 results

Purdue Campus - PMU 7
Difference between the max and min is:5

*/

--Which one is the least popular during the summer (June-September)?
/*
The company needs to focus on this shop to ensure they can stop it from struggling and start making money

*/

create or replace procedure outputinglocationmin
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
/
exec outputinglocationmin();

/* Question 2 Results

Ocean Beach - Outer Sunset 2

*/

--Which type of cone is the most popular and how much do they cost in total?
/*
This allows the company to know what cones will be the most popular so they could bulk buy them if they wanted to save some money
*/

/*select sum(cont.CONTAINERPRICE*oli.QUANTITIY),cont.containername--, oli.QUANTITIY,cont.CONTAINERPRICE
from products prod
inner join orderlineitem oli
    on prod.productid=oli.productid
inner join containers cont
    on cont.containerid=prod.containerid
group by cont.containername
order by sum(cont.CONTAINERPRICE*oli.QUANTITIY) desc;*/

create or replace procedure ConeProcedure 
as
    v_containerprice number;
    v_containername varchar2(200);
begin
    select sum(cont.CONTAINERPRICE*oli.QUANTITIY),cont.containername into v_containerprice,v_containername
    from products prod
    inner join orderlineitem oli
        on prod.productid=oli.productid
    inner join containers cont
        on cont.containerid=prod.containerid
    group by cont.containername
    order by sum(cont.CONTAINERPRICE*oli.QUANTITIY) desc
    fetch first 1 rows only;
    
    dbms_output.put_line(v_containerprice ||' '|| v_containername);
end;
/
exec ConeProcedure();

/* Quesiton 3 Result

31.8 Gallon To-Go

*/