CREATE TABLE Users (
    UserID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    UniversityID NVARCHAR(15) UNIQUE NOT NULL, -- Localizing identity (e.g., student matric number)
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Role NVARCHAR(10) NOT NULL CHECK (Role IN ('student', 'doctor', 'admin')), -- Role-Based Access Control
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    IsActive BIT DEFAULT 1
);
CREATE TABLE PatientProfile (
    -- PatientID is also the Foreign Key linking directly back to the Users table.
    PatientID UNIQUEIDENTIFIER PRIMARY KEY,
    FOREIGN KEY (PatientID) REFERENCES[dbo].[Users](UserID),
    
    DOB DATE NOT NULL,
    BloodType NVARCHAR(3),
    -- Stores complex data like emergency contacts as a JSON serialized string
    EmergencyContactJson NVARCHAR(MAX), 
    Allergies NVARCHAR(MAX)
);
CREATE TABLE Visit (
    VisitID UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    
    PatientID UNIQUEIDENTIFIER NOT NULL,
    -- Links the visit to the patient profile
    FOREIGN KEY (PatientID) REFERENCES PatientProfile(PatientID),

    DoctorID UNIQUEIDENTIFIER, -- The doctor assigned/seen (NULL until assigned)
    FOREIGN KEY (DoctorID) REFERENCES USERS(UserID), -- Links the doctor's ID back to the USERS table

    QueueToken NVARCHAR(10) UNIQUE NOT NULL, -- The short, trackable token shown to the student
    
    -- The core logic for the queue priority (CRITICAL for sorting)
    TriageStatus NVARCHAR(10) NOT NULL CHECK (TriageStatus IN ('urgent', 'routine', 'emergency')), 
    Status NVARCHAR(15) NOT NULL CHECK (Status IN ('waiting', 'in_consult', 'resolved', 'discharged', 'cancelled')),
    
    StartTime DATETIME2 NOT NULL, -- CRITICAL for calculating waiting time KPI
    EndTime DATETIME2,           -- Time of discharge
    
    TriageNotes NVARCHAR(MAX)    -- Raw symptom data from the student's form
);


DECLARE @DoctorID UNIQUEIDENTIFIER = NEWID();
DECLARE @Student1ID UNIQUEIDENTIFIER = NEWID();
DECLARE @Student2ID UNIQUEIDENTIFIER = NEWID();
DECLARE @Student3ID UNIQUEIDENTIFIER = NEWID();

-- 1. Insert Test Users
INSERT INTO USERS (UserID, UniversityID, FirstName, LastName, Role, Email, PasswordHash)
VALUES
    (@DoctorID, 'SM-DOC001', 'Sarah', 'Johnson', 'doctor', 's.johnson@unilag.edu.ng', 'hashed_doc_password'),
    (@Student1ID, 'SM-S2025123', 'David', 'Adekunle', 'student', 'david.a@unilag.edu.ng', 'hashed_stu1_password'),
    (@Student2ID, 'SM-S2024456', 'Chioma', 'Nnamdi', 'student', 'chioma.n@unilag.edu.ng', 'hashed_stu2_password'),
    (@Student3ID, 'SM-S2024789', 'Aisha', 'Bello', 'student', 'aisha.b@unilag.edu.ng', 'hashed_stu3_password');

-- 2. Insert Patient Profiles
INSERT INTO PatientProfile (PatientID, DOB, BloodType, Allergies)
VALUES
    (@Student1ID, '2004-05-15', 'O+', 'None'),
    (@Student2ID, '2005-02-28', 'B-', 'Penicillin'),
    (@Student3ID, '2003-11-10', 'A-', 'Latex');
-- IMPORTANT: NO GO HERE

-- 3. Insert Mock Visit Data (All PatientIDs are now valid variables)
INSERT INTO Visit (PatientID, QueueToken, TriageStatus, Status, StartTime, TriageNotes)
VALUES
    -- EMERGENCY (Aisha Bello)
    (@Student3ID, 'E0A1', 'emergency', 'waiting', DATEADD(minute, -1, GETDATE()), 'Severe allergic reaction, difficulty breathing.'),

    -- URGENT (Chioma Nnamdi)
    (@Student2ID, 'U1B2', 'urgent', 'waiting', DATEADD(minute, -5, GETDATE()), 'Severe migraine, flashing lights, BP spiking.'),

    -- ROUTINE (David Adekunle)
    (@Student1ID, 'R2C3', 'routine', 'waiting', DATEADD(minute, -15, GETDATE()), 'Routine check-up, persistent cough for 3 days.'),

    -- ROUTINE (We reuse Student 3 for another visit or create a new mock ID here)
    -- OPTION A: Reuse David Adekunle's ID for a second visit entry (simplest fix)
    (@Student1ID, 'R3D4', 'routine', 'waiting', DATEADD(minute, -10, GETDATE()), 'Requesting refill for malaria prevention.');

