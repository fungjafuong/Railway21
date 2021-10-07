DROP DATABASE IF EXISTS Fresher_Management;
CREATE DATABASE Fresher_Management;
USE Fresher_Management;

-- Q1

DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee (
 TraineeID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Full_Name VARCHAR(50) NOT NULL,
 Birth_Date DATE NOT NULL,
 Gender ENUM ('MALE','FEMALE','UNKNOW'),
 ET_IQ TINYINT UNSIGNED NOT NULL CHECK (ET_IQ <= 20),
 ET_Gmath TINYINT UNSIGNED  NOT NULL CHECK (ET_Gmath <= 20),
 ET_English TINYINT UNSIGNED NOT NULL CHECK (ET_English <= 50),
 Training_Class VARCHAR(10) NOT NULL,
 Evaluation_Notes VARCHAR(20) NOT NULL
);

-- Q2

INSERT INTO Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes)
VALUES              (1, 'Nguyen Van Ha', '1989-11-15', 'MALE', 8, 14, 40, 'VTI001', 'HVCNBCVT'),
                    (2, 'Tran Thi Ha My','1999-10-12', 'FEMALE', 5, 11, 45, 'VTI002', 'DHBKHN'),
                    (3, 'Vu Hai Yen', '1995-7-2', 'FEMALE', 16, 18, 30, 'VTI003', 'HVHCQG'),
                    (4, 'Duong Huu Cuong', '1995-3-26', 'MALE', 19, 11, 25, 'VTI004', 'DHLDXH'),
                    (5, 'Mai Thi Hach', '1998-1-1', 'FEMALE', 8, 8, 27, 'VTI001', 'CDVH'),
                    (6, 'Le Quyet Thang', '1997-8-10', 'MALE', 8, 7, 35, 'VTI002', 'DHKDCN'),
                    (7, 'Pham Tran Hai Nam', '1994-4-9', 'MALE', 2, 17, 42, 'VTI001', 'CDTCNHHY'),
                    (8, 'Lieu Thi Dao', '1999-12-13', 'FEMALE', 15, 15, 47, 'VTI004', 'DHNT'),
                    (9, 'Hoang Van Hoanh', '1997-12-01', 'UNKNOW', 18, 19, 49, 'VTI003', 'DHQGHN'),
					(10, 'Luong Mai Hoang', '1996-11-18', 'UNKNOW', 15, 19, 44, 'VTI001', 'DHKTQS');

-- Q3 
INSERT INTO Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes)
VALUES              (11, 'Nguyen Thi Tham', '1991-5-19', 'FEMALE', 30, 15, 41, 'VTI001', 'HVCNBCVT');

-- Q4 
SELECT * FROM Trainee WHERE ET_IQ >= 12 AND ET_Gmath >= 12 AND ET_English >= 20 ORDER BY Birth_Date;

-- Q5
SELECT * FROM Trainee WHERE Full_Name LIKE 'N%C';

-- Q6
SELECT * FROM Trainee WHERE Full_Name LIKE '_G%';

-- Q7 
SELECT * FROM Trainee WHERE Full_Name LIKE '%C' AND LENGTH(Full_Name) = 10;

-- Q8
SELECT DISTINCT Full_Name FROM Trainee;

-- Q9
SELECT Full_Name FROM Trainee ORDER BY Full_Name ASC;

-- Q10
SELECT * FROM Trainee WHERE LENGTH(Full_Name) = (SELECT MAX(LENGTH(Full_Name)) FROM Trainee);

-- Q11 
SELECT TraineeID, Full_Name, Birth_Date FROM Trainee WHERE LENGTH(Full_Name) = (SELECT MAX(LENGTH(Full_Name)) FROM Trainee);

-- Q12
SELECT Full_Name, ET_IQ, ET_Gmath, ET_English FROM Trainee WHERE LENGTH(Full_Name) = (SELECT MAX(LENGTH(Full_Name)) FROM Trainee);

-- Q13
SELECT * FROM Trainee ORDER BY Birth_Date DESC LIMIT 5; 

-- 14
SELECT  Full_Name AS ET FROM Trainee WHERE ET_IQ + ET_Gmath >= 20 AND ET_IQ >= 8 AND ET_Gmath >=8 AND ET_English >= 18;

-- Q15 
DELETE FROM Trainee WHERE TraineeID = 5;

-- Q16
DELETE FROM Trainee WHERE ET_IQ + ET_Gmath <= 15;

-- Q17
DELETE FROM Trainee WHERE Birth_Date < '1991-10-7';

-- Q18
UPDATE Trainee SET Training_Class = 'VTI003' WHERE TraineeID = 3; 

-- Q19
UPDATE Trainee SET Full_Name = 'LeVanA',
					ET_IQ = 10,
                    ET_Gmath = 15,
                    ET_English = 30 WHERE TraineeID = 10;

-- Q20
SELECT COUNT(*) AS So_Thuc_Tap_Sinh FROM Trainee WHERE Training_Class = 'VTI001';

-- Q21 Q20 like Q21
SELECT COUNT(*) AS So_Thuc_Tap_Sinh FROM Trainee WHERE Training_Class = 'VTI001';

-- Q22

-- Q23
SELECT Gender , COUNT(*) AS So_Thuc_Tap_Sinh FROM Trainee GROUP BY Gender;       

-- Q24, Q25
SELECT Training_Class FROM Trainee GROUP BY Training_Class HAVING COUNT(*) > 5;

-- Q26
SELECT Evaluation_Notes FROM Trainee GROUP BY Evaluation_Notes HAVING COUNT(*) < 4;
-- Q27
      