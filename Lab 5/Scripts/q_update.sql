﻿UPDATE idx SET sal=f_random_salary(10000, 1000), hiredate=f_random_date(1000), job=f_random_string(50) WHERE ename = (SELECT ename FROM idx OFFSET floor(random()*(SELECT count(1) FROM idx)) LIMIT 1) RETURNING *;