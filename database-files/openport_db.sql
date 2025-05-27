DROP DATABASE IF EXISTS openport_database;
CREATE DATABASE IF NOT EXISTS openport_database;

USE openport_database;

CREATE TABLE IF NOT EXISTS Country (
  CountryID int  PRIMARY KEY,
  CountryName VARCHAR(50)
  );

CREATE TABLE IF NOT EXISTS Religion(
  ReligionID int PRIMARY KEY,
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
  OpportunityID int PRIMARY KEY,
  CountryID int,
  Demand int,
  Describe VarChar(300);
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID)
);

CREATE TABLE IF NOT EXISTS Spending (
  CountryID int PRIMARY KEY,
  PercentGDP DECIMAL(5,2),
  SpendingYear YEAR,
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID)
);

CREATE TABLE IF NOT EXISTS User (
  UserID int PRIMARY KEY,
  Username VARCHAR(50),
  LastLogin DATETIME,
  FirstName VARCHAR(50),
  LastName VarChar(50),
  UserRole VarChar(50)
);

CREATE TABLE IF NOT EXISTS Diplomat(
  DiplomatID int PRIMARY KEY,
  UserID int,
  Email VARCHAR(100);
  CountryID int,
  Department VarChar(50),
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID),
  FOREIGN KEY (UserID) REFERENCES User (userID)
);

CREATE TABLE IF NOT EXISTS Lawyer (
  LawyerID int PRIMARY KEY,
  UserID int,
  Nationality int,
  PrefferedRegion int,
  Specialization VarChar(100),
  FOREIGN KEY (Nationality) REFERENCES Country (CountryID),
  FOREIGN KEY (USerID) REFERENCES User (UserID)
);

CREATE TABLE IF NOT EXISTS AsylumSeeker (
  ApplicantID int PRIMARY KEY,
  UserID int,
  DOB DATE,
  SEX VarChar(1),
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
  EducationName VarChar(100);
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
  GroupID int PRIMARY KEY,
  CountryID int,
  AgeRange VARCHAR(10), /*has to be a better way to save this b/c it will be hard to query. 
  maybe add a min and max age for age groups?*/
  Sex VARCHAR(1),
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID) 
);

CREATE TABLE IF NOT EXISTS Decision (
  DecisionID int,
  DecidingCountry int,
  ApplicantGroup int,
  Total int, 
  DecisionType VARCHAR(1), /*maybe set a binary for this one?*/
  DecisionYear YEAR,
  FOREIGN KEY (DecidingCountry) REFERENCES Country (CountryID),
  FOREIGN KEY (ApplicantGroup) REFERENCES ApplicantGroup (GroupID),
  PRIMARY KEY (DecisionID, CountryID, ApplicantGroup)
);

INSERT INTO Country (CountryID, CountryName) VALUES 
(1,'Belgium'),
(2, 'Bulgaria'), 
(3,'Czechia');

INSERT Into Religion (ReligionID, ReligionName)
VALUES
(1,'Buddhism'),
(2,'Hellenism'),
(3,'Shinto');

INSERT INTO CountryReligion (ReligionID, CountryID, TotalPracticing, AcceptanceScore)
VALUES 
(1,1,100,8),
(1,2,150,9),
(2,3,1101,6),
(3,3, 123, 7);

INSERT INTO ProBonoOpportunity (OpportunityID, CountryID, Demand, Describe)
VALUES
(1,1,9, 'Helping an asylum seeker prepare their application and supporting documents.'),
(2,2,9, 'Educating asylum seekers about their legal rights'),
(3,3,9, 'Assisting with paperwork like appeals, affidavits, or ID applications.');

INSERT INTO Spending (CountryID, PercentGDP, SpendingYear)
VALUES
(1,45.67, 2024),
(2,13.14,2001),
(3,72.30,2022);

INSERT INTO User (UserID, Username, LastLogin, FirstName, LastName, UserRole)
VALUES
(1, 'PositiveRefugee', '2025-05-15 10:30:00', 'Layla', 'Hassan', 'AsylumSeeker'),
(2, 'EUDiplomatMark', '2025-05-15 09:15:00', 'Mark', 'Weber', 'Diplomat'),
(3, 'JusticeForAll', '2025-05-14 17:45:00', 'Sebastian', 'Vettel', 'Lawyer');
(4, 'HopeSeeker22', '2025-05-15 11:30:00', 'Amir', 'Mohammed', 'Asylum Seeker'),
(5, 'DiplomatFrank', '2025-05-15 08:10:00', 'Frank', 'De Vries', 'Diplomat');
(6, 'LegalAidNow', '2025-05-13 14:55:00', 'Jackie ', 'Stewart', 'Lawyer');


INSERT INTO Diplomat (DiplomatID, UserID, Email, CountryID, Department)
VALUES
(1, 2, 'Mark.Webber2@gmail.com',1, 'Transportation'),
(2, 5, 'FrankDeVries@gmail.com',2, 'Agriculture');

INSERT INTO AsylumSeeker (ApplicantID, UserID, DOB, SEX, CurrentLocation, Citizenship, AssignedLawyer, Religion)
VALUES
(1, 1, '2001-05-01', 'F', 2,1,1,3),
(2, 4, '2003-04-14', 'M', 1,2,2,1);

INSERT INTO Lawyer (LawyerID, UserID, Nationality, PrefferedRegion, Specialization)
VALUES
(1,3,1,3,'Aid'),
(1,6,2,1,'Education');

INSERT INTO Education (LevleID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES
(1,1,'Higher',9,2,10000),
(2,2,'Post Grad',6,1,2000);

INSERT INtO EducationLevel (LevelID, EducationName)
VALUES
(1,'Higher'),
(2,"Post Grad");

INSERT INTO Decision (DecisionID, DecidingCountry, ApplicantGroup, Total, DecisionType, DecisionYear)
VALUES
(1,1,1,1000, 'Geneva Convention Status','2021'),
(2,3,2,500, 'Subsidiary Protection Status','2001');

INSERT INtO ApplicantGroup(GroupID, CountryID, AgeRange, Sex)
VALUES
(1,1,'18-25','M'),
(2,2,'26-32','F');
