{% macro bmi(wt_col, ht_col) %}
    round((CAST({{ wt_col }} AS FLOAT64) / (CAST({{ ht_col }} AS FLOAT64) * CAST({{ ht_col }} AS FLOAT64))) * 10000, 2)
{% endmacro %}
