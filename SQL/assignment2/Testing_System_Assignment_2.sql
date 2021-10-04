DROP DATABASE IF EXISTS Testing_System_2;
CREATE DATABASE Testing_System_2;
USE Testing_System_2;
-- TABLE 1
CREATE TABLE Department(
	DepartmentID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName NVARCHAR(50) NOT NULL
);
-- TABELE 2
CREATE TABLE `Position`(
	PositionID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName ENUM ('Dev','Test','Scrum_Master','PM')
);
-- TABLE 3
CREATE TABLE `Account`(
	AccountID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email NVARCHAR(50) UNIQUE NOT NULL ,
    Username NVARCHAR(50) UNIQUE NOT NULL,
    FullName NVARCHAR(50) NOT NULL,
    DepartmentID INT UNSIGNED,
    PositionID INT UNSIGNED,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES `Position` (PositionID)
);
-- TABLE 4
CREATE TABLE `Group`(
	GroupID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName NVARCHAR(50) UNIQUE NOT NULL,
    CreatorID INT UNSIGNED,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);
-- TABLE 5
CREATE TABLE GroupAcount(
	GroupID INT UNSIGNED,
    AccountID INT UNSIGNED,
    JointDate DATETIME DEFAULT NOW(),
    PRIMARY KEY(GroupID,AccountID),
    FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
    FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
);
-- TABLE 6
CREATE TABLE TypeQuestion(
	TypeID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    TypeName ENUM('Essay', 'Multiple_Choice')
);
-- TABLE 7
CREATE TABLE CategoryQuestion(
	CategoryID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName NVARCHAR(50) NOT NULL
);
-- TABLE 8
CREATE TABLE Question(
	QuestionID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content NVARCHAR(50) NOT NULL,
    CategoryID INT UNSIGNED,
    TypeID INT UNSIGNED,
    CreatorID INT UNSIGNED,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion (TypeID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)    
);
-- TABLE 9
CREATE TABLE Answer(
	AnswerID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content NVARCHAR(50) NOT NULL,
    QuestionID INT UNSIGNED,
    isCorrect BIT,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);
-- TABLE 10
CREATE TABLE Exam(
	ExamID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code` NVARCHAR(50) NOT NULL,
    Title NVARCHAR(50) NOT NULL,
    CategoryID INT UNSIGNED,
    Duration TINYINT UNSIGNED NOT NULL,
    CreatorID INT UNSIGNED,
    CreateDate DATETIME DEFAULT NOW(),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);
-- TABLE 11
CREATE TABLE ExamQuestion(
	ExamID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    QuestionID INT UNSIGNED,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);