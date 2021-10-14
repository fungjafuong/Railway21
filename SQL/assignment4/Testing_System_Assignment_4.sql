USE TestingSystem3;

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT a.AccountID, a.Email, a.Username, a.FullName, b.DepartmentName
FROM `Account` a 
JOIN Department b ON a.DepartmentID = b.DepartmentID
ORDER BY a.AccountID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT *
FROM `Account` 
WHERE CreateDate > '2010-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT b.PositionName, a.AccountID, a.Email, a.Username, a.FullName
FROM `Account` a
JOIN Position b ON a.PositionID = b.PositionID
WHERE b.PositionName = 'DEV';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT a.DepartmentName, COUNT(b.AccountID) AS So_Nhan_Vien
FROM Department a 
JOIN `Account` b ON a.DepartmentID = b.DepartmentID
GROUP BY a.DepartmentID
HAVING COUNT(b.AccountID) > 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất 
SELECT a.Content AS Danh_Sach_Cau_Hoi, COUNT(b.ExamID) AS So_De_Thi_Su_Dung
FROM Question a
RIGHT JOIN ExamQuestion b ON a.QuestionID = b.QuestionID
GROUP BY a.QuestionID
HAVING COUNT(b.ExamID) = (SELECT COUNT(ExamID) FROM ExamQuestion GROUP BY QuestionID ORDER BY COUNT(ExamID) DESC LIMIT 1);

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT a.CategoryName, a.CategoryID, COUNT(b.QuestionID) AS So_Cau_Hoi
FROM CategoryQuestion a
LEFT JOIN Question b ON a.CategoryID = b.CategoryID
GROUP BY a.CategoryID;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT a.Content, COUNT(b.ExamID) AS So_De_Thi_Su_Dung
FROM Question a
LEFT JOIN ExamQuestion b ON a.QuestionID = b.QuestionID
GROUP BY a.QuestionID;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT a.Content, a.QuestionID, COUNT(b.AnswerID) AS So_Cau_Tra_Loi
FROM Question a
LEFT JOIN Answer b ON a.QuestionID = b.QuestionID
GROUP BY a.QuestionID
HAVING COUNT(b.AnswerID) = (SELECT COUNT(AnswerID) FROM Answer GROUP BY QuestionID ORDER BY COUNT(AnswerID) DESC LIMIT 1);

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT a.GroupName, COUNT(b.AccountID) AS So_Account
FROM `Group` a
LEFT JOIN GroupAccount b ON a.GroupID = b.GroupID
GROUP BY a.GroupID;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT a.DepartmentName, COUNT(b.AccountID) AS So_Nguoi
FROM Department a
LEFT JOIN `Account` b ON a.DepartmentID = b.DepartmentID
GROUP BY a.DepartmentID
HAVING COUNT(b.AccountID) = ( SELECT COUNT(AccountID) FROM `Account` GROUP BY DepartmentID ORDER BY COUNT(AccountID) LIMIT 1);

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT b.DepartmentName, c.PositionName, COUNT(a.AccountID) AS So_Nhan_Vien
FROM `Account` a
LEFT JOIN Department b ON a.DepartmentID = b.DepartmentID
LEFT JOIN `Position` c ON a.PositionID = c.PositionID
GROUP BY a.DepartmentID, a.PositionID; 

-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT b.TypeName, COUNT(a.QuestionID) AS So_Cau_Hoi
FROM Question a
JOIN TypeQuestion b ON a.TypeID = b.TypeID
GROUP BY a.TypeID;

-- Question 14 + 15:Lấy ra group không có account nào>>> co so accoun it nhat
SELECT a.GroupID, a.GroupName, COUNT(b.AccountID) AS So_Account
FROM `Group` a
LEFT JOIN GroupAccount b ON a.GroupID = b.GroupID
GROUP BY a.GroupID
HAVING COUNT(b.AccountID) = (SELECT COUNT(AccountID) FROM GroupAccount GROUP BY GroupID ORDER BY COUNT(AccountID) LIMIT 1);

-- Question 16: Lấy ra question không có answer nào>>> co so answer it nhat
SELECT a.Content, COUNT(b.AnswerID) AS So_Cau_Tra_Loi
FROM Question a
LEFT JOIN Answer b ON a.QuestionID = b.QuestionID
GROUP BY b.QuestionID
HAVING COUNT(b.AnswerID) = (SELECT COUNT(AnswerID) FROM Answer GROUP BY QuestionID ORDER BY COUNT(AnswerID) LIMIT 1);

-- Question 17:
  -- a) Lấy các account thuộc nhóm thứ 1
  -- b) Lấy các account thuộc nhóm thứ 2
  -- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT b.AccountID, b.Email, b.FullName, a.GroupID
FROM GroupAccount a 
JOIN `Account` b ON a.AccountID = b.AccountID
WHERE a.GroupID = 1 
UNION
SELECT b.AccountID, b.Email, b.FullName, a.GroupID
FROM GroupAccount a 
JOIN `Account` b ON a.AccountID = b.AccountID
WHERE a.GroupID = 2;

-- Question 18:
   -- a) Lấy các group có lớn hơn 5 thành viên
   -- b) Lấy các group có nhỏ hơn 7 thành viên>>> nho hon 20 thanh vien
   -- c) Ghép 2 kết quả từ câu a) và câu b)

SELECT c.GroupName, COUNT(a.AccountID) AS So_Thanh_Vien
FROM `GroupAccount` a
JOIN `Group` c ON a.GroupID = c.GroupID
GROUP BY a.GroupID
HAVING COUNT(a.AccountID) > 5
UNION
SELECT c.GroupName, COUNT(a.AccountID) AS So_Thanh_Vien
FROM `GroupAccount` a
JOIN `Group` c ON a.GroupID = c.GroupID
GROUP BY a.GroupID
HAVING COUNT(a.AccountID) < 20 ;
