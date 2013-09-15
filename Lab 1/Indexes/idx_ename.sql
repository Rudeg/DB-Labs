-- Index: idx_ename

-- DROP INDEX idx_ename;

CREATE INDEX idx_ename
  ON idx
  USING btree
  (ename COLLATE pg_catalog."default");
