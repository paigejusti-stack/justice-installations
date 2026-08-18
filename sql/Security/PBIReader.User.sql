/****** Object:  Database User [PBIReader] ******/
/*
    Read-only user for the Justice Installations Power BI report.
    Run this inside the [justiceinstallations] database.

    The semantic model imports the dw.* tables directly, so dw is the whole
    surface the report needs. A new user has no permissions until granted,
    so the single GRANT below is the entire permission set -- no db_datareader,
    which would also expose every other schema in the database.

    Replace the password before running. Do not commit the real one.
*/

-- 1. create the user
CREATE USER [PBIReader] WITH PASSWORD = N'<replace-me>';
GO

-- 2. grant read-only access to the warehouse schema
GRANT SELECT ON SCHEMA::[dw] TO [PBIReader];
GO


/*  Check it worked:

    -- should return rows
    EXECUTE AS USER = 'PBIReader';
    SELECT TOP 1 * FROM dw.FactJobs;
    REVERT;

    -- should fail with a permission error
    EXECUTE AS USER = 'PBIReader';
    INSERT INTO dw.FactJobs (JobNumber) VALUES ('X');
    REVERT;
*/
