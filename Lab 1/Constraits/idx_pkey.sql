-- Constraint: idx_pkey

-- ALTER TABLE idx DROP CONSTRAINT idx_pkey;

ALTER TABLE idx
  ADD CONSTRAINT idx_pkey PRIMARY KEY(ename);