-- SELECT reservations.*, properties.*, AVG(property_reviews.rating) AS average_rating
-- FROM users
--   JOIN reservations ON users.id = guest_id
--   JOIN properties ON properties.id = property_id
--   JOIN property_reviews ON reservations.id = reservation_id
-- WHERE users.id = 1
-- GROUP BY properties.id, reservations.id;

-- the suggested answers didn't touch the user table, which is better, one less join;
-- it also removed the fake records of future visit to a BNB.

SELECT reservations.*, properties.*, AVG(property_reviews.rating) AS average_rating
FROM reservations
  JOIN properties ON reservations.property_id = properties.id
  JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE reservations.guest_id = 1
  AND reservations.end_date < now()
::date
GROUP BY properties.id, reservations.id
-- 类似于EXCEL里面多表合并，每层都要group；
ORDER BY reservations.start_date
LIMIT 10;

-- SELECT properties.*, reservations.*, avg(rating) as average_rating
-- FROM reservations
--   JOIN properties ON reservations.property_id = properties.id
--   JOIN property_reviews ON properties.id = property_reviews.property_id
-- WHERE reservations.guest_id = 1
--   AND reservations.end_date < now()
-- ::date
-- GROUP BY properties.id, reservations.id
-- ORDER BY reservations.start_date
-- LIMIT 10;