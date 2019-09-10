-- from https://github.com/openstreetmap/osmosis/blob/master/package/script/contrib/apidb_0.6_osmosis_xid_indexing.sql
-- Public Domain https://github.com/openstreetmap/osmosis/blob/master/package/copying.txt

-- This script creates a function and indexes that allow osmosis to efficiently query based on transaction ids.
CREATE OR REPLACE FUNCTION xid_to_int4(t xid)
  RETURNS integer AS
$BODY$
	DECLARE
		tl bigint;
		ti int;
        BEGIN
		tl := t;

		IF tl >= 2147483648 THEN
			tl := tl - 4294967296;
		END IF;
		
		ti := tl;
		
                RETURN ti;
        END;
$BODY$
LANGUAGE 'plpgsql' IMMUTABLE STRICT;