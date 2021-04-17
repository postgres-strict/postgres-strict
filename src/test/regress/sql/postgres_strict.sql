SET postgres_strict.disable = 'none';

--
-- require_column_as
--

SELECT 1 AS a;
SELECT 1 a;
SELECT 1a;

DO $$
DECLARE
_r record;
BEGIN
SELECT 1 a INTO _r;
END $$;

DO $$
BEGIN
RAISE NOTICE '%', 1 a;
END $$;

--
-- randomize_values_order
--
-- It's hard to ensure that the values are in a random order, so we just
-- execute a couple of queries and make sure the backend doesn't crash or throw
-- any weird errors.
--

SELECT count(*) FROM (VALUES (1)) ss(a);
SELECT count(*) FROM (VALUES (1),(2)) ss(a);
SELECT count(*) FROM (VALUES (1),(2),(3)) ss(a);
SELECT count(*) FROM (VALUES (text 'foo'), ('bar'), ('baz')) ss(a);

SELECT ss.a FROM (VALUES (1),(2),(3)) ss(a) ORDER BY ss.a;
SELECT ss.a FROM (VALUES (text 'foo'), ('bar'), ('baz')) ss(a) ORDER BY ss.a;

-- Test rescan
SET enable_material TO FALSE;
SELECT ss.a, ss2.a FROM (VALUES (1), (2), (3)) ss(a) CROSS JOIN (VALUES (4), (5), (6)) ss2(a) ORDER BY ss.a, ss2.a;
SELECT ss.a, ss2.a FROM (VALUES (text 'foo'), ('bar'), ('baz')) ss(a) CROSS JOIN (VALUES (text 'foo'), ('bar'), ('baz')) ss2(a) ORDER BY ss.a, ss2.a;
RESET enable_material;

--
-- no_implicit_time_zone
--
SELECT '2001-02-03'::date::timestamptz;
SELECT '2001-02-03 04:05:06'::timestamp::timestamptz;
SELECT '2001-02-03 04:05:06+07'::timestamptz::date;
SELECT '2001-02-03 04:05:06+07'::timestamptz::time;
SELECT '2001-02-03 04:05:06+07'::timestamptz::timestamp;

SELECT date_part('hour', '2001-02-03 04:05:06+07'::timestamptz);
SELECT extract(HOUR FROM '2001-02-03 04:05:06+07'::timestamptz);
SELECT date_trunc('hour', '2001-02-03 04:05:06+07'::timestamptz);

SELECT make_timestamptz(2001, 02, 03, 04, 05, 06);

SELECT now() = CURRENT_DATE;
SELECT now() = LOCALTIMESTAMP;

SELECT date_trunc('day', '2001-02-03 04:05:06+07'::timestamptz AT TIME ZONE 'Asia/Bangkok');
SELECT make_timestamptz(2001, 02, 03, 04, 05, 06, 'Asia/Bangkok');
SELECT '2001-02-03 04:05:06+07'::timestamptz = '2001-02-03 04:05:06'::timestamp AT TIME ZONE 'Asia/Bangkok';
SELECT ('2001-02-03 04:05:06+07'::timestamptz AT TIME ZONE 'Asia/Bangkok')::date = '2001-02-03'::date;
