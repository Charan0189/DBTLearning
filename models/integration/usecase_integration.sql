select c.FIRST_NAME, O.ORDER_DATE, O.STATUS, p.PAYMENTMETHOD, p.AMOUNT
from 
{{ source('usecase1', 'customers') }} c left join {{source('usecase1', 'orders')}} o on c.ID = o.ID
left join {{ source('usecase2', 'payment') }} p on c.ID = p.ID
where o.STATUS = 'completed' and p.PAYMENTMETHOD = 'bank_transfer' and p.AMOUNT > 1200 and o.ORDER_DATE >= '2018-01-20'