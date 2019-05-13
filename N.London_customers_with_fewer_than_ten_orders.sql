select c."CustomerID", count(o."OrderID") as total_order
from customers as c
left join orders as o
on c."CustomerID"=o."CustomerID"
where c."City"='London'
group by 1
having count(o."OrderID")<10
order by 2 desc
 
