
select distinct c."Country"
from customers as c
where c."Country" not in (
                          select e."Country"
                          from employees  as e
                          )
order by 1

--solution with exists predicate

select distinct c."Country"
from customers as c
where not exists (
                          select e."Country"
                          from employees  as e
	                  where e."Country"=c."Country"
                  )
order by 1


