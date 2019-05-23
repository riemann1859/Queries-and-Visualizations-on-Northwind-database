--Write a query that returns customers who ordered product 12.

select o1."OrderID",o1."CustomerID", c."CompanyName",o2."ProductID"
from orders as o1
join customers as c
on c."CustomerID"=o1."CustomerID"
join order_details as o2
on o1."OrderID"=o2."OrderID"
where o2."ProductID"=12
