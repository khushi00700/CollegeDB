-- College Database Management System SQL Script

-- Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Email VARCHAR(100) UNIQUE
);

-- Create Instructors Table
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Department VARCHAR(100)
);

-- Create Courses Table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

-- Create Enrollments Table (Many-to-Many Relationship)
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert sample data into Students
INSERT INTO Students (StudentID, Name, Age, Email) VALUES
(1, 'Khushi Panchal', 20, 'kp@example.com'),
(2, 'Riya Patel', 22, 'rp@example.com'),
(3, 'Keshwi Shah', 19, 'ks@example.com');

-- Insert sample data into Instructors
INSERT INTO Instructors (InstructorID, Name, Department) VALUES
(101, 'Dr. Prashant Thakkar', 'Computer Science'),
(102, 'Dr. Krishna Mehta', 'Mathematics');

-- Insert sample data into Courses
INSERT INTO Courses (CourseID, CourseName, InstructorID) VALUES
(201, 'Data Structures', 101),
(202, 'Calculus', 102);

-- Insert sample data into Enrollments
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1001, 1, 201, '2023-01-15'),
(1002, 2, 202, '2023-01-17'),
(1003, 3, 201, '2023-01-20');

-- Sample Query: List all students with their enrolled courses
SELECT s.Name AS StudentName, c.CourseName, i.Name AS InstructorName
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Instructors i ON c.InstructorID = i.InstructorID
ORDER BY s.Name;
