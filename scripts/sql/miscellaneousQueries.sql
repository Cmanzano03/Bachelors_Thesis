CREATE TEMPORARY TABLE tareas_ip  AS
SELECT id, duedate, name
FROM mdl_assign
WHERE course = 8683;


SELECT id
FROM tareas_ip
WHERE duedate BETWEEN UNIX_TIMESTAMP('2023-9-01 00:00:00') 
                 AND UNIX_TIMESTAMP('2024-1-30 23:59:59');



SELECT sub.assignment, tar.name , FROM_UNIXTIME(duedate)
FROM mdl_assign_submission AS sub
JOIN tareas_ip AS tar ON sub.assignment = tar.id
WHERE tar.duedate BETWEEN UNIX_TIMESTAMP('2023-09-01 00:00:00') 
                     AND UNIX_TIMESTAMP('2024-01-30 23:59:59')
GROUP BY tar.id, tar.name, FROM_UNIXTIME(duedate);


-- Get attempts that have at least one submission associated, and obtain the number of registered submissions for each quiz
SELECT quiz.id, quiz.name, COUNT(*) AS total_intentos
FROM quizes_ip AS quiz
INNER JOIN mdl_quiz_attempts AS at ON quiz.id = at.quiz 
GROUP BY quiz.id, quiz.name;

-- Get attempts that have at least one submission associated, and obtain the number of registered submissions for each quiz,
-- but joining with the table containing the IDs of students enrolled in that course.
SELECT quiz.id, quiz.name, COUNT(*) AS total_intentos
FROM quizes_ip AS quiz
INNER JOIN mdl_quiz_attempts AS at ON quiz.id = at.quiz INNER JOIN alumnos_ip_cmi AS al ON al.userid = at.userid
GROUP BY quiz.id, quiz.name;


-- Previous query, but filtering to consider only those attempts made within the time interval during which the course lasted

      SELECT quiz.id, quiz.name, COUNT(*) AS total_intentos
      FROM quizes_ip AS quiz
      INNER JOIN mdl_quiz_attempts AS at ON quiz.id = at.quiz INNER JOIN alumnos_ip_cmi AS al ON al.userid = at.userid
      WHERE at.timemodified BETWEEN UNIX_TIMESTAMP('2023-09-01 00:00:00') 
                                    AND UNIX_TIMESTAMP('2024-01-30 23:59:59')
      GROUP BY quiz.id, quiz.name;

SELECT id, name, timecreated, timeopen, timeclose, attempts 
FROM mdl_quiz 
WHERE course = 8683