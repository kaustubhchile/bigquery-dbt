{% set list_of_columns=adapter.get_columns_in_relation(ref("customer")) %}
{% for i in list_of_columns -%}
{{i.column}}
{% endfor -%}