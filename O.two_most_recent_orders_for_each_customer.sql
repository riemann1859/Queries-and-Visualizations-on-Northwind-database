select *
from (
	    select o."CustomerID" , c."CompanyName", o."OrderDate",row_number()over(partition by o."CustomerID" order by o."OrderDate" desc) as rank_
      from orders as o
	    join customers as c
	    on c."CustomerID"=o."CustomerID"
     ) as sub
where sub.rank_<=2;
