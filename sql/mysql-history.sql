SELECT * FROM users;
;
;
;
;
;
;
;
;
;
;
;
;
;
       select unit_euid from activities_units where activity_euid in (
              select activity_euid from activities_tasks where task_euid in(
                     select task_euid from tasks_questions where question_euid = '9110000000009500001'
              )
       )
;
c
;
\q;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
SHOW TABLES;
SHOW TABLES;
;
;
;
;
;
;
;
;
;
;
SELECT * FROM users;
;
use nc
\q
