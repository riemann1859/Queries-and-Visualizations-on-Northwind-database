select *
from (
      select "ProductID","ProductName","CategoryID","UnitPrice",
      rank()over(partition by "CategoryID" order by "UnitPrice" desc) as rank_
      from products
	   ) as r
where r.rank_ =1 or r.rank_=2 or r.rank_=3;
