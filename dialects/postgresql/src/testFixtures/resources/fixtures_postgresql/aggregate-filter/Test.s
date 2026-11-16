CREATE TABLE memories (
  salience REAL NOT NULL
);

SELECT count(*) FILTER (WHERE salience >= 1.0) AS active FROM memories;
