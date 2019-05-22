select *
from orders as o1
where o1."OrderDate"=(
					  select max("OrderDate")
                      from orders
                     )
