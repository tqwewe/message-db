CREATE OR REPLACE FUNCTION message_store.message_store_version()
RETURNS varchar
AS $$
BEGIN
  RETURN '1.2.2';
END;
$$ LANGUAGE plpgsql
VOLATILE;
