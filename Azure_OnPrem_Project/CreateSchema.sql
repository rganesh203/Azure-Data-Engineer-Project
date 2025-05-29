CREATE SCHEMA GOLD;    -- A] Schema Creation

------------ B] 1) View Creation - Employee
CREATE VIEW GOLD.Employee
AS
SELECT 
    *
    FROM
        OPENROWSET(
            BULK 'https://adlsonpremwork.dfs.core.windows.net/silver/HumanResources/Employee/',
            FORMAT = 'DELTA'
        ) as Query1

SELECT * FROM GOLD.Employee;

------------ 2) View Creation - Department

CREATE VIEW GOLD.Department
AS
SELECT 
    *
    FROM
        OPENROWSET(
            BULK 'https://adlsonpremwork.dfs.core.windows.net/silver/HumanResources/Department/',
            FORMAT = 'DELTA'
        ) as Query1;

SELECT * FROM GOLD.Department;

------------ 3) View Creation - EmployeeDepartmentHistory

CREATE VIEW GOLD.EmployeeDepartmentHistory
AS
SELECT 
    *
    FROM
        OPENROWSET(
            BULK 'https://adlsonpremwork.dfs.core.windows.net/silver/HumanResources/EmployeeDepartmentHistory/',
            FORMAT = 'DELTA'
        ) as Query1;

SELECT * FROM GOLD.EmployeeDepartmentHistory;

------------ 4) View Creation - EmployeePayHistory

CREATE VIEW GOLD.EmployeePayHistory
AS
SELECT 
    *
    FROM
        OPENROWSET(
            BULK 'https://adlsonpremwork.dfs.core.windows.net/silver/HumanResources/EmployeePayHistory/',
            FORMAT = 'DELTA'
        ) as Query1;

SELECT * FROM GOLD.EmployeePayHistory;

------------ 5) View Creation - EmployeePayHistory

CREATE VIEW GOLD.JobCandidate
AS
SELECT 
    *
    FROM
        OPENROWSET(
            BULK 'https://adlsonpremwork.dfs.core.windows.net/silver/HumanResources/JobCandidate/',
            FORMAT = 'DELTA'
        ) as Query1;

SELECT * FROM GOLD.JobCandidate;

------------ 6) View Creation - Shift

CREATE VIEW GOLD.Shift
AS
SELECT 
    *
    FROM
        OPENROWSET(
            BULK 'https://adlsonpremwork.dfs.core.windows.net/silver/HumanResources/Shift/',
            FORMAT = 'DELTA'
        ) as Query1;

SELECT * FROM GOLD.Shift;

