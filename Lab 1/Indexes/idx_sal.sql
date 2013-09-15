-- Index: idx_sal

-- DROP INDEX idx_sal;

CREATE INDEX idx_sal
  ON idx
  USING btree
  (sal);
