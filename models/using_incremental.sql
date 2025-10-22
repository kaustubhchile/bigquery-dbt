select * 
from {{ source("bq_table_1","sales") }} t1
{% if is_incremental() %}
where 
  t1.date > (select max(date) from {{ this }})
{% endif %}
