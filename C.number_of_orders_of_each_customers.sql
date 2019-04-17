select c."CustomerID", count(o."OrderID") as number_of_orders
from customers as c
left join orders as o
on c."CustomerID"=o."CustomerID"
group by 1;
