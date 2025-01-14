
-- Create the procedure
CREATE PROCEDURE CW2.GetTrailByID
    @TrailID INT
AS
BEGIN
    SELECT * FROM CW2.Trails WHERE trail_id = @TrailID;
END;
