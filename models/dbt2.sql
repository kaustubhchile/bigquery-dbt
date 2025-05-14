select *
from {{source("bq_table_1","Users")}}
limit 10