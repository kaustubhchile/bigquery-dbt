select *
from {{ref('customer')}}
where card="credit"