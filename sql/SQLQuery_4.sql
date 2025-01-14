-- Create the procedure
CREATE PROCEDURE CW2.DeleteTrail
    @TrailID INT
AS
BEGIN
    DELETE FROM CW2.Trails WHERE trail_id = @TrailID;
END;
