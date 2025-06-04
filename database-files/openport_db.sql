CREATE DATABASE IF NOT EXISTS openport_database;

USE openport_database;

CREATE TABLE IF NOT EXISTS Religion (
  ReligionID int AUTO_INCREMENT PRIMARY KEY,
  ReligionName VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS CountryReligion (
  ReligionID int,
  CountryID int,
  TotalPracticing int,
  AcceptanceScore int,
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID),
  FOREIGN KEY (ReligionID) REFERENCES Religion (ReligionID),
  PRIMARY KEY (CountryID, ReligionID)
);

CREATE TABLE IF NOT EXISTS ProBonoOpportunity (
  OpportunityID int AUTO_INCREMENT PRIMARY KEY,
  CountryID int,
  Demand int,
  Description VarChar(300),
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID)
);

CREATE TABLE IF NOT EXISTS Spending (
  CountryID int PRIMARY KEY,
  PercentGDP DECIMAL(5,2),
  SpendingYear YEAR,
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID)
);

CREATE TABLE IF NOT EXISTS User (
  UserID int AUTO_INCREMENT PRIMARY KEY,
  LastLogin DATETIME,
  FirstName VARCHAR(50),
  LastName VarChar(50),
  UserRole ENUM('Lawyer', 'Diplomat', 'AsylumSeeker'),
  Email VarChar(50)
);

CREATE TABLE IF NOT EXISTS Diplomat(
  DiplomatID int AUTO_INCREMENT PRIMARY KEY,
  UserID int,
  Email VARCHAR(100),
  CountryID int,
  Department VarChar(50),
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID),
  FOREIGN KEY (UserID) REFERENCES User (userID)
);

CREATE TABLE IF NOT EXISTS Lawyer (
  LawyerID int AUTO_INCREMENT PRIMARY KEY,
  UserID int,
  Nationality int,
  PrefferedRegion int,
  Specialization VarChar(100),
  FOREIGN KEY (Nationality) REFERENCES Country (CountryID),
  FOREIGN KEY (USerID) REFERENCES User (UserID)
);

CREATE TABLE IF NOT EXISTS AsylumSeeker (
  ApplicantID int AUTO_INCREMENT PRIMARY KEY,
  UserID int,
  DOB DATE,
  SEX ENUM('Male', 'Female', 'Other'),
  CurrentLocation int,
  Citizenship int,
  AssignedLawyer int,
  Religion int,
  FOREIGN KEY (CurrentLocation) REFERENCES Country (CountryID),
  FOREIGN KEY (Citizenship) REFERENCES Country (CountryID),
  FOREIGN KEY (UserID) REFERENCES User (userID),
  FOREIGN KEY (AssignedLawyer) REFERENCES Lawyer (LawyerID),
  FOREIGN KEY (Religion) REFERENCES Religion (ReligionID)
);

CREATE TABLE IF NOT EXISTS EducationLevel(
  LevelID int PRIMARY KEY,
  LevelName ENUM('Primary', 'Secondary', 'Tertiary')
);

CREATE TABLE IF NOT EXISTS Education (
  LevelID int,
  CountryID int,
  EducationType VARCHAR (50),
  AccessScore int,
  Ranking int,
  TotalStudents int,
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID),
  FOREIGN KEY (LevelID) REFERENCES EducationLevel (LevelID),
  PRIMARY KEY (CountryID, LevelID)
);

CREATE TABLE IF NOT EXISTS ApplicantGroup(
  GroupID int AUTO_INCREMENT PRIMARY KEY,
  CountryID int,
  AgeRange ENUM('0-13', '14-17', '18-34', '35-64', '65+'), 
  Sex ENUM('Male', 'Female', 'Other'),
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID)
);

CREATE TABLE IF NOT EXISTS Decision (
  DecisionID INT AUTO_INCREMENT PRIMARY KEY,
  DecidingCountry int,
  ApplicantGroup int,
  Total int,
  DecisionType ENUM('TOTAL', 'TOTAL_POS', 'GENCONV', 'HUMSTAT', 'SUB_PROT', 'REJECTED'),
  DecisionYear YEAR,
  FOREIGN KEY (DecidingCountry) REFERENCES Country (CountryID),
  FOREIGN KEY (ApplicantGroup) REFERENCES ApplicantGroup (GroupID)
);

CREATE TABLE IF NOT EXISTS FamilyMemeber (
  UserID INT AUTO_INCREMENT PRIMARY KEY,
  FamilyID INT,
  FirstName varchar(50),
  LastName varchar(50),
  Sex ENUM('Male', 'Female', 'Other'),
  DOB DATE,
  FOREIGN KEY (FamilyID) REFERENCES AsylumSeeker (ApplicantID)
);

CREATE TABLE IF NOT EXISTS LegalAidApplication (
  ApplicantionID INT AUTO_INCREMENT PRIMARY KEY,
  UserID int,
  AidDescription VARCHAR(100),
  SubmissionDate DATE,
  FOREIGN KEY (UserID) REFERENCES AsylumSeeker (ApplicantID)
);

INSERT INTO Country (CountryName) VALUES
('Belgium'),
('Bulgaria'),
('Czechia');

INSERT Into Religion (ReligionName)
VALUES
('Buddhism'),
('Hellenism'),
('Shinto');

INSERT INTO CountryReligion (ReligionID, CountryID, TotalPracticing, AcceptanceScore)
VALUES
(1,1,100,8),
(1,2,150,9),
(2,3,1101,6),
(3,3, 123, 7);

INSERT INTO ProBonoOpportunity (CountryID, Demand, Description)
VALUES
(1,9, 'Helping an asylum seeker prepare their application and supporting documents.'),
(2,9, 'Educating asylum seekers about their legal rights'),
(3,9, 'Assisting with paperwork like appeals, affidavits, or ID applications.');

INSERT INTO Spending (CountryID, PercentGDP, SpendingYear)
VALUES
(1,45.67, 2024),
(2,13.14,2001),
(3,72.30,2022);

INSERT INTO User (LastLogin, FirstName, LastName, UserRole, Email)
VALUES
('2025-05-15 10:30:00', 'Layla', 'Hassan', 'AsylumSeeker', 'laylahassan@gmail.com'),
('2025-05-15 09:15:00', 'Mark', 'Weber', 'Diplomat', 'webermark@diplomats.eu'),
('2025-05-14 17:45:00', 'Sebastian', 'Vettel', 'Lawyer', 'seb.vettal@lawyers.org');

INSERT INTO User (LastLogin, FirstName, LastName, UserRole, Email)
VALUES
('2025-05-15 11:30:00', 'Amin', 'Mohammed', 'AsylumSeeker', 'mohammed.amin@gmail.com'),
('2025-05-15 08:10:00', 'Frank', 'De Vries', 'Diplomat', 'frankdev@usa.gov'),
('2025-05-13 14:55:00', 'Jackie ', 'Stewart', 'Lawyer', 'stewart.j@mgm.com');


INSERT INTO Diplomat (UserID, Email, CountryID, Department)
VALUES
(2, 'Mark.Webber2@gmail.com',1, 'Transportation'),
(5, 'FrankDeVries@gmail.com',2, 'Agriculture');

INSERT INTO Lawyer (UserID, Nationality, PrefferedRegion, Specialization)
VALUES
(3,1,3,'Aid'),
(6,2,1,'Education');

INSERT INTO AsylumSeeker (UserID, DOB, SEX, CurrentLocation, Citizenship, AssignedLawyer, Religion)
VALUES
(1, '2001-05-01', 'Female', 2,1,1,3),
(4, '2003-04-14', 'Male', 1,2,2,1);

INSERT INtO EducationLevel (LevelID, LevelName)
VALUES
(1,'Primary'),
(2,'Secondary'),
(3,'Tertiary');

INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES
(1,1,'Primary',9,2,10000),
(2,2,'Secondary',6,1,2000);

INSERT INtO ApplicantGroup(GroupID, CountryID, AgeRange, Sex)
VALUES
(1,1,'14-17','Male'),
(2,2,'18-34','Female');

INSERT INTO Decision (DecisionID, DecidingCountry, ApplicantGroup, Total, DecisionType, DecisionYear)
VALUES
(1,1,1,1000, 'GENCONV','2021'),
(2,3,2,500, 'SUB_PROT','2001');

INSERT INTO FamilyMemeber(FamilyID, DOB, FirstName, LastName, Sex)
VALUES
(1, '2000-04-01', 'Amin', 'Mohammed', 'Male'),
(4, '1987-10-13', 'Elexa', 'Neukirch', 'Female');

INSERT INTO LegalAidApplication (ApplicantID, USerID, AidDescription, SubmissionDate)
VALUES
(1,1,'Applicaton aid', '2025-06-30'),
(2,2,'Sue for discrimination', '2024-07-21');

