-- Function: f_fill_table(regclass)

-- DROP FUNCTION f_fill_table(regclass);

CREATE OR REPLACE FUNCTION f_fill_table(tbl regclass)
  RETURNS void AS
$BODY$
DECLARE
  t_ename text;
  m_sal money;
  d_hiredate date;
  t_job text;
  cmd text;
  ts_start timestamp;
  ts_end timestamp;
BEGIN
  EXECUTE format('TRUNCATE TABLE %s', tbl);

  ts_start := clock_timestamp();
  RAISE NOTICE 'Begin: %', ts_start;
  
  cmd := 'INSERT INTO ' || tbl::regclass;
  RAISE NOTICE '%', cmd;
  cmd := cmd || ' (ename, sal, hiredate, job) VALUES ($1,$2,$3,$4)';
  
  FOR i IN 1..1000000 LOOP
    t_ename := f_random_string(50);
    m_sal := f_random_salary(10000, 1000);
    d_hiredate := f_random_date(1000);
    t_job := f_random_string(50);

    EXECUTE cmd USING t_ename, m_sal, d_hiredate, t_job;
  END LOOP;

  ts_end := clock_timestamp();
  RAISE NOTICE 'End: %', ts_end;
  RAISE NOTICE 'Duration: %', ts_end - ts_start;
  
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION f_fill_table(regclass)
  OWNER TO fantastik;
