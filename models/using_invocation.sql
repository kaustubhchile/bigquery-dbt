select 
'{{invocation_id}}' as run_id,
'{{run_started_at}}' as run_start_id,*
from {{source("bq_table_1","customers")}}
where ID<11
order by ID