select "CustomerID", "CompanyName"
from customers as c
where "Country" = 'Spain' and
     not exists (
		         select * from orders as o
		         where o."CustomerID"=c."CustomerID"
		        )
		        
 --The following query also produces the same output
 
select "CustomerID", "CompanyName"
from customers as c
where "Country" = 'Spain' and
    "CustomerID" not in (select "CustomerID" from orders)
