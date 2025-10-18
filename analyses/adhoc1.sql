select * from {{source("bq_table_1","customers")}}
where ID<10
order by ID