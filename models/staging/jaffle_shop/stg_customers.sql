 
    select
        id as customer_id,
        trim(initcap(first_name)),
        last_name

    from {{ source('jaffle_shop', 'customers') }}