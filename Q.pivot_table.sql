--0:'no orders
--1:'up to seven orders'
--2:'more than seven orders'


with table_ as (
SELECT * 
FROM crosstab(  'select "City", customer_categories, count("CustomerID")
                 from (
                        select c."CustomerID", c."CompanyName", c."City",
                           case 
	                            when count(o."OrderID")=0 then 0
		                          when count(o."OrderID")<=7 then 1
		                          else 2
	                         end as customer_categories
                        from customers as c
                        left outer join orders as o
                        on c."CustomerID"=o."CustomerID"
                        group by 1,2,3) as sub
                 group by 1,2
			           order by 1', 'VALUES (0),(1),(2)  ')
     AS ct("City" text, "0" int, "1" int, "2" int))
		   
select "City",coalesce("0", 0) as "no orders",
		   coalesce("1", 0) as "up to seven orders",
		   coalesce("2", 0) as "more than seven orders"
from table_
order by 1
		 



