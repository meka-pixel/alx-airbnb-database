-- ============================================
-- 1) INNER JOIN: all bookings with the users who made them
-- Shows only rows where user_id matches in both tables.
-- Works in PostgreSQL and SQLite.
SELECT
  b.booking_id,
  b.property_id,
  b.start_date,
  b.end_date,
  u.user_id,
  u.name AS user_name,
  u.email
FROM bookings AS b
INNER JOIN users AS u
  ON u.user_id = b.user_id;


-- ============================================
-- 2) LEFT JOIN: all properties and their reviews,
-- including properties that have no reviews (reviews.* will be NULL).
-- Works in PostgreSQL and SQLite.
SELECT
  p.property_id,
  p.title,
  r.review_id,
  r.rating,
  r.comment,
  r.created_at
FROM properties AS p
LEFT JOIN reviews AS r
  ON r.property_id = p.property_id
ORDER BY p.property_id, r.created_at;


-- ============================================
-- 3) FULL OUTER JOIN: all users and all bookings,
-- even when there is no match between them.
--
-- OPTION A: PostgreSQL (native FULL OUTER JOIN)
-- Uncomment for PostgreSQL and comment out the SQLite emulation below.
SELECT
  u.user_id,
  u.name AS user_name,
  b.booking_id,
  b.property_id,
  b.start_date
FROM users AS u
FULL OUTER JOIN bookings AS b
  ON b.user_id = u.user_id
ORDER BY COALESCE(u.user_id, -1), COALESCE(b.booking_id, -1);


-- ============================================
-- OPTION B: SQLite emulation of FULL OUTER JOIN using UNION ALL
-- Use this if your DB is SQLite (SQLite does NOT support FULL OUTER JOIN).
-- Comment out the PostgreSQL block above when you use this.
-- SELECT
--   u.user_id,
--   u.name AS user_name,
--   b.booking_id,
--   b.property_id,
--   b.start_date
-- FROM users AS u
-- LEFT JOIN bookings AS b
--   ON b.user_id = u.user_id
--
-- UNION ALL
--
-- SELECT
--   u2.user_id,
--   u2.name AS user_name,
--   b2.booking_id,
--   b2.property_id,
--   b2.start_date
-- FROM bookings AS b2
-- LEFT JOIN users AS u2
--   ON u2.user_id = b2.user_id
-- WHERE u2.user_id IS NULL
-- ORDER BY COALESCE(user_id, -1), COALESCE(booking_id, -1);
