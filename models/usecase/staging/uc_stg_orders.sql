    select
        order_date,
        trim(initcap(status)) as Status

    from {{source('usecase1', 'orders')}}
