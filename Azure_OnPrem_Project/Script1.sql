SELECT *
FROM
    OPENROWSET(
        BULK 'https://adlsonpremwork.dfs.core.windows.net/silver/HumanResources/Employee/',
        FORMAT = 'DELTA'
    ) as Query1