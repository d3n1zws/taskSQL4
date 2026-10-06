CREATE DATABASE task6


USE task6



CREATE TABLE Users(
[Name] VARCHAR(25) NOT NULL CHECK(len([Name]) > 2),
Surname VARCHAR(25) NOT NULL CHECK(len([Surname]) > 3),
Username VARCHAR(20) NOT NULL UNIQUE CHECK(len(Username) > 7),
[Password] VARCHAR(20) NOT NULL CHECK(len([Password]) > 7),
Gender VARCHAR(6) NOT NULL CHECK(Gender IN ('Male', 'Female', 'Others')),
Id INT PRIMARY KEY IDENTITY
)



CREATE TABLE Artists(
[Name] VARCHAR(25) NOT NULL CHECK(len([Name]) > 2),
Surname VARCHAR(25) NOT NULL CHECK(len([Surname]) > 3),
Birthday DATETIME2 NOT NULL CHECK(Birthday < SYSDATETIME()),
Gender VARCHAR(6) NOT NULL CHECK(Gender IN ('Male', 'Female', 'Others')),
Id INT PRIMARY KEY IDENTITY
)



CREATE TABLE Categories(
[Name] VARCHAR(25) NOT NULL UNIQUE CHECK(len([Name]) > 2),
Id INT PRIMARY KEY IDENTITY
)



CREATE TABLE Musics(
[Name] VARCHAR(25) NOT NULL UNIQUE CHECK(len([Name]) > 2),
Duration INT NOT NULL CHECK(Duration > 60),
Id INT PRIMARY KEY IDENTITY
)



CREATE TABLE Playlists(
MusicId INT REFERENCES Musics(Id),
UserId INT REFERENCES Users(Id),
PRIMARY KEY(MusicId, UserId)
)


CREATE VIEW PlaylistInfo
AS
SELECT 
u.Name AS UserName,
m.Name AS MusicName
FROM Users AS u
JOIN Playlists AS p
ON u.Id = p.UserId
JOIN Musics AS m
ON m.Id = p.MusicId


ALTER TABLE Musics
ADD CategoryId INT REFERENCES Categories(Id) DEFAULT 1

ALTER TABLE Musics
ADD ArtistId INT REFERENCES Artists(Id) NOT NULL DEFAULT 2


CREATE VIEW MusicInfo
AS
SELECT m.[Name],
a.[Name] AS ArtistName,
c.[Name] AS CategoryName
FROM Musics AS m
JOIN Artists AS a
ON a.Id = m.ArtistId
JOIN Categories AS c
ON c.Id = m.CategoryId


SELECT 
a.[Name] AS ArtistName,
COUNT(a.[Name]) AS MusicCount
FROM Musics AS m
JOIN Artists AS a
ON a.Id = m.ArtistId
GROUP BY a.Name
HAVING COUNT(m.[Name]) = 
    (SELECT MAX(MusicCount) FROM
        (SELECT COUNT(*) AS MusicCount
        FROM Musics
        GROUP BY ArtistId) AS x)




