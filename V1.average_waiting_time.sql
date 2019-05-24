with vvv as (
	         select "EmployeeID", "OrderDate", row_number() over(partition by "EmployeeID" order by "OrderDate")
             from orders
             ),
	 vvvv as (    
		          select n."EmployeeID", n."OrderDate", m."OrderDate",
		            n."OrderDate"- m."OrderDate" as number_of_days_between_two_consecutive_orders
              from vvv as n
              join vvv as m
              on n."EmployeeID"=m."EmployeeID" and n.row_number-1=m.row_number
              )
select "EmployeeID", AVG(number_of_days_between_two_consecutive_orders) as avg_waiting_time
from vvvv
group by 1
order by 2 desc;
