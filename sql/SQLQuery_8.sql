 -- 1. Display the current state of the tables (Before Insertion)

-- Show the Users table before insertion
SELECT * FROM CW2.Users;

-- Show the Trails table before insertion
SELECT * FROM CW2.Trails;

-- Show the TrailLog table before insertion (it should be empty initially if it's been set up correctly)
SELECT * FROM CW2.TrailLog;

-- Insert sample data into the CW2.Users table
-- Insert sample data into the CW2.Users table (without specifying user_id)
INSERT INTO CW2.Users (email_address, role)
VALUES
    ('grace@plymouth.ac.uk', 'User'),
    ('tim@plymouth.ac.uk', 'Admin'),
    ('ada@plymouth.ac.uk', 'User');

-- Insert sample data into the CW2.Trails table and include the created_by column
INSERT INTO CW2.Trails (trail_name, description, difficulty, length, user_id, created_by)
VALUES
    ('Plymbridge Circular', 'Gentle circular walk through ancient oak woodlands with views of River Plym. Suitable for dog walking.', 'Easy', 4.6, 1, 1),
    ('Mount Edgcumbe Circular', 'Moderate loop trail with coastal views, pasture, and formal gardens. Features an ancient holy well.', 'Moderate', 7.2, 2, 2),
    ('Down Thomas and Wembury Circular', 'Challenging circular trail with coast views and forest paths near Wembury.', 'Moderate', 10, 2, 2),
    ('Plymbridge Old Canal and River Walk', 'Easy loop along the River Plym with a viewing point for peregrine falcons.', 'Easy', 2.7, 3, 3);

-- 3. Display the tables after insertion (to show the changes)

-- Show the Users table after insertion
SELECT * FROM CW2.Users;

-- Show the Trails table after insertion
SELECT * FROM CW2.Trails;

-- Show the TrailLog table after insertion (this should now show entries if the trigger is correctly logging trail additions)
SELECT * FROM CW2.TrailLog;
