

-- ==========================================
-- Create Database
-- ==========================================

-- CREATE DATABASE studentdb;

-- USE studentdb;


/*
-- ==========================================
-- Create Students Table
-- ==========================================

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    enrollment_year INT
);


-- ==========================================
-- Create Subjects Table
-- ==========================================

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50)
);


-- ==========================================
-- Create Exams Table
-- ==========================================

CREATE TABLE Exams (
    exam_id INT PRIMARY KEY,
    exam_name VARCHAR(50),
    exam_date DATE
);


-- ==========================================
-- Create Marks Table
-- ==========================================

CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    exam_id INT,
    score INT,

    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id),
    FOREIGN KEY (exam_id) REFERENCES Exams(exam_id)
);

-- ==========================================
-- Insert into Students
-- ==========================================

INSERT INTO Students
(student_id, first_name, last_name, enrollment_year)
VALUES
    (1, 'Aarav',  'Sharma', 2023),
    (2, 'Diya',   'Patel',  2023),
    (3, 'Vihaan', 'Rao',    2024),
    (4, 'Ananya', 'Singh',  2024);


-- ==========================================
-- Insert into Subjects
-- ==========================================

INSERT INTO Subjects
(subject_id, subject_name)
VALUES
    (101, 'Mathematics'),
    (102, 'Science'),
    (103, 'Hindi Literature');


-- ==========================================
-- Insert into Exams
-- ==========================================

INSERT INTO Exams
(exam_id, exam_name, exam_date)
VALUES
    (1, 'Half-Yearly 2024', '2024-09-15'),
    (2, 'Final Annual 2024', '2024-03-20');


-- ==========================================
-- Insert into Marks
-- ==========================================

INSERT INTO Marks
(mark_id, student_id, subject_id, exam_id, score)
VALUES
    (1, 1, 101, 1, 85),
    (2, 1, 102, 1, 90),
    (3, 2, 101, 1, 75),
    (4, 2, 102, 1, 60),
    (5, 3, 101, 1, 95),
    (6, 1, 101, 2, 88),
    (7, 2, 101, 2, 79),
    (8, 3, 101, 2, 92);
    

*/

SELECT * FROM Students;

SELECT * FROM Subjects;

SELECT * FROM Exams;

SELECT * FROM Marks;



/*
-- 1.Retrieve all students: List the first name and last name of every student.
SELECT first_name, last_name
FROM Students;

-- 2. Find all entries in the Marks table where the score is greater than 80.

SELECT * FROM Marks
WHERE score > 80;

-- 3. List all exams sorted by their date, starting with the most recent.
SELECT * FROM Exams
ORDER BY exam_date DESC;

-- 4. List the First Name, Subject Name, and Score for every mark recorded.

SELECT s.first_name,sub.subject_name,m.score
FROM Marks m
JOIN Students s
ON m.student_id = s.student_id
JOIN Subjects sub
ON m.subject_id = sub.subject_id;

-- 5. Calculate the average score for each subject. Display the Subject Name and the Average Score.
SELECT sub.subject_name,AVG(m.score) AS average_score
FROM Marks m
JOIN Subjects sub
ON m.subject_id = sub.subject_id
GROUP BY sub.subject_name;

-- 6. How many marks have been recorded specifically for "Aarav Sharma"?

SELECT COUNT(*) AS total_marks
FROM Marks m
JOIN Students s
ON m.student_id = s.student_id
WHERE s.first_name = 'Aarav' AND s.last_name = 'Sharma';

-- 7. Find the student (First Name, Last Name) who has the highest single score in any exam.

SELECT s.first_name,s.last_name,m.score
FROM Students s
JOIN Marks m
ON s.student_id = m.student_id
WHERE m.score = (SELECT MAX(score)FROM Marks);

-- 8. Display the Exam Name and the total sum of scores for that exam, but only for exams where the total sum is greater than 250.

SELECT e.exam_name,SUM(m.score) AS total_score
FROM Exams e
JOIN Marks m
ON e.exam_id = m.exam_id
GROUP BY e.exam_name
HAVING SUM(m.score) > 250;

-- 9. Create a report showing the Student Name, Subject, Score, and a status column that says "Pass" if the score is 70 or above, and "Fail" if below.

SELECT CONCAT(s.first_name, ' ', s.last_name) AS student_name,sub.subject_name,m.score,
       CASE
           WHEN m.score >= 70 THEN 'Pass'
           ELSE 'Fail'
       END AS status
FROM Marks m
JOIN Students s
ON m.student_id = s.student_id
JOIN Subjects sub
ON m.subject_id = sub.subject_id;
*/