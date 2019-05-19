select * from orders 
where "OrderID" in (
	                  select min("OrderID") as min_
                    from orders
                    group by "EmployeeID"
                   )
                   
-- use 'any' predicate

select * 
from orders as o1
where not "OrderID" > any (
	                         select "OrderID" 
                           from orders as o2
						               where o1."EmployeeID"=o2."EmployeeID" 
                          )
                          
-- use 'all' predicate

select * 
from orders as o1
where "OrderID" <= all   (
	                         select "OrderID" 
                           from orders as o2
						               where o1."EmployeeID"=o2."EmployeeID" 
                          )
