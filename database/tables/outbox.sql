CREATE OR REPLACE FUNCTION create_outbox()
  RETURNS void
  LANGUAGE plpgsql AS
$func$
BEGIN
  IF current_setting('message_store.outbox', true) = 'on' THEN
    CREATE TABLE IF NOT EXISTS message_store.outbox (
      id UUID PRIMARY KEY REFERENCES message_store.messages,
      global_position bigint NOT NULL
    );
  END IF;
END
$func$;

SELECT create_outbox();

DROP FUNCTION IF EXISTS create_outbox();
