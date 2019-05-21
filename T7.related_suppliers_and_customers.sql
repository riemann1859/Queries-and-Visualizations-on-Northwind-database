
--returns all pairs of customer company name and supplier company name, where  the supplier supplied products to the customer

select distinct c."CompanyName",s."CompanyName"
from customers as c
left join orders as o1
on c."CustomerID"=o1."CustomerID"
join order_details as o2
on o1."OrderID"=o2."OrderID"
join products as p
on p."ProductID"=o2."ProductID"
join suppliers as s
on p."SupplierID"=s."SupplierID" 
order by 1,2
