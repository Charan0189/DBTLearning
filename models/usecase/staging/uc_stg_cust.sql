 
    select
        initcap(first_name) as first_name
        
    from {{ source('usecase1', 'customers') }}