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
