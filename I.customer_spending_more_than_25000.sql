select  o."CustomerID",c."CompanyName", 
     sum(od."UnitPrice"*od."Quantity"*(1-od."Discount")) as revenue_provided_by_customer
from orders as o
join order_details as od
on o."OrderID"=od."OrderID"
join  customers as c
on c."CustomerID"=o."CustomerID"
group by 1,2
having sum(od."UnitPrice"*od."Quantity"*(1-od."Discount"))>25000
order by 3 desc; 
