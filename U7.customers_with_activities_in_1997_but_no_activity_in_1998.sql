
--Write a query that returns customers who placed orders in 1997 but not in 1998.

select o."CustomerID",c."CompanyName"
from orders as o
join customers as c
on c."CustomerID"=o."CustomerID"
where extract(year from o."OrderDate")=1997

except

select o."CustomerID",c."CompanyName"
from orders as o
join customers as c
on c."CustomerID"=o."CustomerID"
where extract(year from o."OrderDate")=1998
