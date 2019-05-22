select "CustomerID","CompanyName"
from customers
where "CustomerID" not in (
                           select "CustomerID"
                           from orders
                           where "OrderDate">= timestamp '1998-01-01'
                          )
