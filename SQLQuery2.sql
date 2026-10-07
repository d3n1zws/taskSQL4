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

