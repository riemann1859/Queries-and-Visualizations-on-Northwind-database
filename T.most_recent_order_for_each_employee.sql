select "OrderID", "CustomerID", "EmployeeID", "OrderDate", "RequiredDate"
from orders as o1
where "OrderDate"=(
                   select max("OrderDate")
                   from orders as o2
                   where o2."EmployeeID"=o1."EmployeeID"
                  )
