select sqq."CustomerID", sqq."CompanyName", sum(sqq.seafood),sum(sqq.dairy)
from (
	   select sq."CustomerID",sq."CompanyName", sq."CategoryName", sq.count_,
          case when sq.count_>0 and sq."CategoryName"='Seafood' then 1
	             else 0 end as seafood,
	        case when sq.count_>0 and sq."CategoryName"='Dairy Products' then 1
	             else 0 end as dairy
      from (
	          select o."CustomerID", c."CompanyName", ca."CategoryName", count(*) as count_
            from orders  as o
            join order_details as od
            on o."OrderID"=od."OrderID"
            join customers as c
            on c."CustomerID"=o."CustomerID"
            join products as p
            on od."ProductID"=p."ProductID"
            join categories as ca
            on p."CategoryID"=ca."CategoryID"
            group by 1,2,3
            order by 2,3
           ) as sq
	   ) as sqq
group by 1,2
having sum(sqq.seafood)>0 and sum(sqq.dairy)=0;
