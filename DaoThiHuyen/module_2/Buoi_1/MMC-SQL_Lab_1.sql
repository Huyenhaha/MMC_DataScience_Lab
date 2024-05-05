CREATE DATABASE Testing_System_Db;
USE Testing_System_Db;

CREATE TABLE Department(
	DepartmentID 		INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName		VARCHAR(50)
);

CREATE TABLE Positions(
	PositionID 			INT AUTO_INCREMENT PRIMARY KEY,
    PositionName 		VARCHAR(50)
);

CREATE TABLE  Accounts(
	AccountID			INT AUTO_INCREMENT PRIMARY KEY,
    Email				VARCHAR(50),
    Username			VARCHAR(50),
    FullName			VARCHAR(50),
    DepartmentID		INT,
    PositionID			INT,
    CreateDate			DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES Positions(PositionID)
);

CREATE TABLE GroupInfor(
	GroupID				INT AUTO_INCREMENT PRIMARY KEY,
    GroupName 			VARCHAR(50),
    CreatorID 			INT,
    CreateDate 			DATE 
);

CREATE TABLE GroupAccount(
	GroupID 		INT,
    AccountID 		INT,
    JoinDate		DATE,
    FOREIGN KEY (GroupID) REFERENCES GroupInfor(GroupID),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE TypeQuestion(
	TypeID 			INT AUTO_INCREMENT PRIMARY KEY,
    TypeName		VARCHAR(50)
);

CREATE TABLE CategoryQuestion(
	CategoryID  	INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName	VARCHAR(50)
);

CREATE TABLE Question(
	QuestionID 		INT AUTO_INCREMENT PRIMARY KEY,
    Content 		VARCHAR(100),
    CategoryID 		INT,
    TypeID 			INT,
    CreatorID 		INT,
    CreateDate 		DATE,
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
	FOREIGN KEY (CreatorID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Answer(
	AnswerID 		INT AUTO_INCREMENT PRIMARY KEY,
    Content 		VARCHAR(300),
    QuestionID		INT,
    isCorrect 		INT,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

CREATE TABLE Exam(
	ExamID 			INT AUTO_INCREMENT PRIMARY KEY,
    Codes  			VARCHAR(50),
    Title			VARCHAR(50),
    CategoryID		INT,
    Duration		INT,
    CreatorID		INT,
    CreateDate		DATE,
    FOREIGN KEY (CreatorID) REFERENCES Accounts(AccountID)
);

CREATE TABLE ExamQuestion(
	ExamID 			INT,
	QuestionID 		INT,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
); 






