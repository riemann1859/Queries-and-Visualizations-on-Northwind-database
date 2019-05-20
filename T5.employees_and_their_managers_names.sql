--self-join example

select concat(e1."FirstName", ' ', e1."LastName") as employee_name,concat(e2."FirstName",' ', e2."LastName") as manager_name
from employees as e1
left join employees as e2
on e1."ReportsTo"=e2."EmployeeID"
