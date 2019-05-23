--Write a query that returns for each customer all orders placed on the customer’s last day of activity.

with customers_and_their_last_days_of_activity as (
                                                   select "CustomerID", max("OrderDate") as last_day
                                                   from orders
                                                   group by 1
                                                  )

select *
from orders as o 
join customers_and_their_last_days_of_activity as c
on c."CustomerID"=o."CustomerID" and c.last_day=o."OrderDate"
