select c."CustomerID", c."CompanyName", c."City",
       case 
	         when count(o."OrderID")=0 then 'no orders'
		       when count(o."OrderID")<=7 then 'up to seven orders'
		       else 'more than seven orders'
	     end as customer_categories
from customers as c
left outer join orders as o
on c."CustomerID"=o."CustomerID"
group by 1,2,3
order by 4
