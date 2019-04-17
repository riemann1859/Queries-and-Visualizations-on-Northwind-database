select trim(concat(f."City",s."City")) as city, coalesce(f.number_of_customers,0) as number_of_customers, 
                                          coalesce(s.number_of_suppliers,0) as number_of_suppliers
from (
	     select "City", count(*) as number_of_customers
       from customers 
       group by 1) as f
full outer join (
	     select "City", count(*) as number_of_suppliers
       from suppliers 
       group by 1) as s
on f."City"=s."City"
order by f."City"
