CREATE TABLE memories (
  id INTEGER PRIMARY KEY NOT NULL,
  embedding TEXT NOT NULL
);

SELECT id, 1 - (embedding <=> ?::vector) AS sim FROM memories
WHERE (1 - (embedding <=> ?::vector)) >= 0.70
ORDER BY embedding <=> ?::vector;
