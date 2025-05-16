{% set countries = dbt_utils.get_column_values(table=ref('customer'), column='country') %}
{% for country in countries -%}
{{country}}
{% endfor %}
