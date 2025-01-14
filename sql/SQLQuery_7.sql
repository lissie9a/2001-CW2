-- Drop the tables if they exist
IF OBJECT_ID('CW2.Trails', 'U') IS NOT NULL
    DROP TABLE CW2.Trails;

IF OBJECT_ID('CW2.Users', 'U') IS NOT NULL
    DROP TABLE CW2.Users;

IF OBJECT_ID('CW2.TrailLog', 'U') IS NOT NULL
    DROP TABLE CW2.TrailLog;

IF OBJECT_ID('CW2.TrailFeatures', 'U') IS NOT NULL
    DROP TABLE CW2.TrailFeatures;


-- DELETE STORED PROCEDURES 
-- Drop the procedure if it already exists
IF OBJECT_ID('CW2.InsertTrail', 'P') IS NOT NULL
    DROP PROCEDURE CW2.InsertTrail;

IF OBJECT_ID('CW2.UpdateTrail', 'P') IS NOT NULL
    DROP PROCEDURE CW2.UpdateTrail;

IF OBJECT_ID('CW2.DeleteTrail', 'P') IS NOT NULL
    DROP PROCEDURE CW2.DeleteTrail;

IF OBJECT_ID('CW2.GetTrailByID', 'P') IS NOT NULL
    DROP PROCEDURE CW2.GetTrailByID;

-- Drop the trigger if it exists
IF OBJECT_ID('CW2.TrialInsertTrigger', 'TR') IS NOT NULL
    DROP TRIGGER CW2.TrialInsertTrigger;