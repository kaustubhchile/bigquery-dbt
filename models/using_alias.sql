{{
    config(
        alias='Payments_Credit'
    )
}}
select * from {{source("bq_table_1","Payments")}}
where Payment_Mode='Credit'