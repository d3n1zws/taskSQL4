USE task6


ALTER TABLE Users
ADD IsDeleted BIT DEFAULT 0

CREATE TRIGGER soft_delete_for_users
ON Users
INSTEAD OF DELETE
AS

DECLARE @is_deleted BIT
DECLARE @id INT
SET @is_deleted = (SELECT IsDeleted FROM DELETED)
SET @id = (SELECT Id FROM DELETED)

if (@is_deleted = 0)
BEGIN
	UPDATE Users SET IsDeleted = 1 WHERE @id = Id
END
else
BEGIN
	DELETE FROM Users WHERE @id = Id
END


DELETE FROM Users WHERE Id = 7


