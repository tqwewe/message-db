IF current_setting('message_store.outbox', true) = 'on' THEN
  CREATE TABLE IF NOT EXISTS outbox (
    id UUID PRIMARY KEY REFERENCES messages,
    global_position bigint NOT NULL
  );
END IF;
