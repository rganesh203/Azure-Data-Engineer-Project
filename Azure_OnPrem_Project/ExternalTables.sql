-- Set Password & create master key

CREATE MASTER KEY  ENCRYPTION BY PASSWORD ='OnPremWork123'  -- to access the external location

/* Create Database Scoped Credential Managed Identity 
- to authentic & allow Synapse to interact with other azure services */

CREATE DATABASE SCOPED CREDENTIAL rutuja_onprem
WITH
    IDENTITY = 'Managed Identity';

-- 3) Create External Data Source - conn. between synapse and ADLS - 2 dataseource - silver, gold

CREATE EXTERNAL DATA SOURCE silver_layer_source
WITH
(
    LOCATION = 'https://adlsonpremwork.blob.core.windows.net/silver',
    CREDENTIAL = rutuja_onprem
)

CREATE EXTERNAL DATA SOURCE gold_layer_source
WITH
(
    LOCATION = 'https://adlsonpremwork.blob.core.windows.net/gold',
    CREDENTIAL = rutuja_onprem
)

-- 4) Create External File Format 
CREATE EXTERNAL FILE FORMAT parquet_foramt
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

-- 5) Create External Tables

CREATE EXTERNAL TABLE GOLD.ext_employee
WITH
(
    LOCATION = 'ext_employee',
    DATA_SOURCE = gold_layer_source,
    FILE_FORMAT = parquet_foramt
) AS SELECT * FROM GOLD.Employee

SELECT * FROM GOLD.ext_employee;

CREATE EXTERNAL TABLE GOLD.ext_department
WITH
(
    LOCATION = 'ext_department',
    DATA_SOURCE = gold_layer_source,
    FILE_FORMAT = parquet_foramt
) AS SELECT * FROM GOLD.Department

SELECT * FROM GOLD.ext_department;

CREATE EXTERNAL TABLE GOLD.ext_empdepthist
WITH
(
    LOCATION = 'ext_empdepthist',
    DATA_SOURCE = gold_layer_source,
    FILE_FORMAT = parquet_foramt
) AS SELECT * FROM GOLD.EmployeeDepartmentHistory

SELECT * FROM GOLD.ext_empdepthist;

CREATE EXTERNAL TABLE GOLD.ext_emppayhist
WITH
(
    LOCATION = 'ext_emppayhist',
    DATA_SOURCE = gold_layer_source,
    FILE_FORMAT = parquet_foramt
) AS SELECT * FROM GOLD.EmployeePayHistory

SELECT * FROM GOLD.ext_emppayhist;

CREATE EXTERNAL TABLE GOLD.ext_jobcan
WITH
(
    LOCATION = 'ext_jobcan',
    DATA_SOURCE = gold_layer_source,
    FILE_FORMAT = parquet_foramt
) AS SELECT * FROM GOLD.JobCandidate

SELECT * FROM GOLD.ext_jobcan;

CREATE EXTERNAL TABLE GOLD.ext_shift
WITH
(
    LOCATION = 'ext_shift',
    DATA_SOURCE = gold_layer_source,
    FILE_FORMAT = parquet_foramt
) AS SELECT * FROM GOLD.Shift

SELECT * FROM GOLD.ext_shift;



