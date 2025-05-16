select *,
'{{invocation_id}}' as Invocation_id
from {{source("bq_table_2","dbt2")}}