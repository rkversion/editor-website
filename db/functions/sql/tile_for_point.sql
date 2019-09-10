-- This is no longer used  actively, it's referenced in the migrations however
CREATE OR REPLACE FUNCTION tile_for_point(integer, integer)
 RETURNS bigint AS $stubbed$
DECLARE
  stubbed bigint;
BEGIN
  RETURN 1;
END;
$stubbed$ LANGUAGE plpgsql;