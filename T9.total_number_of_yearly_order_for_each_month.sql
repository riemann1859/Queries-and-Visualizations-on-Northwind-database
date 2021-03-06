
with monthly_orders as (
	                select date_trunc('month', "OrderDate")::date as month_, count(*) as total_number_of_orders
                        from orders
                        group by 1
                        order by 1
	               )
			
select table1.month_ as starting_date, date(table1.month_ + interval '1 year') as ending_date,
      (select sum(table2.total_number_of_orders) as yearly_orders
	                   from monthly_orders as table2
	                   where table2.month_>=table1.month_ and 
					     	table2.month_<table1.month_+ interval '1 year')
       
from monthly_orders as table1
where table1.month_<= (select date_trunc('month', max("OrderDate"))- interval '1 year' from orders)
