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

        payment_status,

        sum(amount) as amount


    from payments

    group by 1,2,3
    

),



final as (



    select

        orders.customer_id,
          
        orders.order_id,

        order_payments.payment_status,

        orders.order_status,

        order_payments.payment_method,

        order_payments.amount,

        orders.order_date

    from orders

    left join order_payments using (order_id)
  

    where 

    order_status = '{{ var("status2") }}'


    order by 1

 
)



select * from final