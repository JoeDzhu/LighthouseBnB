DELETE FROM users;
DELETE FROM properties;
DELETE FROM reservations;
DELETE FROM property_reviews;

INSERT INTO users
  (id, name, email, password)
VALUES
  (1, 'Eva Stanley', 'sebastianguerra@yamail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  (2, 'Louisa Meyer', 'jacksonrose@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  (3, 'Dominic Parks', 'victoriablackwell@outlook.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  (4, 'Sue Luna', 'jasonvincent@gmx.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
  (5, 'Rosalie Garza', 'jacksondavid@gmx.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties
  (id, owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code)
--此处不specify default的field active， 或者干脆整个字段specify的section就压根儿不写--
VALUES
  (1, 1, 'Bat Cave', 'bla', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 93061, 6, 4, 8, 'CA', '111st', 'TO', 'ON', 'T5P3X2'),
  (2, 1, 'Fortress of Solitude', 'bla', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 93061, 6, 4, 8, 'CA', '112st', 'TO', 'ON', 'T5P3X2'),
  (3, 2, 'Stark Tower', 'bla', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 93061, 6, 4, 8, 'CA', '113st', 'TO', 'ON', 'T5P3X2'),
  (4, 4, 'Hell''s Kitchen', 'bla', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 93061, 6, 4, 8, 'CA', '114st', 'TO', 'ON', 'T5P3X2'),
  (5, 3, 'Sanssouci Palace', 'bla', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&amp;cs=tinysrgb&amp;h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 93061, 6, 4, 8, 'CA', '115st', 'TO', 'ON', 'T5P3X2');

INSERT INTO reservations
  (id, property_id, guest_id, start_date, end_date)
VALUES
  (1, 1, 2, '2018-09-11', '2018-09-26'),
  (2, 2, 3, '2019-01-04', '2019-02-01'),
  (3, 3, 4, '2021-10-01', '2021-10-14'),
  (4, 4, 5, '2014-10-21', '2014-10-21'),
  (5, 5, 1, '2016-07-17', '2016-08-01');

-- 如果插入前面表格users， properties里面没有的id，因为REFERENCES的缘故，会挂掉；

INSERT INTO property_reviews
  (id, guest_id, property_id, reservation_id, rating, message)
VALUES
  (1, 1, 2, 1, 10, 'Dah!'),
  (2, 2, 3, 2, 10, 'Dah!'),
  (3, 3, 4, 3, 10, 'Dah!'),
  (4, 4, 5, 4, 10, 'Dah!'),
  (5, 5, 1, 5, 10, 'Dah!');