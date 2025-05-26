SELECT user.userid, task.id, task.name, grades.grade
FROM alumnos_ip_cmi AS user 
JOIN assign_grades_cmi AS grades ON user.userid = grades.userid 
JOIN assign_cmi AS task ON grades.assignment = task.id 
WHERE course=8683
ORDER BY task.id
LIMIT 50;   