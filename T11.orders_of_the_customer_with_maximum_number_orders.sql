
with order_count as	  (
	                     select "CustomerID", count(*) as count_
                       from orders
                       group by 1
                       order by 2 desc
	                   )
select *
from orders
where "CustomerID"=(
	                select "CustomerID"
	                from order_count
	                where count_=(
								                select max(count_) 
	                              from order_count
	                              )
	                )
