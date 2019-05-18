select "CustomerID", "CompanyName"
from customers as c
where "Country" = 'Spain' and
    exists (
	        select * 
	        from orders as o
	        where o."CustomerID"=c."CustomerID"
	       )
	       
--the same query can be written with 'in' predicate as follows:

select "CustomerID", "CompanyName"
from customers as c
where "Country" = 'Spain' and
    "CustomerID" in (select "CustomerID" from orders)
