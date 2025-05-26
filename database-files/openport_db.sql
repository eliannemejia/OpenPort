DROP DATABASE IF EXISTS openport_database;
CREATE DATABASE IF NOT EXISTS openport_database;

USE openport_database;

CREATE TABLE IF NOT EXISTS Country (
  CountryID int  PRIMARY KEY,
  CountryName VARCHAR(50)
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

CREATE TABLE IF NOT EXISTS Religion(
  ReligionID int PRIMARY KEY,
  Name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS ProBonoOpportunity (
  OpportunityID int PRIMARY KEY,
  CountryID int,
  Demand int,
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID)
);

CREATE TABLE IF NOT EXISTS Spending (
  CountryID int PRIMARY KEY,
  PercentGDP DECIMAL(5,2),
  aYear YEAR,
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID)
);

CREATE TABLE IF NOT EXISTS User (
  UserID int PRIMARY KEY,
  Username VARCHAR(50),
  LastLogin DATETIME,
  FirstName VARCHAR(50),
  LastName VarChar(50),
  Role VarChar(50)
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

CREATE TABLE IF NOT EXISTS AsylumSeeker (
  ApplicantID int PRIMARY KEY,
  UserID int,
  DOB DATE,
  SEX VarChar(1),
  CurrentLocation int,
  Citizenship ,
  AssignedLawyer int,
  Religion int,
  FOREIGN KEY (CurrentLocation) REFERENCES Country (CountryID),
  FOREIGN KEY (UserID) REFERENCES User (userID),
  FOREIGN KEY (AssignedLawyer) REFERENCES Lawyer (LawyerID),
  FOREIGN KEY (Religion) REFERENCES Religion (ReligionID)
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

CREATE TABLE IF NOT EXISTS Education (
  LevelID int,
  CountryID int,
  Type VARCHAR (50),
  AccessScore int,
  Ranking int,
  TotalStudents int,
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID),
  FOREIGN KEY (LevelID) REFERENCES EducationLevel (LevelID),
  PRIMARY KEY (CountryID, LevelID)
);

CREATE TABLE IF NOT EXISTS EducationLevel(
  LevelID int PRIMARY KEY,
  Name VarChar(100);
);

CREATE TABLE IF NOT EXISTS Decision (
  DecisionID int,
  DecidingCountry int,
  ApplicantGroup int,
  Count int, 
  Type VARCHAR(1), /*maybe set a binary for this one?*/
  aYear YEAR,
  FOREIGN KEY (DecidingCountry) REFERENCES Country (CountryID),
  FOREIGN KEY (ApplicantGroup) REFERENCES ApplicantGroup (GroupID),
  PRIMARY KEY (DecisionID, CountryID, ApplicantGroup)
);

CREATE TABLE IF NOT EXISTS ApplicantGroup(
  GroupID int PRIMARY KEY,
  CountryID int,
  AgeRange VARCHAR(10), /*has to be a better way to save this b/c it will be hard to query. 
  maybe add a min and max age for age groups?*/
  Sex VARCHAR(1),
  FOREIGN KEY (CountryID) REFERENCES Country (CountryID) 
);