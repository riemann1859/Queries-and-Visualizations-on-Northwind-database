--in the output of this query, there may be more than one order corresponding to some employee 
select "OrderID", "CustomerID", "EmployeeID", "OrderDate", "RequiredDate"
from orders as o1
where "OrderDate"=(
                   select max("OrderDate")
                   from orders as o2
                   where o2."EmployeeID"=o1."EmployeeID"
                  )
                  
-- solution to above fault

select "OrderID", "CustomerID", "EmployeeID", "OrderDate", "RequiredDate"
from orders as o1
where "OrderDate"=(
                   select max("OrderDate")
                   from orders as o2
                   where o2."EmployeeID"=o1."EmployeeID"
                  )
	   and
	   "OrderID"=(
		          select max("OrderID")
		          from orders as o2
		          where o2."EmployeeID"=o1."EmployeeID" and o1."OrderDate"=o2."OrderDate"
	             )
order by 3
