select * from {{source("bq_table_1","Users")}}
where ID<10
order by ID