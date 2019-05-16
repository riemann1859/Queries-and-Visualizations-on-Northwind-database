
select distinct "OrderDate" 
from orders
where "OrderDate" in (
					  select max("OrderDate")
	                  from orders
                      group by  extract(year from  "OrderDate"), extract(month from  "OrderDate")
                     )
order by 1
