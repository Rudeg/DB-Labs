WITH RECURSIVE t AS (
    SELECT f_random_salary(10000, 1000) as sal, f_random_date(1000) as hiredate, f_random_string(50) as job 
  UNION ALL
    SELECT f_random_salary(10000, 1000), f_random_date(1000), f_random_string(50) FROM t
)
UPDATE idx SET sal=s.sal, hiredate=s.hiredate, job=s.job FROM (SELECT * FROM t LIMIT (SELECT count(1) FROM idx)) AS s RETURNING *;