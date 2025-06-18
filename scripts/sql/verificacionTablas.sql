
USE 2024_avuex;
-- Mostrar nombre de las tablas, número de columnas y filas estimadas
SELECT 
    t.table_name AS Tabla,
    COUNT(c.column_name) AS Columnas,
    t.table_rows AS Filas
FROM 
    information_schema.tables t
JOIN 
    information_schema.columns c ON t.table_schema = c.table_schema AND t.table_name = c.table_name
WHERE 
    t.table_schema = DATABASE()
    AND t.table_name LIKE '%\_cmi' ESCAPE '\\'
GROUP BY 
    t.table_name, t.table_rows
ORDER BY 
    t.table_name;

-- Verificación de contenido (2 filas por tabla), con nombre de tabla mostrado explícitamente

SELECT 'alumnos_filtrados_cmi' AS Tabla;
SELECT * FROM alumnos_filtrados_cmi LIMIT 2;

SELECT 'alumnos_ip_cmi' AS Tabla;
SELECT * FROM alumnos_ip_cmi LIMIT 2;

SELECT 'assign_cmi' AS Tabla;
SELECT * FROM assign_cmi LIMIT 2;

SELECT 'assign_submission_cmi' AS Tabla;
SELECT * FROM assign_submission_cmi LIMIT 2;

SELECT 'assign_grades_cmi' AS Tabla;
SELECT * FROM assign_grades_cmi LIMIT 2;

SELECT 'quiz_cmi' AS Tabla;
SELECT * FROM quiz_cmi LIMIT 2;

SELECT 'quiz_attempts_cmi' AS Tabla;
SELECT * FROM quiz_attempts_cmi LIMIT 2;

SELECT 'forum_cmi' AS Tabla;
SELECT * FROM forum_cmi LIMIT 2;

SELECT 'forum_discussions_cmi' AS Tabla;
SELECT * FROM forum_discussions_cmi LIMIT 2;

SELECT 'forum_posts_cmi' AS Tabla;
SELECT * FROM forum_posts_cmi LIMIT 2;

SELECT 'course_modules_cmi' AS Tabla;
SELECT * FROM course_modules_cmi LIMIT 2;

SELECT 'modules_cmi' AS Tabla;
SELECT * FROM modules_cmi LIMIT 2;

SELECT 'cursos_filtrados_cmi' AS Tabla;
SELECT * FROM cursos_filtrados_cmi LIMIT 2;

SELECT 'log_filtrado_cmi' AS Tabla;
SELECT * FROM log_filtrado_cmi LIMIT 2;

SELECT 'log_ip_cmi' AS Tabla;
SELECT * FROM log_ip_cmi LIMIT 2;   