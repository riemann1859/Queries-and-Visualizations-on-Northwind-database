select "CustomerID"
from orders
where "EmployeeID" in
     (select "EmployeeID" from employees where "Country" = 'USA')
group by 1
having count(distinct "EmployeeID")=
     (select count(*) from employees where "Country" = 'USA')
