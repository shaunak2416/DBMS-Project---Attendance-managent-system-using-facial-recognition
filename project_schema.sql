CREATE DATABASE attendance_management_system ;
USE attendance_management_system ; 
CREATE TABLE class
(
  class_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  batch VARCHAR(8),
  department VARCHAR(25)
  );

CREATE TABLE course 
(
   course_code VARCHAR(12) PRIMARY KEY,
   course_name VARCHAR(30),
   credits INT 
);

CREATE TABLE student 
(
   PRN BIGINT PRIMARY KEY,
   student_name VARCHAR(255),
   contact VARCHAR(15),
   email VARCHAR(255),
   semester INT,
   registration_key VARCHAR(6),
   registration_date DATE,
   class_id INT,
   login_id VARCHAR(20),
   passwd  VARCHAR(15),
   FOREIGN KEY(class_id) REFERENCES class(class_id) ON DELETE CASCADE 
); 

CREATE TABLE takes_course 
(
  course_code VARCHAR(12),
  class_id INT,
  PRIMARY KEY(course_code, class_id),
  FOREIGN KEY(course_code) REFERENCES course(course_code),
  FOREIGN KEY(class_id) REFERENCES class(class_id)
  );
  
CREATE TABLE faculty
(
   emp_id INT PRIMARY KEY NOT NULL auto_increment,
   department VARCHAR(25),
   email VARCHAR(255), 
   office_no INT,
   designation VARCHAR(30),
   contact_no VARCHAR(15),
   login_ID VARCHAR(20),
   passwd VARCHAR(15)
);

CREATE TABLE assigned_to
(
  course_code VARCHAR(12),
  emp_id INT,
  start_date DATE,
  end_date DATE,
  PRIMARY KEY(course_code, emp_id),
  FOREIGN KEY(course_code) REFERENCES course(course_code),
  FOREIGN KEY(emp_id) REFERENCES faculty(emp_id)
  );
  
CREATE TABLE lecture 
(
    date_conducted_and_time DATETIME,
    classroom VARCHAR(3),
    PRIMARY KEY(date_conducted_and_time, classroom)
);

CREATE TABLE attends
(
    PRN bigint,
    date_time DATETIME,
    classroom VARCHAR(3), 
    course_code VARCHAR(12),
    PRIMARY KEY(PRN, date_time, classroom),
    FOREIGN KEY(course_code) REFERENCES course(course_code),
    foreign key(PRN) REFERENCES student(PRN)
);

CREATE TABLE conducts
(
   date_time DATETIME,
   classroom VARCHAR(3),
   emp_id INT,
   course_code VARCHAR(12),
   PRIMARY KEY(date_time, classroom), 
   FOREIGN KEY(emp_id) REFERENCES faculty(emp_id),
   FOREIGN KEY(course_code) REFERENCES course(course_code)
);

CREATE TABLE attendance
(
   PRN BIGINT,
   course_code VARCHAR(12),
   no_of_lectures_attended INT,
   PRIMARY KEY(PRN, course_code),
   FOREIGN KEY(PRN) references student(PRN),
   FOREIGN KEY(course_code) references course(course_code)
);