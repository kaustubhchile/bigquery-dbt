SELECT * FROM {{ ref("fruit") }}
WHERE ripeness = 'Ripe'