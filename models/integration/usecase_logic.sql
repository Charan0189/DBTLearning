with customers as  (

    select * from {{ ref('stg_customers') }}

),



payment_orders as (

    select * from {{ ref('usecase_join') }}

),



final as (



    select

        payment_orders.customer_id,

        customers.first_name

    

    from payment_orders

    left join customers using (customer_id)

)



select * from final