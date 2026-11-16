CREATE TABLE memories (
  id INTEGER PRIMARY KEY NOT NULL,
  session_id TEXT,
  created_at TIMESTAMPTZ NOT NULL
);

SELECT id, lag(id) OVER w AS prev_id
FROM memories
WHERE session_id IS NOT NULL
WINDOW w AS (PARTITION BY session_id ORDER BY created_at, id);
