CREATE TABLE IF NOT EXISTS message_store.messages (
  global_position bigserial NOT NULL,
  position bigint NOT NULL,
  time TIMESTAMP WITHOUT TIME ZONE DEFAULT (now() AT TIME ZONE 'utc') NOT NULL,
  stream_name text NOT NULL,
  type text NOT NULL,
  data jsonb,
  metadata jsonb,
  id UUID NOT NULL DEFAULT gen_random_uuid()
);

ALTER TABLE message_store.messages ADD PRIMARY KEY (global_position) NOT DEFERRABLE INITIALLY IMMEDIATE;

IF current_setting('message_store.outbox', true) = 'on' THEN
  CREATE TABLE IF NOT EXISTS outbox (
    id UUID PRIMARY KEY REFERENCES messages,
    global_position bigint NOT NULL
  );
END IF;
