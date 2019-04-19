select p."ProductName", p."UnitPrice", c."CategoryName", p."SupplierID", s."CompanyName" as supplier_name
from products as p
join categories as c
on p."CategoryID"=c."CategoryID"
join suppliers as s
on s."SupplierID"=p."SupplierID"
order by p."UnitPrice" desc
limit 10
