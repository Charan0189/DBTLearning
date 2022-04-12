select
    trim(initcap(paymentmethod)) as payment_method, ROUND(amount, 2) as amt
from {{ source('usecase2', 'payment') }}