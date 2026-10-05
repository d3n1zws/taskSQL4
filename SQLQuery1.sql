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