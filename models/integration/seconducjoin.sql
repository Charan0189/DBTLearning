with customers as  (

    select * from {{ ref('stg_customers') }}

),



payment_orders as (

    select * from {{ ref('seconduclogic') }}

),



final as (



    select

        sum(payment_orders.amount) as Total_Loss

    
    from payment_orders

    left join customers using (customer_id)

)



select * from final