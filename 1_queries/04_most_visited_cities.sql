SELECT properties. city AS city,
  COUNT(reservations) AS total_reservations
FROM properties
  JOIN reservations ON properties.id = property_id
GROUP BY properties.city
ORDER BY total_reservations DESC;
-- IF JOIN unnecessary tables,会出现重复计算错误，尽量用最直接的links of tables，奥卡姆剃刀；