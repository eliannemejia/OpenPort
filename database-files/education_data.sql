USE openport_database;

DROP TABLE IF EXISTS EducationLevel;

DROP TABLE IF EXISTS Education;

CREATE TABLE IF NOT EXISTS EducationLevel(
  LevelID int AUTO_INCREMENT PRIMARY KEY,
  LevelName ENUM('Primary', 'Secondary', 'Tertiary')
);

INSERT INTO EducationLevel (LevelName)
VALUES
('Primary'),
('Secondary'),
('Tertiary');

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

INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 1, 'Primary', 11, 101, 1001);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 1, 'Secondary', 12, 101, 2001);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 1, 'Tertiary', 13, 101, 3001);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 2, 'Primary', 11, 102, 1002);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 2, 'Secondary', 12, 102, 2002);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 2, 'Tertiary', 13, 102, 3002);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 3, 'Primary', 11, 103, 1003);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 3, 'Secondary', 12, 103, 2003);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 3, 'Tertiary', 13, 103, 3003);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 4, 'Primary', 11, 104, 1004);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 4, 'Secondary', 12, 104, 2004);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 4, 'Tertiary', 13, 104, 3004);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 5, 'Primary', 11, 105, 1005);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 5, 'Secondary', 12, 105, 2005);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 5, 'Tertiary', 13, 105, 3005);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 6, 'Primary', 11, 106, 1006);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 6, 'Secondary', 12, 106, 2006);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 6, 'Tertiary', 13, 106, 3006);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 7, 'Primary', 11, 107, 1007);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 7, 'Secondary', 12, 107, 2007);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 7, 'Tertiary', 13, 107, 3007);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 8, 'Primary', 11, 108, 1008);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 8, 'Secondary', 12, 108, 2008);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 8, 'Tertiary', 13, 108, 3008);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 9, 'Primary', 11, 109, 1009);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 9, 'Secondary', 12, 109, 2009);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 9, 'Tertiary', 13, 109, 3009);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 10, 'Primary', 11, 110, 1010);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 10, 'Secondary', 12, 110, 2010);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 10, 'Tertiary', 13, 110, 3010);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 11, 'Primary', 11, 111, 1011);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 11, 'Secondary', 12, 111, 2011);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 11, 'Tertiary', 13, 111, 3011);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 12, 'Primary', 11, 112, 1012);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 12, 'Secondary', 12, 112, 2012);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 12, 'Tertiary', 13, 112, 3012);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 13, 'Primary', 11, 113, 1013);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 13, 'Secondary', 12, 113, 2013);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 13, 'Tertiary', 13, 113, 3013);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 14, 'Primary', 11, 114, 1014);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 14, 'Secondary', 12, 114, 2014);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 14, 'Tertiary', 13, 114, 3014);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 15, 'Primary', 11, 115, 1015);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 15, 'Secondary', 12, 115, 2015);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 15, 'Tertiary', 13, 115, 3015);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 16, 'Primary', 11, 116, 1016);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 16, 'Secondary', 12, 116, 2016);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 16, 'Tertiary', 13, 116, 3016);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 17, 'Primary', 11, 117, 1017);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 17, 'Secondary', 12, 117, 2017);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 17, 'Tertiary', 13, 117, 3017);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 18, 'Primary', 11, 118, 1018);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 18, 'Secondary', 12, 118, 2018);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 18, 'Tertiary', 13, 118, 3018);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 19, 'Primary', 11, 119, 1019);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 19, 'Secondary', 12, 119, 2019);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 19, 'Tertiary', 13, 119, 3019);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 20, 'Primary', 11, 120, 1020);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 20, 'Secondary', 12, 120, 2020);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 20, 'Tertiary', 13, 120, 3020);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 21, 'Primary', 11, 121, 1021);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 21, 'Secondary', 12, 121, 2021);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 21, 'Tertiary', 13, 121, 3021);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 22, 'Primary', 11, 122, 1022);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 22, 'Secondary', 12, 122, 2022);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 22, 'Tertiary', 13, 122, 3022);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 23, 'Primary', 11, 123, 1023);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 23, 'Secondary', 12, 123, 2023);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 23, 'Tertiary', 13, 123, 3023);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 24, 'Primary', 11, 124, 1024);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 24, 'Secondary', 12, 124, 2024);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 24, 'Tertiary', 13, 124, 3024);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 25, 'Primary', 11, 125, 1025);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 25, 'Secondary', 12, 125, 2025);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 25, 'Tertiary', 13, 125, 3025);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 26, 'Primary', 11, 126, 1026);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 26, 'Secondary', 12, 126, 2026);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 26, 'Tertiary', 13, 126, 3026);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 27, 'Primary', 11, 127, 1027);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 27, 'Secondary', 12, 127, 2027);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 27, 'Tertiary', 13, 127, 3027);