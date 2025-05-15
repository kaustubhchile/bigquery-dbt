{{ config(materialized='ephemeral') }}

select *
from {{ source("bq_table_2", "fruit") }}
where ripeness = 'Overripe'
