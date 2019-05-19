with number_of_customers_per_year as(
                                     select  extract(year from "OrderDate") as order_year, count(distinct "CustomerID") as count_
                                     from orders
                                     group by 1
                                    )

select current_.order_year as current_year, current_.count_ as number_of_customers_current_year,
        previous.count_ as number_of_customers_of_previous_year, current_.count_-previous.count_ as growth
from number_of_customers_per_year as current_
left join number_of_customers_per_year as previous
on current_.order_year-1=previous.order_year
