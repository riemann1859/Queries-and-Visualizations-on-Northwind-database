select "Country", count(*) as numcities
from (
      select   "Country","City" from customers
      union
      select   "Country","City" from employees
     ) as sub
group by 1
order by 1
