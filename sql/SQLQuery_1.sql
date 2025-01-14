
-- Create the Users table
CREATE TABLE CW2.Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    email_address NVARCHAR(100) NOT NULL,
    role NVARCHAR(50) NOT NULL
);

-- Create the Trails table
CREATE TABLE CW2.Trails (
    trail_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT,
    trail_name NVARCHAR(200) NOT NULL,
    difficulty NVARCHAR(50),
    length FLOAT,
    description NVARCHAR(MAX),
    created_at DATETIME DEFAULT GETDATE(),
    created_by INT,
    FOREIGN KEY (user_id) REFERENCES CW2.Users(user_id),
    FOREIGN KEY (created_by) REFERENCES CW2.Users(user_id)
);

-- Create the TrailLog table
CREATE TABLE CW2.TrailLog (
    log_id INT PRIMARY KEY IDENTITY(1,1),
    trail_id INT,
    user_id INT,
    log_date DATETIME DEFAULT GETDATE(),
    log_message NVARCHAR(MAX),
    FOREIGN KEY (trail_id) REFERENCES CW2.Trails(trail_id),
    FOREIGN KEY (user_id) REFERENCES CW2.Users(user_id)
);

-- Create the TrailFeatures table
CREATE TABLE CW2.TrailFeatures (
    feature_id INT PRIMARY KEY IDENTITY(1,1),
    trail_id INT,
    feature NVARCHAR(200),
    FOREIGN KEY (trail_id) REFERENCES CW2.Trails(trail_id)
);

