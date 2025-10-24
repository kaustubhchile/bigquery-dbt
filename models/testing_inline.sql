{{
    config(
        materialized='table'
    )
}}
select * from {{source("bq_table_1","test_table")}}