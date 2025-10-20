select *
from {{source("bq_table_2","customer")}}
where card="credit"