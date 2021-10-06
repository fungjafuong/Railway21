USE TestingSystem3;
-- Question 2
SELECT * FROM Department;

-- Question 3
SELECT DepartmentID FROM Department WHERE DepartmentName = 'Sale'; 

-- Question 6
SELECT GroupName FROM `Group` WHERE CreateDate <= '2019-12-20';

-- Question 7
SELECT QuestionID, COUNT(*) AnswerID FROM Answer GROUP BY QuestionID HAVING AnswerID >=4; ; 

-- Question 8
SELECT `Code` FROM Exam  WHERE Duration >= 60 AND CreateDate < '2019-12-20';

-- Question 9
SELECT * FROM `Group` ORDER BY CreateDate ASC LIMIT 5;

-- Question 10
SELECT COUNT(DepartmentID) AS So_Nhan_Vien FROM Department WHERE DepartmentID = 2;

-- Question 11 sua de bai tu 'o' thanh 'r'
SELECT FullName FROM `Account` WHERE FullName LIKE 'D%r';

-- Question 12 
DELETE FROM Exam WHERE CreateDate < '2019-12-20';

-- Question 13 khong co 'cau hoi' nen de vi du 'ch'
DELETE FROM Question WHERE Content LIKE 'Ch%';

-- Question 14
UPDATE `Account` SET FullName = 'Nguyen Ba Loc', Email = 'loc.nguyenba@vti.com.vn' WHERE AccountID = 5;

-- Question 15
UPDATE GroupAccount SET GroupID = 4 WHERE AccountID = 5;

-- Question 4
SELECT * FROM `Account` WHERE LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM `Account`);

-- Question 5
SELECT * FROM `Account` WHERE DepartmentID = 3 AND LENGTH(FullName) = (SELECT MAX(LENGTH(FullName)) FROM `Account` WHERE DepartmentID = 3);


