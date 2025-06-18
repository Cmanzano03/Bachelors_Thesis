-- Crear tabla assign_cmi con información clave de tareas
CREATE TABLE IF NOT EXISTS assign_cmi AS
SELECT 
    id, 
    course, 
    duedate, 
    allowsubmissionsfromdate, 
    timemodified, 
    name 
   FROM mdl_assign;

-- Crear tabla assign_submission_cmi con información clave sobre las entregas
CREATE TABLE IF NOT EXISTS assign_submission_cmi AS
SELECT 
    assignment, 
    userid, 
    status, 
    timemodified
FROM mdl_assign_submission;

-- Crear tabla assign_grades_cmi con información clave sobre las calificaciones de las tareas
CREATE TABLE IF NOT EXISTS assign_grades_cmi AS
SELECT 
    assignment, 
    userid, 
    grade, 
    timemodified
FROM mdl_assign_grades;

-- Crear tabla quiz_cmi con información clave de cuestionarios
CREATE TABLE IF NOT EXISTS quiz_cmi AS
SELECT 
    id, 
    course, 
    timeopen, 
    timeclose, 
    name, 
    timemodified
FROM mdl_quiz;

-- Crear tabla quiz_attempts_cmi con información clave sobre los intentos de cuestionarios
CREATE TABLE IF NOT EXISTS quiz_attempts_cmi AS
SELECT 
    quiz, 
    userid, 
    state, 
    attempt, 
    sumgrades, 
    timestart, 
    timefinish
FROM mdl_quiz_attempts;

-- Crear tabla forum_cmi con información clave sobre los foros
CREATE TABLE IF NOT EXISTS forum_cmi AS
SELECT 
    id, 
    course, 
    name, 
    type,
    timemodified
FROM mdl_forum;

-- Crear tabla forum_discussions_cmi con información clave sobre las discusiones en los foros
CREATE TABLE IF NOT EXISTS forum_discussions_cmi AS
SELECT 
    id, 
    forum, 
    userid, 
    timemodified, 
    timestart
FROM mdl_forum_discussions;

-- Crear tabla forum_posts_cmi con información clave sobre los mensajes en los foros
CREATE TABLE IF NOT EXISTS forum_posts_cmi AS
SELECT 
    id, 
    discussion, 
    userid, 
    created
FROM mdl_forum_posts;

-- Crear tabla course_modules_cmi para asociar recursos a cursos y extraer visibilidad
CREATE TABLE IF NOT EXISTS course_modules_cmi AS
SELECT 
    id,
    course,
    module,
    instance,
    visible,
    added
FROM mdl_course_modules;

-- Crear tabla modules_cmi para mapear los tipos de actividad (assign, forum, quiz, etc.)
CREATE TABLE IF NOT EXISTS modules_cmi AS
SELECT 
    id,
    name
FROM mdl_modules;
