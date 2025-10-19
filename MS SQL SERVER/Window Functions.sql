USE [SQL Basics Questions];


-- ROW NUMBER, DENSE RANK
CREATE TABLE Students(
    student_name VARCHAR(100),
    subject VARCHAR(100),
    marks INT
);

INSERT INTO Students (student_name, subject, marks)
VALUES 
-- Marks for Alice
('Alice', 'Math', 85),
('Alice', 'Science', 88),
('Alice', 'English', 92),

-- Marks for Bob
('Bob', 'Math', 90),
('Bob', 'Science', 78),
('Bob', 'English', 85),

-- Marks for Charlie
('Charlie', 'Math', 85),
('Charlie', 'Science', 82),
('Charlie', 'English', 80),

-- Marks for David
('David', 'Math', 92),
('David', 'Science', 91),
('David', 'English', 89),

-- Marks for Eve
('Eve', 'Math', 90),
('Eve', 'Science', 85),
('Eve', 'English', 87),

-- Marks for Frank
('Frank', 'Math', 75),
('Frank', 'Science', 72),
('Frank', 'English', 78),

-- Marks for Grace
('Grace', 'Math', 85),
('Grace', 'Science', 89),
('Grace', 'English', 90);

SELECT * FROM Students;

-- Row_Number -> in case of a tie number are assigned randomly.
SELECT * ,ROW_NUMBER() OVER(ORDER BY marks DESC) AS [Row Number]
FROM Students;

-- Rank-> if there's tie next rank/ranks will be skipped.
SELECT * ,RANK() OVER(ORDER BY marks DESC) AS [Rank Number]
FROM Students;

-- Dense Rank-> if there's tie ranks will not be skipped.
SELECT *, DENSE_RANK() OVER(ORDER BY marks DESC) [Dense Rank]
FROM Students;


SELECT *,ROW_NUMBER() OVER(PARTITION BY subject ORDER BY  marks DESC) [Row Numkber Desc]
FROM Students;


SELECT *,ROW_NUMBER() OVER(PARTITION BY subject ORDER BY  marks) [Row Numkber Asc]
FROM Students;

SELECT *,ROW_NUMBER() OVER(PARTITION BY student_name ORDER BY  marks) [Row Numkber Asc]
FROM Students;

SELECT *,RANK() OVER(PARTITION BY student_name ORDER BY  marks DESC) [Rank Desc]
FROM Students;

SELECT *,ROW_NUMBER() OVER(PARTITION BY subject ORDER BY  marks DESC) [Rank Desc]
FROM Students;

SELECT *,DENSE_RANK() OVER(PARTITION BY subject ORDER BY marks DESC) [Dense rank Desc]
FROM Students;

SELECT *,DENSE_RANK() OVER(PARTITION BY student_name ORDER BY marks ASC) [Dense rank asc]
FROM Students;