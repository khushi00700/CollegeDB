# 🎓 College Database Management System (SQL)

This project is a **College Database Management System** built using SQL. It demonstrates how to design and query a relational database for managing students, instructors, courses, and enrollments in a college environment.

## 📌 Features

- Creation of key relational database tables:
  - `Students`
  - `Instructors`
  - `Courses`
  - `Enrollments`
- Establishes relationships using:
  - `PRIMARY KEY`
  - `FOREIGN KEY`
- Populates the database with sample data using `INSERT` statements
- Demonstrates a real-world **many-to-many relationship** (students enrolling in multiple courses)

## 📊 Sample Query Output

Fetches a list of students with their enrolled courses and instructors using `JOIN`:

```sql
SELECT s.Name AS StudentName, c.CourseName, i.Name AS InstructorName
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Instructors i ON c.InstructorID = i.InstructorID
ORDER BY s.Name;
