-- Create table assign_cmi with key assignment information
CREATE TABLE IF NOT EXISTS assign_cmi AS
SELECT 
    id, 
    course, 
    duedate, 
    allowsubmissionsfromdate, 
    timemodified, 
    name 
   FROM mdl_assign;

-- Create table assign_submission_cmi with key submission information
CREATE TABLE IF NOT EXISTS assign_submission_cmi AS
SELECT 
    assignment, 
    userid, 
    status, 
    timemodified
FROM mdl_assign_submission;

-- Create table assign_grades_cmi with key assignment grading information
CREATE TABLE IF NOT EXISTS assign_grades_cmi AS
SELECT 
    assignment, 
    userid, 
    grade, 
    timemodified
FROM mdl_assign_grades;

-- Create table quiz_cmi with key quiz information
CREATE TABLE IF NOT EXISTS quiz_cmi AS
SELECT 
    id, 
    course, 
    timeopen, 
    timeclose, 
    name, 
    timemodified
FROM mdl_quiz;

-- Create table quiz_attempts_cmi with key quiz attempt information
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

-- Create table forum_cmi with key forum information
CREATE TABLE IF NOT EXISTS forum_cmi AS
SELECT 
    id, 
    course, 
    name, 
    type,
    timemodified
FROM mdl_forum;

-- Create table forum_discussions_cmi with key forum discussion information
CREATE TABLE IF NOT EXISTS forum_discussions_cmi AS
SELECT 
    id, 
    forum, 
    userid, 
    timemodified, 
    timestart
FROM mdl_forum_discussions;

-- Create table forum_posts_cmi with key forum post information
CREATE TABLE IF NOT EXISTS forum_posts_cmi AS
SELECT 
    id, 
    discussion, 
    userid, 
    created
FROM mdl_forum_posts;

-- Create table course_modules_cmi to associate resources with courses and extract visibility
CREATE TABLE IF NOT EXISTS course_modules_cmi AS
SELECT 
    id,
    course,
    module,
    instance,
    visible,
    added
FROM mdl_course_modules;

-- Create table modules_cmi to map activity types (assign, forum, quiz, etc.)
CREATE TABLE IF NOT EXISTS modules_cmi AS
SELECT 
    id,
    name
FROM mdl_modules;
