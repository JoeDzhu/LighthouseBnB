DROP TABLE IF EXISTS users
CASCADE;
DROP TABLE IF EXISTS properties
CASCADE;
DROP TABLE IF EXISTS reservations
CASCADE;
DROP TABLE IF EXISTS property_reviews;

-- 在删除一个表时，如果该表的主键是另一个表的外键，如果不用cascade关键字就会报错

CREATE TABLE users
(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE properties
(
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  cover_photo_url VARCHAR,
  thumbnail_photo_url VARCHAR,
  cost_per_night INTEGER,
  parking_spaces INTEGER,
  number_of_bathrooms INTEGER,
  number_of_bedrooms INTEGER,
  active BOOLEAN,
  provence VARCHAR(255),
  city VARCHAR(255),
  country VARCHAR(255),
  street VARCHAR(255),
  post_code VARCHAR(255)
);

CREATE TABLE reservations
(
  id SERIAL PRIMARY KEY NOT NULL,
  guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  property_id INTEGER,
  start_date DATE,
  end_date DATE
);


CREATE TABLE property_reviews
(
  id SERIAL PRIMARY KEY NOT NULL,
  guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
  reservation_id INTEGER REFERENCES reservations(id) ON DELETE CASCADE,
  rating INTEGER,
  message TEXT
);