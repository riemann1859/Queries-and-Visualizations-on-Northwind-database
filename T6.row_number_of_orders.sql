--calculate row number of each order based on increasing OrderID

select o1."OrderID", o1."CustomerID", o1."EmployeeID", count(*) as row_number_ 
from orders as o1
cross join orders as o2
where o2."OrderID"<=o1."OrderID"
group by 1,2,3
