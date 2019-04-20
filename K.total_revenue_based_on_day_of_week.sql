select 
    case 
       when extract(dow from o."OrderDate")=0 then 'Sunday'
       when extract(dow from o."OrderDate")=1 then 'Monday'
		   when extract(dow from o."OrderDate")=2 then 'Tuesday'
		   when extract(dow from o."OrderDate")=3 then 'Wednesday'
		   when extract(dow from o."OrderDate")=4 then 'Thursday'
		   when extract(dow from o."OrderDate")=5 then 'Friday'
		   else 'Saturday'
	  end as day_of_week,
	  sum(od."UnitPrice"*od."Quantity"*(1-od."Discount")) as total_revenue 
from orders as o
join order_details as od
on o."OrderID"=od."OrderID"
group by 1
order by 2 desc;
