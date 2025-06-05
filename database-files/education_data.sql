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
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 71, 'Primary', 11, 171, 1071);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 71, 'Secondary', 12, 171, 2071);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 71, 'Tertiary', 13, 171, 3071);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 72, 'Primary', 11, 172, 1072);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 72, 'Secondary', 12, 172, 2072);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 72, 'Tertiary', 13, 172, 3072);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 73, 'Primary', 11, 173, 1073);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 73, 'Secondary', 12, 173, 2073);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 73, 'Tertiary', 13, 173, 3073);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 74, 'Primary', 11, 174, 1074);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 74, 'Secondary', 12, 174, 2074);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 74, 'Tertiary', 13, 174, 3074);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 75, 'Primary', 11, 175, 1075);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 75, 'Secondary', 12, 175, 2075);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 75, 'Tertiary', 13, 175, 3075);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 76, 'Primary', 11, 176, 1076);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 76, 'Secondary', 12, 176, 2076);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 76, 'Tertiary', 13, 176, 3076);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 77, 'Primary', 11, 177, 1077);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 77, 'Secondary', 12, 177, 2077);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 77, 'Tertiary', 13, 177, 3077);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 78, 'Primary', 11, 178, 1078);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 78, 'Secondary', 12, 178, 2078);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 78, 'Tertiary', 13, 178, 3078);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 79, 'Primary', 11, 179, 1079);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 79, 'Secondary', 12, 179, 2079);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 79, 'Tertiary', 13, 179, 3079);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 80, 'Primary', 11, 180, 1080);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 80, 'Secondary', 12, 180, 2080);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 80, 'Tertiary', 13, 180, 3080);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 81, 'Primary', 11, 181, 1081);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 81, 'Secondary', 12, 181, 2081);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 81, 'Tertiary', 13, 181, 3081);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 82, 'Primary', 11, 182, 1082);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 82, 'Secondary', 12, 182, 2082);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 82, 'Tertiary', 13, 182, 3082);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 83, 'Primary', 11, 183, 1083);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 83, 'Secondary', 12, 183, 2083);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 83, 'Tertiary', 13, 183, 3083);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 84, 'Primary', 11, 184, 1084);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 84, 'Secondary', 12, 184, 2084);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 84, 'Tertiary', 13, 184, 3084);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 85, 'Primary', 11, 185, 1085);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 85, 'Secondary', 12, 185, 2085);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 85, 'Tertiary', 13, 185, 3085);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 86, 'Primary', 11, 186, 1086);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 86, 'Secondary', 12, 186, 2086);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 86, 'Tertiary', 13, 186, 3086);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 87, 'Primary', 11, 187, 1087);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 87, 'Secondary', 12, 187, 2087);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 87, 'Tertiary', 13, 187, 3087);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 88, 'Primary', 11, 188, 1088);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 88, 'Secondary', 12, 188, 2088);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 88, 'Tertiary', 13, 188, 3088);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 89, 'Primary', 11, 189, 1089);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 89, 'Secondary', 12, 189, 2089);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 89, 'Tertiary', 13, 189, 3089);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 90, 'Primary', 11, 190, 1090);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 90, 'Secondary', 12, 190, 2090);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 90, 'Tertiary', 13, 190, 3090);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 91, 'Primary', 11, 191, 1091);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 91, 'Secondary', 12, 191, 2091);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 91, 'Tertiary', 13, 191, 3091);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 92, 'Primary', 11, 192, 1092);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 92, 'Secondary', 12, 192, 2092);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 92, 'Tertiary', 13, 192, 3092);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 93, 'Primary', 11, 193, 1093);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 93, 'Secondary', 12, 193, 2093);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 93, 'Tertiary', 13, 193, 3093);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 94, 'Primary', 11, 194, 1094);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 94, 'Secondary', 12, 194, 2094);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 94, 'Tertiary', 13, 194, 3094);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 95, 'Primary', 11, 195, 1095);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 95, 'Secondary', 12, 195, 2095);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 95, 'Tertiary', 13, 195, 3095);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 96, 'Primary', 11, 196, 1096);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 96, 'Secondary', 12, 196, 2096);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 96, 'Tertiary', 13, 196, 3096);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 97, 'Primary', 11, 197, 1097);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 97, 'Secondary', 12, 197, 2097);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 97, 'Tertiary', 13, 197, 3097);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 98, 'Primary', 11, 198, 1098);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 98, 'Secondary', 12, 198, 2098);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 98, 'Tertiary', 13, 198, 3098);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 99, 'Primary', 11, 199, 1099);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 99, 'Secondary', 12, 199, 2099);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 99, 'Tertiary', 13, 199, 3099);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 100, 'Primary', 11, 200, 1100);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 100, 'Secondary', 12, 200, 2100);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 100, 'Tertiary', 13, 200, 3100);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 101, 'Primary', 11, 201, 1101);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 101, 'Secondary', 12, 201, 2101);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 101, 'Tertiary', 13, 201, 3101);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 102, 'Primary', 11, 202, 1102);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 102, 'Secondary', 12, 202, 2102);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 102, 'Tertiary', 13, 202, 3102);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 103, 'Primary', 11, 203, 1103);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 103, 'Secondary', 12, 203, 2103);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 103, 'Tertiary', 13, 203, 3103);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 104, 'Primary', 11, 204, 1104);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 104, 'Secondary', 12, 204, 2104);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 104, 'Tertiary', 13, 204, 3104);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 105, 'Primary', 11, 205, 1105);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 105, 'Secondary', 12, 205, 2105);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 105, 'Tertiary', 13, 205, 3105);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 106, 'Primary', 11, 206, 1106);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 106, 'Secondary', 12, 206, 2106);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 106, 'Tertiary', 13, 206, 3106);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 107, 'Primary', 11, 207, 1107);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 107, 'Secondary', 12, 207, 2107);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 107, 'Tertiary', 13, 207, 3107);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 108, 'Primary', 11, 208, 1108);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 108, 'Secondary', 12, 208, 2108);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 108, 'Tertiary', 13, 208, 3108);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 109, 'Primary', 11, 209, 1109);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 109, 'Secondary', 12, 209, 2109);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 109, 'Tertiary', 13, 209, 3109);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 110, 'Primary', 11, 210, 1110);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 110, 'Secondary', 12, 210, 2110);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 110, 'Tertiary', 13, 210, 3110);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 111, 'Primary', 11, 211, 1111);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 111, 'Secondary', 12, 211, 2111);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 111, 'Tertiary', 13, 211, 3111);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 112, 'Primary', 11, 212, 1112);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 112, 'Secondary', 12, 212, 2112);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 112, 'Tertiary', 13, 212, 3112);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 113, 'Primary', 11, 213, 1113);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 113, 'Secondary', 12, 213, 2113);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 113, 'Tertiary', 13, 213, 3113);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 114, 'Primary', 11, 214, 1114);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 114, 'Secondary', 12, 214, 2114);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 114, 'Tertiary', 13, 214, 3114);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 115, 'Primary', 11, 215, 1115);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 115, 'Secondary', 12, 215, 2115);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 115, 'Tertiary', 13, 215, 3115);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 116, 'Primary', 11, 216, 1116);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 116, 'Secondary', 12, 216, 2116);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 116, 'Tertiary', 13, 216, 3116);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 117, 'Primary', 11, 217, 1117);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 117, 'Secondary', 12, 217, 2117);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 117, 'Tertiary', 13, 217, 3117);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 118, 'Primary', 11, 218, 1118);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 118, 'Secondary', 12, 218, 2118);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 118, 'Tertiary', 13, 218, 3118);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 119, 'Primary', 11, 219, 1119);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 119, 'Secondary', 12, 219, 2119);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 119, 'Tertiary', 13, 219, 3119);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 120, 'Primary', 11, 220, 1120);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 120, 'Secondary', 12, 220, 2120);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 120, 'Tertiary', 13, 220, 3120);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 121, 'Primary', 11, 221, 1121);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 121, 'Secondary', 12, 221, 2121);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 121, 'Tertiary', 13, 221, 3121);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 122, 'Primary', 11, 222, 1122);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 122, 'Secondary', 12, 222, 2122);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 122, 'Tertiary', 13, 222, 3122);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 123, 'Primary', 11, 223, 1123);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 123, 'Secondary', 12, 223, 2123);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 123, 'Tertiary', 13, 223, 3123);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 124, 'Primary', 11, 224, 1124);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 124, 'Secondary', 12, 224, 2124);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 124, 'Tertiary', 13, 224, 3124);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 125, 'Primary', 11, 225, 1125);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 125, 'Secondary', 12, 225, 2125);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 125, 'Tertiary', 13, 225, 3125);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 126, 'Primary', 11, 226, 1126);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 126, 'Secondary', 12, 226, 2126);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 126, 'Tertiary', 13, 226, 3126);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 127, 'Primary', 11, 227, 1127);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 127, 'Secondary', 12, 227, 2127);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 127, 'Tertiary', 13, 227, 3127);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 128, 'Primary', 11, 228, 1128);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 128, 'Secondary', 12, 228, 2128);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 128, 'Tertiary', 13, 228, 3128);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 129, 'Primary', 11, 229, 1129);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 129, 'Secondary', 12, 229, 2129);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 129, 'Tertiary', 13, 229, 3129);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 130, 'Primary', 11, 230, 1130);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 130, 'Secondary', 12, 230, 2130);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 130, 'Tertiary', 13, 230, 3130);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 131, 'Primary', 11, 231, 1131);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 131, 'Secondary', 12, 231, 2131);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 131, 'Tertiary', 13, 231, 3131);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 132, 'Primary', 11, 232, 1132);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 132, 'Secondary', 12, 232, 2132);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 132, 'Tertiary', 13, 232, 3132);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 133, 'Primary', 11, 233, 1133);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 133, 'Secondary', 12, 233, 2133);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 133, 'Tertiary', 13, 233, 3133);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 134, 'Primary', 11, 234, 1134);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 134, 'Secondary', 12, 234, 2134);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 134, 'Tertiary', 13, 234, 3134);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 135, 'Primary', 11, 235, 1135);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 135, 'Secondary', 12, 235, 2135);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 135, 'Tertiary', 13, 235, 3135);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 136, 'Primary', 11, 236, 1136);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 136, 'Secondary', 12, 236, 2136);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 136, 'Tertiary', 13, 236, 3136);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 137, 'Primary', 11, 237, 1137);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 137, 'Secondary', 12, 237, 2137);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 137, 'Tertiary', 13, 237, 3137);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 138, 'Primary', 11, 238, 1138);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 138, 'Secondary', 12, 238, 2138);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 138, 'Tertiary', 13, 238, 3138);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 139, 'Primary', 11, 239, 1139);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 139, 'Secondary', 12, 239, 2139);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 139, 'Tertiary', 13, 239, 3139);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 140, 'Primary', 11, 240, 1140);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 140, 'Secondary', 12, 240, 2140);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 140, 'Tertiary', 13, 240, 3140);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 141, 'Primary', 11, 241, 1141);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 141, 'Secondary', 12, 241, 2141);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 141, 'Tertiary', 13, 241, 3141);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 142, 'Primary', 11, 242, 1142);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 142, 'Secondary', 12, 242, 2142);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 142, 'Tertiary', 13, 242, 3142);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 143, 'Primary', 11, 243, 1143);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 143, 'Secondary', 12, 243, 2143);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 143, 'Tertiary', 13, 243, 3143);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 144, 'Primary', 11, 244, 1144);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 144, 'Secondary', 12, 244, 2144);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 144, 'Tertiary', 13, 244, 3144);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 145, 'Primary', 11, 245, 1145);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 145, 'Secondary', 12, 245, 2145);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 145, 'Tertiary', 13, 245, 3145);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 146, 'Primary', 11, 246, 1146);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 146, 'Secondary', 12, 246, 2146);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 146, 'Tertiary', 13, 246, 3146);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 147, 'Primary', 11, 247, 1147);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 147, 'Secondary', 12, 247, 2147);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 147, 'Tertiary', 13, 247, 3147);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 148, 'Primary', 11, 248, 1148);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 148, 'Secondary', 12, 248, 2148);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 148, 'Tertiary', 13, 248, 3148);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 149, 'Primary', 11, 249, 1149);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 149, 'Secondary', 12, 249, 2149);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 149, 'Tertiary', 13, 249, 3149);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 150, 'Primary', 11, 250, 1150);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 150, 'Secondary', 12, 250, 2150);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 150, 'Tertiary', 13, 250, 3150);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 151, 'Primary', 11, 251, 1151);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 151, 'Secondary', 12, 251, 2151);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 151, 'Tertiary', 13, 251, 3151);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 152, 'Primary', 11, 252, 1152);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 152, 'Secondary', 12, 252, 2152);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 152, 'Tertiary', 13, 252, 3152);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 153, 'Primary', 11, 253, 1153);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 153, 'Secondary', 12, 253, 2153);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 153, 'Tertiary', 13, 253, 3153);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 154, 'Primary', 11, 254, 1154);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 154, 'Secondary', 12, 254, 2154);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 154, 'Tertiary', 13, 254, 3154);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 155, 'Primary', 11, 255, 1155);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 155, 'Secondary', 12, 255, 2155);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 155, 'Tertiary', 13, 255, 3155);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 156, 'Primary', 11, 256, 1156);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 156, 'Secondary', 12, 256, 2156);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 156, 'Tertiary', 13, 256, 3156);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 157, 'Primary', 11, 257, 1157);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 157, 'Secondary', 12, 257, 2157);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 157, 'Tertiary', 13, 257, 3157);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 158, 'Primary', 11, 258, 1158);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 158, 'Secondary', 12, 258, 2158);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 158, 'Tertiary', 13, 258, 3158);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 159, 'Primary', 11, 259, 1159);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 159, 'Secondary', 12, 259, 2159);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 159, 'Tertiary', 13, 259, 3159);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 160, 'Primary', 11, 260, 1160);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 160, 'Secondary', 12, 260, 2160);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 160, 'Tertiary', 13, 260, 3160);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 161, 'Primary', 11, 261, 1161);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 161, 'Secondary', 12, 261, 2161);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 161, 'Tertiary', 13, 261, 3161);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 162, 'Primary', 11, 262, 1162);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 162, 'Secondary', 12, 262, 2162);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 162, 'Tertiary', 13, 262, 3162);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 163, 'Primary', 11, 263, 1163);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 163, 'Secondary', 12, 263, 2163);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 163, 'Tertiary', 13, 263, 3163);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 164, 'Primary', 11, 264, 1164);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 164, 'Secondary', 12, 264, 2164);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 164, 'Tertiary', 13, 264, 3164);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 165, 'Primary', 11, 265, 1165);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 165, 'Secondary', 12, 265, 2165);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 165, 'Tertiary', 13, 265, 3165);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 166, 'Primary', 11, 266, 1166);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 166, 'Secondary', 12, 266, 2166);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 166, 'Tertiary', 13, 266, 3166);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 167, 'Primary', 11, 267, 1167);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 167, 'Secondary', 12, 267, 2167);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 167, 'Tertiary', 13, 267, 3167);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 168, 'Primary', 11, 268, 1168);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 168, 'Secondary', 12, 268, 2168);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 168, 'Tertiary', 13, 268, 3168);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 169, 'Primary', 11, 269, 1169);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 169, 'Secondary', 12, 269, 2169);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 169, 'Tertiary', 13, 269, 3169);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 170, 'Primary', 11, 270, 1170);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 170, 'Secondary', 12, 270, 2170);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 170, 'Tertiary', 13, 270, 3170);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 171, 'Primary', 11, 271, 1171);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 171, 'Secondary', 12, 271, 2171);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 171, 'Tertiary', 13, 271, 3171);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 172, 'Primary', 11, 272, 1172);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 172, 'Secondary', 12, 272, 2172);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 172, 'Tertiary', 13, 272, 3172);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 173, 'Primary', 11, 273, 1173);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 173, 'Secondary', 12, 273, 2173);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 173, 'Tertiary', 13, 273, 3173);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 174, 'Primary', 11, 274, 1174);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 174, 'Secondary', 12, 274, 2174);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 174, 'Tertiary', 13, 274, 3174);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 175, 'Primary', 11, 275, 1175);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 175, 'Secondary', 12, 275, 2175);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 175, 'Tertiary', 13, 275, 3175);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 176, 'Primary', 11, 276, 1176);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 176, 'Secondary', 12, 276, 2176);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 176, 'Tertiary', 13, 276, 3176);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 177, 'Primary', 11, 277, 1177);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 177, 'Secondary', 12, 277, 2177);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 177, 'Tertiary', 13, 277, 3177);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 178, 'Primary', 11, 278, 1178);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 178, 'Secondary', 12, 278, 2178);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 178, 'Tertiary', 13, 278, 3178);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 179, 'Primary', 11, 279, 1179);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 179, 'Secondary', 12, 279, 2179);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 179, 'Tertiary', 13, 279, 3179);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 180, 'Primary', 11, 280, 1180);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 180, 'Secondary', 12, 280, 2180);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 180, 'Tertiary', 13, 280, 3180);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 181, 'Primary', 11, 281, 1181);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 181, 'Secondary', 12, 281, 2181);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 181, 'Tertiary', 13, 281, 3181);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 182, 'Primary', 11, 282, 1182);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 182, 'Secondary', 12, 282, 2182);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 182, 'Tertiary', 13, 282, 3182);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 183, 'Primary', 11, 283, 1183);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 183, 'Secondary', 12, 283, 2183);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 183, 'Tertiary', 13, 283, 3183);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 184, 'Primary', 11, 284, 1184);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 184, 'Secondary', 12, 284, 2184);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 184, 'Tertiary', 13, 284, 3184);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 185, 'Primary', 11, 285, 1185);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 185, 'Secondary', 12, 285, 2185);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 185, 'Tertiary', 13, 285, 3185);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 186, 'Primary', 11, 286, 1186);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 186, 'Secondary', 12, 286, 2186);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 186, 'Tertiary', 13, 286, 3186);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 187, 'Primary', 11, 287, 1187);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 187, 'Secondary', 12, 287, 2187);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 187, 'Tertiary', 13, 287, 3187);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 188, 'Primary', 11, 288, 1188);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 188, 'Secondary', 12, 288, 2188);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 188, 'Tertiary', 13, 288, 3188);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 189, 'Primary', 11, 289, 1189);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 189, 'Secondary', 12, 289, 2189);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 189, 'Tertiary', 13, 289, 3189);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 190, 'Primary', 11, 290, 1190);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 190, 'Secondary', 12, 290, 2190);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 190, 'Tertiary', 13, 290, 3190);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 191, 'Primary', 11, 291, 1191);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 191, 'Secondary', 12, 291, 2191);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 191, 'Tertiary', 13, 291, 3191);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 192, 'Primary', 11, 292, 1192);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 192, 'Secondary', 12, 292, 2192);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 192, 'Tertiary', 13, 292, 3192);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 193, 'Primary', 11, 293, 1193);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 193, 'Secondary', 12, 293, 2193);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 193, 'Tertiary', 13, 293, 3193);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 194, 'Primary', 11, 294, 1194);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 194, 'Secondary', 12, 294, 2194);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 194, 'Tertiary', 13, 294, 3194);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 195, 'Primary', 11, 295, 1195);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 195, 'Secondary', 12, 295, 2195);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 195, 'Tertiary', 13, 295, 3195);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 196, 'Primary', 11, 296, 1196);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 196, 'Secondary', 12, 296, 2196);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 196, 'Tertiary', 13, 296, 3196);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 197, 'Primary', 11, 297, 1197);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 197, 'Secondary', 12, 297, 2197);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 197, 'Tertiary', 13, 297, 3197);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 198, 'Primary', 11, 298, 1198);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 198, 'Secondary', 12, 298, 2198);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 198, 'Tertiary', 13, 298, 3198);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 199, 'Primary', 11, 299, 1199);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 199, 'Secondary', 12, 299, 2199);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 199, 'Tertiary', 13, 299, 3199);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 200, 'Primary', 11, 300, 1200);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 200, 'Secondary', 12, 300, 2200);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 200, 'Tertiary', 13, 300, 3200);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 201, 'Primary', 11, 301, 1201);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 201, 'Secondary', 12, 301, 2201);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 201, 'Tertiary', 13, 301, 3201);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 202, 'Primary', 11, 302, 1202);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 202, 'Secondary', 12, 302, 2202);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 202, 'Tertiary', 13, 302, 3202);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 203, 'Primary', 11, 303, 1203);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 203, 'Secondary', 12, 303, 2203);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 203, 'Tertiary', 13, 303, 3203);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 204, 'Primary', 11, 304, 1204);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 204, 'Secondary', 12, 304, 2204);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 204, 'Tertiary', 13, 304, 3204);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 205, 'Primary', 11, 305, 1205);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 205, 'Secondary', 12, 305, 2205);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 205, 'Tertiary', 13, 305, 3205);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 206, 'Primary', 11, 306, 1206);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 206, 'Secondary', 12, 306, 2206);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 206, 'Tertiary', 13, 306, 3206);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 207, 'Primary', 11, 307, 1207);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 207, 'Secondary', 12, 307, 2207);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 207, 'Tertiary', 13, 307, 3207);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 208, 'Primary', 11, 308, 1208);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 208, 'Secondary', 12, 308, 2208);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 208, 'Tertiary', 13, 308, 3208);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 209, 'Primary', 11, 309, 1209);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 209, 'Secondary', 12, 309, 2209);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 209, 'Tertiary', 13, 309, 3209);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 210, 'Primary', 11, 310, 1210);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 210, 'Secondary', 12, 310, 2210);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 210, 'Tertiary', 13, 310, 3210);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 211, 'Primary', 11, 311, 1211);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 211, 'Secondary', 12, 311, 2211);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 211, 'Tertiary', 13, 311, 3211);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 212, 'Primary', 11, 312, 1212);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 212, 'Secondary', 12, 312, 2212);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 212, 'Tertiary', 13, 312, 3212);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 213, 'Primary', 11, 313, 1213);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 213, 'Secondary', 12, 313, 2213);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 213, 'Tertiary', 13, 313, 3213);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 214, 'Primary', 11, 314, 1214);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 214, 'Secondary', 12, 314, 2214);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 214, 'Tertiary', 13, 314, 3214);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 215, 'Primary', 11, 315, 1215);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 215, 'Secondary', 12, 315, 2215);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 215, 'Tertiary', 13, 315, 3215);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 216, 'Primary', 11, 316, 1216);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 216, 'Secondary', 12, 316, 2216);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 216, 'Tertiary', 13, 316, 3216);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 217, 'Primary', 11, 317, 1217);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 217, 'Secondary', 12, 317, 2217);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 217, 'Tertiary', 13, 317, 3217);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 218, 'Primary', 11, 318, 1218);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 218, 'Secondary', 12, 318, 2218);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 218, 'Tertiary', 13, 318, 3218);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 219, 'Primary', 11, 319, 1219);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 219, 'Secondary', 12, 319, 2219);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 219, 'Tertiary', 13, 319, 3219);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 220, 'Primary', 11, 320, 1220);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 220, 'Secondary', 12, 320, 2220);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 220, 'Tertiary', 13, 320, 3220);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 221, 'Primary', 11, 321, 1221);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 221, 'Secondary', 12, 321, 2221);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 221, 'Tertiary', 13, 321, 3221);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (1, 222, 'Primary', 11, 322, 1222);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (2, 222, 'Secondary', 12, 322, 2222);
INSERT INTO Education (LevelID, CountryID, EducationType, AccessScore, Ranking, TotalStudents)
VALUES (3, 222, 'Tertiary', 13, 322, 3222);