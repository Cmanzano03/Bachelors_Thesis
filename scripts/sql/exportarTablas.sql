USE 2024_avuex;

-- Exportar alumnos_ip_cmi
SELECT 'userid'
UNION ALL
SELECT userid FROM alumnos_ip_cmi
INTO OUTFILE '/var/lib/mysql-files/alumnos_ip_cmi.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Exportar assign_cmi
SELECT 'id','course','duedate','allowsubmissionsfromdate','timemodified','name'
UNION ALL
SELECT id, course, duedate, allowsubmissionsfromdate, timemodified, name FROM assign_cmi
INTO OUTFILE '/var/lib/mysql-files/assign_cmi.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Exportar assign_grades_cmi
SELECT 'assignment','userid','grade','timemodified'
UNION ALL
SELECT assignment, userid, grade, timemodified FROM assign_grades_cmi
INTO OUTFILE '/var/lib/mysql-files/assign_grades_cmi.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Exportar assign_submission_cmi
SELECT 'assignment','userid','status','timemodified'
UNION ALL
SELECT assignment, userid, status, timemodified FROM assign_submission_cmi
INTO OUTFILE '/var/lib/mysql-files/assign_submission_cmi.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Exportar course_modules_cmi
SELECT 'id','course','module','instance','visible','added'
UNION ALL
SELECT id, course, module, instance, visible, added FROM course_modules_cmi
INTO OUTFILE '/var/lib/mysql-files/course_modules_cmi.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Exportar forum_cmi
SELECT 'id','course','name','type','timemodified'
UNION ALL
SELECT id, course, name, type, timemodified FROM forum_cmi
INTO OUTFILE '/var/lib/mysql-files/forum_cmi.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Exportar forum_discussions_cmi
SELECT 'id','forum','userid','timemodified','timestart'
UNION ALL
SELECT id, forum, userid, timemodified, timestart FROM forum_discussions_cmi
INTO OUTFILE '/var/lib/mysql-files/forum_discussions_cmi.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Exportar forum_posts_cmi
SELECT 'id','discussion','userid','created'
UNION ALL
SELECT id, discussion, userid, created FROM forum_posts_cmi
INTO OUTFILE '/var/lib/mysql-files/forum_posts_cmi.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Exportar log_ip_cmi
SELECT 'userid','courseid','timecreated','eventname','component','action','contextinstanceid'
UNION ALL
SELECT userid, courseid, timecreated, eventname, component, action, contextinstanceid FROM log_ip_cmi
INTO OUTFILE '/var/lib/mysql-files/log_ip_cmi.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Exportar modules_cmi
SELECT 'id','name'
UNION ALL
SELECT id, name FROM modules_cmi
INTO OUTFILE '/var/lib/mysql-files/modules_cmi.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Exportar quiz_attempts_cmi
SELECT 'quiz','userid','state','attempt','sumgrades','timestart','timefinish'
UNION ALL
SELECT quiz, userid, state, attempt, sumgrades, timestart, timefinish FROM quiz_attempts_cmi
INTO OUTFILE '/var/lib/mysql-files/quiz_attempts_cmi.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

-- Exportar quiz_cmi
SELECT 'id','course','timeopen','timeclose','name','timemodified'
UNION ALL
SELECT id, course, timeopen, timeclose, name, timemodified FROM quiz_cmi
INTO OUTFILE '/var/lib/mysql-files/quiz_cmi.csv'
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';