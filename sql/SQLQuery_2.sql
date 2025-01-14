-- Create the procedure
CREATE PROCEDURE CW2.InsertTrail
    @UserID INT,
    @TrailName NVARCHAR(200),
    @Difficulty NVARCHAR(50),
    @Length FLOAT,
    @Description NVARCHAR(MAX),
    @OwnerID INT
AS
BEGIN
    INSERT INTO CW2.Trails (user_id, trail_name, difficulty, length, description, created_at, created_by)
    VALUES (@UserID, @TrailName, @Difficulty, @Length, @Description, GETDATE(), @OwnerID);
END;
