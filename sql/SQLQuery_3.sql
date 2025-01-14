-- Create the procedure
CREATE PROCEDURE CW2.UpdateTrail
    @TrailID INT,
    @TrailName NVARCHAR(200),
    @Difficulty NVARCHAR(50),
    @Length FLOAT,
    @Description NVARCHAR(MAX)
AS
BEGIN
    UPDATE CW2.Trails
    SET 
        trail_name = @TrailName,
        difficulty = @Difficulty,
        length = @Length,
        description = @Description
    WHERE trail_id = @TrailID;
END;
