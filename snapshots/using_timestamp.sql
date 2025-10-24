{% snapshot scd_table_timestamp %}
{{
    config(
        schema='snapshots',
        strategy='timestamp',
        unique_key='ID',
        updated_at='Updated_at'
    )
}}
select * from {{source("bq_table_1","new_customers_timestamp")}}
{% endsnapshot %}