USE TestingSystem3;

-- Question 1: lay ra danh sách nhân viên thuộc phòng ban sale su dung subquery
SELECT FullName FROM `Account` WHERE DepartmentID = (SELECT DepartmentID FROM Department WHERE DepartmentName = 'Sale');

-- Question 2:  lay ra thông tin các account tham gia vào nhiều group nhất su dung subquery
SELECT a.FullName, a.AccountID, a.Email, COUNT(b.GroupID) AS So_Nhom_Tham_Gia
FROM `Account` a
JOIN GroupAccount b ON a.AccountID = b.AccountID
GROUP BY b.AccountID
HAVING COUNT(b.GroupID) = (SELECT COUNT(GroupID) FROM GroupAccount GROUP BY AccountID ORDER BY COUNT(GroupID) DESC LIMIT 1);

-- Question 3: Tạo CTE có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
WITH Long_Question AS (SELECT Content, QuestionID FROM Question WHERE LENGTH(Content) > 20)
SELECT Content FROM Long_Question WHERE Content LIKE '%h%b';

-- Question 4:Tạo CTE có chứa danh sách các phòng ban có nhiều nhân viên nhất
WITH Most_Staffs AS (
SELECT a.DepartmentID, a.DepartmentName, COUNT(b.AccountID) AS So_Nhan_Vien
FROM Department a
LEFT JOIN `Account` b ON a.DepartmentID = b.DepartmentID
GROUP BY b.DepartmentID
HAVING COUNT(b.AccountID) = (SELECT COUNT(AccountID) FROM `Account` GROUP BY DepartmentID ORDER BY COUNT(AccountID) DESC LIMIT 1))
SELECT DepartmentName FROM Most_Staffs WHERE DepartmentID = 10;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user bat dau bang A tạo
DROP VIEW IF EXISTS A_Tao;
CREATE VIEW A_Tao AS
SELECT b.FullName, COUNT(a.QuestionID) AS So_Luong_Cau_Hoi
FROM Question a 
RIGHT JOIN `Account` b ON a.CreatorID = b.AccountID 
GROUP BY a.CreatorID
HAVING b.FullName LIKE 'A%';