select sub."Country", round(sub.total_expenditure::numeric,2) as total_expenditure
from (
	    select c."Country", sum(od."UnitPrice"*od."Quantity"*(1-od."Discount")) as total_expenditure 
      from orders as o
      join customers as c
      on o."CustomerID"=c."CustomerID"
      join order_details as od
      on od."OrderID"=o."OrderID"
      group by 1
      order by 2 desc	
	 ) as sub														
