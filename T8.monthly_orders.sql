--Total number of orders for each month

select date_trunc('month', "OrderDate") as month_, count(*) as total_number_of_orders
from orders
group by 1
order by 1
