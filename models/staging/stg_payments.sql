select
    id as payment_id,
    orderid as order_id,
    trim(initcap(paymentmethod)) as payment_method,
    ROUND(amount, 2) as amount,
    created as created_at,
    initcap(status) as payment_status
    -- amount is stored in cents, convert it to dollars
 -- {{ cents_to_dollars('amount', 4) }} as amount,
   -- created as created_at

--from raw.stripe.payment 
from {{ source('stripe', 'payment') }}