{% snapshot scd_table_check %}
{{
    config(
        schema='snapshots',
        strategy='check',
        unique_key='ID',
        check_cols=['First_Name','Last_Name']
    )
}}
select * from {{source("bq_table_1","new_customers")}}
{% endsnapshot %}