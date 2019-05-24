select *
from  (
       select p."SupplierID", s."CompanyName", p."ProductName",p."UnitPrice",
          rank() over(partition by p."SupplierID" order by p."UnitPrice" desc) as rank_
       from products as p
       join suppliers as s
       on s."SupplierID"=p."SupplierID"
       where p."CategoryID"=(
                             select "CategoryID"
                             from categories
                             where "CategoryName"='Dairy Products'
                             )
       ) as sub
where sub.rank_<=2
					 
