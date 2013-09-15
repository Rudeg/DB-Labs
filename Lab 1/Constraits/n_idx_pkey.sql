-- Constraint: n_idx_pkey

-- ALTER TABLE n_idx DROP CONSTRAINT n_idx_pkey;

ALTER TABLE n_idx
  ADD CONSTRAINT n_idx_pkey PRIMARY KEY(ename);
