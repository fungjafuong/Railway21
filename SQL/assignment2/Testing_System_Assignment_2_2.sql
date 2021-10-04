DROP DATABASE IF EXISTS TestingSystem3;
CREATE DATABASE TestingSystem3;
USE TestingSystem3;
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
DepartmentID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
DepartmentName NVARCHAR(30) NOT NULL UNIQUE KEY
);
-- create table 2: Posittion
DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
PositionID MEDIUMINT UNSIGNED AUTO_INCREMENT
PRIMARY KEY,
PositionName ENUM('DEV','TEST','SCRUM_MASTER','PM') NOT NULL UNIQUE
KEY
);
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
AccountID MEDIUMINT UNSIGNED AUTO_INCREMENT
PRIMARY KEY,
Email VARCHAR(50) NOT NULL UNIQUE KEY,
Username VARCHAR(50) NOT NULL UNIQUE KEY,
FullName NVARCHAR(50) NOT NULL,
DepartmentID MEDIUMINT UNSIGNED NOT NULL,
PositionID MEDIUMINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
GroupID MEDIUMINT UNSIGNED AUTO_INCREMENT
PRIMARY KEY,
GroupName NVARCHAR(50) NOT NULL UNIQUE KEY,
CreatorID MEDIUMINT UNSIGNED,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
GroupID MEDIUMINT UNSIGNED NOT NULL,
AccountID MEDIUMINT UNSIGNED NOT NULL,
JoinDate DATETIME DEFAULT NOW(),
PRIMARY KEY (GroupID,AccountID),
FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID)
);
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
TypeID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
TypeName ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
CategoryID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
CategoryName NVARCHAR(50) NOT NULL UNIQUE KEY
);
DROP TABLE IF EXISTS Question;CREATE TABLE Question(
QuestionID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content NVARCHAR(100) NOT NULL,
CategoryID MEDIUMINT UNSIGNED NOT NULL,
TypeID MEDIUMINT UNSIGNED NOT NULL,
CreatorID MEDIUMINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),
FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
AnswerID MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Content NVARCHAR(100) NOT NULL,
QuestionID MEDIUMINT UNSIGNED,
isCorrect BIT DEFAULT 1,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
ExamID MEDIUMINT UNSIGNED AUTO_INCREMENT
PRIMARY KEY,
`Code` CHAR(10) NOT NULL,
Title NVARCHAR(50) NOT NULL,
CategoryID MEDIUMINT UNSIGNED NOT NULL,
Duration MEDIUMINT UNSIGNED NOT NULL,
CreatorID MEDIUMINT UNSIGNED NOT NULL,
CreateDate DATETIME DEFAULT NOW(),FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
ExamID MEDIUMINT UNSIGNED NOT NULL,
QuestionID MEDIUMINT UNSIGNED NOT NULL,
FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID) ON DELETE CASCADE,
FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
PRIMARY KEY (ExamID,QuestionID)
);

USE TestingSystem3;

INSERT INTO department(DepartmentName) VALUES ('Sale');
INSERT INTO department(DepartmentName) VALUES ('Marketing');
INSERT INTO department(DepartmentName) VALUES ('Develop');
INSERT INTO department(DepartmentName) VALUES ('QA');

INSERT INTO `Position`(PositionName) VALUES ('DEV');
INSERT INTO `Position`(PositionName) VALUES ('TEST');
INSERT INTO `Position`(PositionName) VALUES ('SCRUM_MASTER');
INSERT INTO `Position`(PositionName) VALUES ('PM');

INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID)
VALUES ('luongnx@gmail.com','luongnx','Nguyen Xuan Luong',1,1);
INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID)
VALUES ('anhnm@gmail.com','anhnm','Nguyen Minh Anh',2,2);
INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID)
VALUES ('phuongpg@gmail.com','phuongpg','Phung Gia PHuong',3,3);
INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID)
VALUES ('hongvt@gmail.com','hongvt','Vu Thi Hong',3,3);
INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID)
VALUES ('thanhnv@gmail.com','thanhnv','Nguyen Van Thanh',4,4);
INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID)
VALUES ('quyetph@gmail.com','quyetph','Pham Huu Quyet',4,4);

INSERT INTO  `Group` (GroupName,CreatorID)
VALUES ('Nhom 1',1);
INSERT INTO  `Group` (GroupName,CreatorID)
VALUES ('Nhom 2',2);
INSERT INTO  `Group` (GroupName,CreatorID)
VALUES ('Nhom 6',6);
INSERT INTO  `Group` (GroupName,CreatorID)
VALUES ('Nhom 4',4);
INSERT INTO  `Group` (GroupName,CreatorID)
VALUES ('Nhom 5',5);

INSERT INTO GroupAccount(GroupID,AccountID)
VALUES (1,1);
INSERT INTO GroupAccount(GroupID,AccountID)
VALUES (5,2);
INSERT INTO GroupAccount(GroupID,AccountID)
VALUES (4,2);
INSERT INTO GroupAccount(GroupID,AccountID)
VALUES (3,4);
INSERT INTO GroupAccount(GroupID,AccountID)
VALUES (2,5);

INSERT INTO TypeQuestion(TypeName)
VALUES ('Essay');
INSERT INTO TypeQuestion(TypeName)
VALUES ('Multiple-Choice');

INSERT INTO CategoryQuestion(CategoryName)
VALUES ('IQ');
INSERT INTO CategoryQuestion(CategoryName)
VALUES ('MO');
INSERT INTO CategoryQuestion(CategoryName)
VALUES ('DONG');

INSERT INTO Question(Content,CategoryID,TypeID,CreatorID)
VALUES ('Dinh nghia SQL',3, 1,1);
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID)
VALUES ('Dinh nghia IT',3, 2,2);
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID)
VALUES ('Mot cong 1 bang may',1, 2,3);
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID)
VALUES ('Cac loai kieu du lieu',2, 1,4);
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID)
VALUES ('Dinh nghia Java',3, 1,5);

INSERT INTO Answer (Content, QuestionID, isCorrect)
VALUES ('SGK',2,1);
INSERT INTO Answer (Content, QuestionID, isCorrect)
VALUES ('SGK',3,1);
INSERT INTO Answer (Content, QuestionID, isCorrect)
VALUES ('SGK',1,0);
INSERT INTO Answer (Content, QuestionID, isCorrect)
VALUES (2,4,1);
INSERT INTO Answer (Content, QuestionID, isCorrect)
VALUES ('SGK',3,1);
INSERT INTO Answer (Content, QuestionID, isCorrect)
VALUES ('SGK',5,1);

INSERT INTO Exam(`Code`,Title,CategoryID,Duration,CreatorID)
VALUES ('T1', 'XS',1,60,1);
INSERT INTO Exam(`Code`,Title,CategoryID,Duration,CreatorID)
VALUES ('T1', 'XS',3,60,4);
INSERT INTO Exam(`Code`,Title,CategoryID,Duration,CreatorID)
VALUES ('T2', 'BT',1,40,5);
INSERT INTO Exam(`Code`,Title,CategoryID,Duration,CreatorID)
VALUES ('T1', 'XS',2,60,2);
INSERT INTO Exam(`Code`,Title,CategoryID,Duration,CreatorID)
VALUES ('T2', 'BT',1,40,3);

INSERT INTO ExamQuestion(ExamID,QuestionID)
VALUES (1,4);
INSERT INTO ExamQuestion(ExamID,QuestionID)
VALUES (3,4);
INSERT INTO ExamQuestion(ExamID,QuestionID)
VALUES (2,5);
INSERT INTO ExamQuestion(ExamID,QuestionID)
VALUES (1,3);
INSERT INTO ExamQuestion(ExamID,QuestionID)
VALUES (3,5);