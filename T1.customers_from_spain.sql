select "CustomerID", "CompanyName"
from customers as c
where "Country" = 'Spain' and
    exists (
	        select * 
	        from orders as o
	        where o."CustomerID"=c."CustomerID"
	       )
