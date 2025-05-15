select *, {{bmi('Weight','Height')}} as BMI 
from {{ref("olympics")}}
