USE task6

ALTER VIEW vw_get_musics_by_id
AS
SELECT 
m.Name,
u.Id AS UserId
FROM Users AS u
JOIN Playlists AS p
ON p.UserId = u.Id
JOIN Musics as m
ON m.Id = p.MusicId


ALTER PROCEDURE usp_get_students_by_id @id INT
AS
SELECT [Name]
FROM vw_get_musics_by_id
WHERE UserId = @id

EXEC usp_get_students_by_id 8



CREATE FUNCTION capitalize(@word VARCHAR(30))
RETURNS NVARCHAR(50)
BEGIN
	SET @word = CONCAT(UPPER(LEFT(@word, 1)), LOWER(SUBSTRING(@word, 2, len(@word) - 1)))
	RETURN @word
END


ALTER PROCEDURE usp_create_music @name VARCHAR(30), @duration INT, @category_id INT, @artist_id INT
AS
SET @name = dbo.capitalize(@name)
INSERT INTO Musics (Name, Duration, CategoryId, ArtistId) VALUES(@name, @duration, @category_id, @artist_id)



EXEC usp_create_music 'name8', 235, 2, 5
