-- Create the trigger
CREATE TRIGGER CW2.TrialInsertTrigger
ON CW2.Trails
AFTER INSERT
AS
BEGIN
    -- Insert a new log entry into the TrailLog table when a new trail is added
    DECLARE @TrailID INT, @UserID INT, @LogMessage NVARCHAR(MAX);
    
    -- Get the values of the inserted row
    SELECT @TrailID = trail_id, @UserID = created_by FROM inserted;
    
    -- Create a log message
    SET @LogMessage = 'New trail added with Trail ID: ' + CAST(@TrailID AS NVARCHAR) + ' by User ID: ' + CAST(@UserID AS NVARCHAR);
    
    -- Insert the log entry into the TrailLog table
    INSERT INTO CW2.TrailLog (trail_id, user_id, log_message)
    VALUES (@TrailID, @UserID, @LogMessage);
END;
