select    c."CategoryID", c."CategoryName",
     sum(od."UnitPrice"*od."Quantity"*(1-od."Discount")) as revenue_provided_by_customer
from orders as o
join order_details as od
on o."OrderID"=od."OrderID"
join products as p
on p."ProductID"=od."ProductID"
join categories as c
on c."CategoryID"=p."CategoryID"
group by 1,2
order by 3 desc;
