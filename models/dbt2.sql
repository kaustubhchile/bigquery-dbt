select *
from (
  select *
  from {{ source("bq_table_1","customers") }}
  limit 10
)
