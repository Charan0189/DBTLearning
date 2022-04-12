 
    select
        initcaps(first_name)
        
    from {{ source('usecase1', 'customers') }}