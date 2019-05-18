select "CustomerID"
from orders
where "EmployeeID" in
     (select "EmployeeID" from employees where "Country" = 'USA')
group by 1
having count(distinct "EmployeeID")=
     (select count(*) from employees where "Country" = 'USA')
     
--Different approach

select * from customers as c
where not exists (
                  select * from employees as e
	              where "Country"='USA' and
	                    not exists (
						            select * from orders as o
							        where o."CustomerID"=c."CustomerID" 
							          and o."EmployeeID"=e."EmployeeID"
							       )
                 )

-- Notice that the second approach gives you access to all the customer attributes, while the first one gives you access only to 
-- the CustomerID. To access other customer attributes, you need to add a join between the result set and the Customers table. 
