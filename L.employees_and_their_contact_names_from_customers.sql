select o."EmployeeID", CONCAT(e."FirstName",' ', e."LastName") AS name_of_employee,c."CompanyName",c."ContactName",
       count(*) as number_of_count
from orders as o
join customers as c
on o."CustomerID"=c."CustomerID"
join employees as e
on e."EmployeeID"=o."EmployeeID"
group by 1,2,3,4
order by 1,2,5 desc,3,4
