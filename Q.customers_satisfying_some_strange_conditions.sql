select "CustomerID"
from orders
where "EmployeeID" in (1,2,3,4,8)
--1,2,3,4,8 are employeeID of employees from USA in employee table 
group by 1
having count(distinct "EmployeeID")=5
