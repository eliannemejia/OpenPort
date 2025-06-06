USE openport_database

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
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 28, 'Primary', 11, 128, 1028);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 28, 'Secondary', 12, 128, 2028);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 28, 'Tertiary', 13, 128, 3028);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 29, 'Primary', 11, 129, 1029);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 29, 'Secondary', 12, 129, 2029);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 29, 'Tertiary', 13, 129, 3029);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 30, 'Primary', 11, 130, 1030);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 30, 'Secondary', 12, 130, 2030);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 30, 'Tertiary', 13, 130, 3030);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 31, 'Primary', 11, 131, 1031);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 31, 'Secondary', 12, 131, 2031);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 31, 'Tertiary', 13, 131, 3031);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 32, 'Primary', 11, 132, 1032);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 32, 'Secondary', 12, 132, 2032);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 32, 'Tertiary', 13, 132, 3032);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 33, 'Primary', 11, 133, 1033);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 33, 'Secondary', 12, 133, 2033);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 33, 'Tertiary', 13, 133, 3033);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 34, 'Primary', 11, 134, 1034);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 34, 'Secondary', 12, 134, 2034);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 34, 'Tertiary', 13, 134, 3034);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 35, 'Primary', 11, 135, 1035);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 35, 'Secondary', 12, 135, 2035);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 35, 'Tertiary', 13, 135, 3035);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 36, 'Primary', 11, 136, 1036);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 36, 'Secondary', 12, 136, 2036);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 36, 'Tertiary', 13, 136, 3036);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 37, 'Primary', 11, 137, 1037);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 37, 'Secondary', 12, 137, 2037);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 37, 'Tertiary', 13, 137, 3037);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 38, 'Primary', 11, 138, 1038);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 38, 'Secondary', 12, 138, 2038);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 38, 'Tertiary', 13, 138, 3038);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 39, 'Primary', 11, 139, 1039);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 39, 'Secondary', 12, 139, 2039);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 39, 'Tertiary', 13, 139, 3039);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 40, 'Primary', 11, 140, 1040);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 40, 'Secondary', 12, 140, 2040);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 40, 'Tertiary', 13, 140, 3040);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 41, 'Primary', 11, 141, 1041);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 41, 'Secondary', 12, 141, 2041);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 41, 'Tertiary', 13, 141, 3041);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 42, 'Primary', 11, 142, 1042);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 42, 'Secondary', 12, 142, 2042);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 42, 'Tertiary', 13, 142, 3042);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 43, 'Primary', 11, 143, 1043);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 43, 'Secondary', 12, 143, 2043);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 43, 'Tertiary', 13, 143, 3043);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 44, 'Primary', 11, 144, 1044);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 44, 'Secondary', 12, 144, 2044);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 44, 'Tertiary', 13, 144, 3044);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 45, 'Primary', 11, 145, 1045);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 45, 'Secondary', 12, 145, 2045);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 45, 'Tertiary', 13, 145, 3045);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 46, 'Primary', 11, 146, 1046);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 46, 'Secondary', 12, 146, 2046);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 46, 'Tertiary', 13, 146, 3046);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 47, 'Primary', 11, 147, 1047);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 47, 'Secondary', 12, 147, 2047);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 47, 'Tertiary', 13, 147, 3047);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 48, 'Primary', 11, 148, 1048);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 48, 'Secondary', 12, 148, 2048);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 48, 'Tertiary', 13, 148, 3048);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 49, 'Primary', 11, 149, 1049);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 49, 'Secondary', 12, 149, 2049);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 49, 'Tertiary', 13, 149, 3049);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 50, 'Primary', 11, 150, 1050);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 50, 'Secondary', 12, 150, 2050);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 50, 'Tertiary', 13, 150, 3050);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 51, 'Primary', 11, 151, 1051);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 51, 'Secondary', 12, 151, 2051);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 51, 'Tertiary', 13, 151, 3051);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 52, 'Primary', 11, 152, 1052);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 52, 'Secondary', 12, 152, 2052);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 52, 'Tertiary', 13, 152, 3052);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 53, 'Primary', 11, 153, 1053);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 53, 'Secondary', 12, 153, 2053);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 53, 'Tertiary', 13, 153, 3053);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 54, 'Primary', 11, 154, 1054);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 54, 'Secondary', 12, 154, 2054);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 54, 'Tertiary', 13, 154, 3054);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 55, 'Primary', 11, 155, 1055);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 55, 'Secondary', 12, 155, 2055);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 55, 'Tertiary', 13, 155, 3055);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 56, 'Primary', 11, 156, 1056);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 56, 'Secondary', 12, 156, 2056);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 56, 'Tertiary', 13, 156, 3056);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 57, 'Primary', 11, 157, 1057);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 57, 'Secondary', 12, 157, 2057);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 57, 'Tertiary', 13, 157, 3057);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 58, 'Primary', 11, 158, 1058);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 58, 'Secondary', 12, 158, 2058);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 58, 'Tertiary', 13, 158, 3058);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 59, 'Primary', 11, 159, 1059);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 59, 'Secondary', 12, 159, 2059);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 59, 'Tertiary', 13, 159, 3059);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 60, 'Primary', 11, 160, 1060);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 60, 'Secondary', 12, 160, 2060);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 60, 'Tertiary', 13, 160, 3060);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 61, 'Primary', 11, 161, 1061);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 61, 'Secondary', 12, 161, 2061);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 61, 'Tertiary', 13, 161, 3061);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 62, 'Primary', 11, 162, 1062);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 62, 'Secondary', 12, 162, 2062);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 62, 'Tertiary', 13, 162, 3062);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 63, 'Primary', 11, 163, 1063);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 63, 'Secondary', 12, 163, 2063);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 63, 'Tertiary', 13, 163, 3063);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 64, 'Primary', 11, 164, 1064);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 64, 'Secondary', 12, 164, 2064);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 64, 'Tertiary', 13, 164, 3064);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 65, 'Primary', 11, 165, 1065);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 65, 'Secondary', 12, 165, 2065);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 65, 'Tertiary', 13, 165, 3065);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 66, 'Primary', 11, 166, 1066);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 66, 'Secondary', 12, 166, 2066);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 66, 'Tertiary', 13, 166, 3066);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 67, 'Primary', 11, 167, 1067);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 67, 'Secondary', 12, 167, 2067);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 67, 'Tertiary', 13, 167, 3067);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 68, 'Primary', 11, 168, 1068);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 68, 'Secondary', 12, 168, 2068);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 68, 'Tertiary', 13, 168, 3068);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 69, 'Primary', 11, 169, 1069);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 69, 'Secondary', 12, 169, 2069);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 69, 'Tertiary', 13, 169, 3069);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 70, 'Primary', 11, 170, 1070);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 70, 'Secondary', 12, 170, 2070);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 70, 'Tertiary', 13, 170, 3070);
