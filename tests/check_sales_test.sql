select *
from {{ref("marketing_stg")}}
where cost>5000