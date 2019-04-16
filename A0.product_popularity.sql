select  pr."ProductID", pr."ProductName", sum(o."Quantity") as sum_
from order_details as o
join products as pr
on pr."ProductID"=o."ProductID"
group by pr."ProductID"
order by sum_ desc;
