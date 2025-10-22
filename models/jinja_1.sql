-- Variables
{%- set name='Kaustubh' %}
{{name}}

-- IF Condition
{%- if 1==1 %}
    {{" Inside the first block "}}
{% else %}
    {{" Inside the second block "}}
{% endif %}

-- FOR Loop
{% for i in range(1,11) -%}
{{i}}
{%- endfor %}

-- Using get_column_values
{% set fruits = dbt_utils.get_column_values(ref('fruit'),"fruit_name") %}
{% for fruit in fruits -%}
    {{fruit}}
{%endfor%}

-- To get column values
{% set olympic_columns=adapter.get_columns_in_relation(ref("olympics")) %}
{%- for column in olympic_columns -%}
    {{column.column}}
{% endfor %}

-- Real life use case of get_column_values
{% set payment_mode=dbt_utils.get_column_values(source('bq_table_1','Payments'),'Payment_Mode') %}
select Order_ID,
{% for type in payment_mode %}
    sum(case when Payment_Mode='{{type}}' then Sales end) as {{type}}_Mode,
{% endfor %}
from {{source('bq_table_1','Payments')}}
group by Order_ID
order by Order_ID

-- Using loop.last
{% set payment_mode=dbt_utils.get_column_values(source('bq_table_1','Payments'),'Payment_Mode') -%}
select Order_ID,
{% for type in payment_mode -%}
    sum(case when Payment_Mode='{{type}}' then Sales end) as {{type}}_Mode
    {%- if not loop.last %},{% endif %}
{% endfor -%}
from {{source('bq_table_1','Payments')}}
group by Order_ID
order by Order_ID

-- Using loop.first
{% set payment_mode=dbt_utils.get_column_values(source('bq_table_1','Payments'),'Payment_Mode') -%}
select Order_ID,
{% for type in payment_mode -%}
    {% if not loop.first -%},{% endif %}sum(case when Payment_Mode='{{type}}' then Sales end) as {{type}}_Mode
{% endfor -%}
from {{source('bq_table_1','Payments')}}
group by Order_ID
order by Order_ID

{# Using lower on iterator #}
{% set payment_mode=dbt_utils.get_column_values(source('bq_table_1','Payments'),'Payment_Mode') -%}
select Order_ID,
{% for type in payment_mode -%}
    {% if not loop.first -%},{% endif %}sum(case when Payment_Mode='{{type}}' then Sales end) as {{type | lower}}_Mode
{% endfor -%}
from {{source('bq_table_1','Payments')}}
group by Order_ID
order by Order_ID

{# Using index #}

{# Using loop.index #}
{% set payment_mode=dbt_utils.get_column_values(source('bq_table_1','Payments'),'Payment_Mode') -%}
select Order_ID,
{% for type in payment_mode -%}
    {% if loop.index>1 -%},{% endif %}sum(case when Payment_Mode='{{type}}' then Sales end) as {{type | lower}}_Mode
{% endfor -%}
from {{source('bq_table_1','Payments')}}
group by Order_ID
order by Order_ID

{# Using loop.length #}
{% set payment_mode=dbt_utils.get_column_values(source('bq_table_1','Payments'),'Payment_Mode') -%}
select Order_ID,
{% for type in payment_mode -%}
    sum(case when Payment_Mode='{{type}}' then Sales end) as {{type | lower}}_Mode
    {%- if loop.index!=loop.length %},{% endif %}
{% endfor -%}
from {{source('bq_table_1','Payments')}}
group by Order_ID
order by Order_ID