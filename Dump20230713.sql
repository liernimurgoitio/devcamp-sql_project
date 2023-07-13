USE university_schema_devcamp_project;

# Create a script that populates all of the database tables with sample data
	# STUDENTS
    
INSERT INTO students (students_name, students_email)
VALUES ('student1', 'student1@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student2', 'student2@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student3', 'student3@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student4', 'student4@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student5', 'student5@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student6', 'student6@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student7', 'student7@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student8', 'student8@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student9', 'student9@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student10', 'student10@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student11', 'student11@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student12', 'student12@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student13', 'student13@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student14', 'student14@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student15', 'student15@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student16', 'student16@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student17', 'student17@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student18', 'student18@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student19', 'student19@university.com');

INSERT INTO students (students_name, students_email)
VALUES ('student20', 'student20@university.com');

	# COURSES
    
INSERT INTO courses (courses_name, courses_professors_id)
VALUES ('Full Stack Develorper', 1);

INSERT INTO courses (courses_name, courses_professors_id)
VALUES ('Cybersecurity', 2);

INSERT INTO courses (courses_name, courses_professors_id)
VALUES ('Videogame Programming', 3);

INSERT INTO courses (courses_name, courses_professors_id)
VALUES ('Multiplatform Application Development', 1);

INSERT INTO courses (courses_name, courses_professors_id)
VALUES ('Frontend Programmer', 2);

INSERT INTO courses (courses_name, courses_professors_id)
VALUES ('Backend Programmer', 3);

INSERT INTO courses (courses_name, courses_professors_id)
VALUES ('Multidevice Web Design: UX/UI', 1);

	# PROFESSORS
    
INSERT INTO professors (professors_name, professors_email)
VALUES ('professors1', 'professors1@university.com');

INSERT INTO professors (professors_name, professors_email)
VALUES ('professors2', 'professors2@university.com');

INSERT INTO professors (professors_name, professors_email)
VALUES ('professors3', 'professors3@university.com');

	# GRADES
    
INSERT INTO grades (grades_grade, grades_courses_id, grades_students_id, grades_professors_id)
VALUES ('5', 1, 20, 1);

INSERT INTO grades (grades_grade, grades_courses_id, grades_students_id, grades_professors_id)
VALUES ('4', 7, 5, 1);

INSERT INTO grades (grades_grade, grades_courses_id, grades_students_id, grades_professors_id)
VALUES ('3', 3, 16, 3);

INSERT INTO grades (grades_grade, grades_courses_id, grades_students_id, grades_professors_id)
VALUES ('2', 6, 8, 3);

INSERT INTO grades (grades_grade, grades_courses_id, grades_students_id, grades_professors_id)
VALUES ('1', 3, 2, 3);

INSERT INTO grades (grades_grade, grades_courses_id, grades_students_id, grades_professors_id)
VALUES ('4', 1, 5, 1);

INSERT INTO grades (grades_grade, grades_courses_id, grades_students_id, grades_professors_id)
VALUES ('5', 7, 9, 1);

INSERT INTO grades (grades_grade, grades_courses_id, grades_students_id, grades_professors_id)
VALUES ('1', 3, 8, 3);

INSERT INTO grades (grades_grade, grades_courses_id, grades_students_id, grades_professors_id)
VALUES ('5', 6, 1, 3);

INSERT INTO grades (grades_grade, grades_courses_id, grades_students_id, grades_professors_id)
VALUES ('3', 3, 20, 3);


# SQL query scripts for:
	# The average grade that is given by each professor

SELECT professors_name AS 'Pofessors Name',
AVG(grades_grade) AS 'Average Grade'
FROM grades g
JOIN professors p
ON g.grades_professors_id = p.professors_id
GROUP BY professors_id;

	# The top grades for each student

SELECT students_name AS 'Student Name',
MAX(grades_grade) AS 'Grades Grade'
FROM students s
JOIN grades g
ON g.grades_students_id = s.students_id
GROUP BY students_name; 

	# Sort students by the courses that they are enrolled in
    
SELECT 
	g.grades_students_id AS 'Student ID',
    s.students_name AS 'Student Name',
	c.courses_name AS 'Course Name'
FROM grades g
JOIN courses c
ON g.grades_courses_id = c.courses_id
JOIN students s
ON g.grades_students_id = s.students_id
ORDER BY students_id;

	# Create a summary report of courses and their average grades, sorted by the most challenging course (course with the lowest average grade) to the easiest course

SELECT 
	c.courses_name AS 'Course Name',
    AVG(g.grades_grade) AS 'Average Grade'
FROM courses c
JOIN grades g 
ON c.courses_id = g.grades_courses_id
GROUP BY c.courses_name
ORDER BY AVG(g.grades_grade) ASC;

	# Finding which student and professor have the most courses in common

SELECT 
	g.grades_students_id AS 'Student ID',
    s.students_name AS 'Student Name',
    p.professors_id AS 'Professor ID',
    p.professors_name AS 'Professor Name',
	COUNT(*) AS 'Common Courses'

FROM grades g
JOIN courses c
ON g.grades_courses_id = c.courses_id
JOIN students s 
ON g.grades_students_id = s.students_id
JOIN professors p 
ON c.courses_professors_id = p.professors_id
GROUP BY 
	s.students_id, 
	p.professors_id
ORDER BY COUNT(*) DESC
LIMIT 1;




