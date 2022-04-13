with orders as  (

    select * from {{ ref('stg_orders' )}}

),



payments as (

    select * from {{ ref('stg_payments') }}

),



order_payments as (

    select

        order_id,

        payment_method,

        sum(amount) as amount,

        created_at



    from payments

    group by 1,2,4

    

),



final as (



    select

        orders.order_id,

        orders.customer_id,

        orders.status,

        order_payments.payment_method,

        order_payments.amount,

        order_payments.created_at



    from orders

    left join order_payments using (order_id)

    
   

    where 
    payment_method = '{{ var("payment_method") }}'
    and status = '{{ var("status") }}'

    and amount > {{ var("amount") }} 
    and created_at >= '{{ var("created") }}'

 order by 2
)



select * from final