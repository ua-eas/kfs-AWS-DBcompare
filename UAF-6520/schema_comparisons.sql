--Using this script:
--  Insert notes on how to use this script.
--
--
--

--==================================================
--                Table Comparisons
--==================================================

--Table exists in both KFS 3 and Rice 7
SELECT TABLE_NAME,'Table exists in both KFS 3 and Rice 7' FROM (
    SELECT TABLE_NAME FROM DBA_TABLES
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    INTERSECT
    SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
        WHERE OWNER='RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
) ORDER BY TABLE_NAME;

--Table exists in both KFS 3 and Financials 7
SELECT TABLE_NAME,'Table exists in both KFS 3 and Financials 7' FROM (
    SELECT TABLE_NAME FROM DBA_TABLES
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    INTERSECT
    SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
) ORDER BY TABLE_NAME;

--Table exists in both Financials 7 and Rice 7
SELECT TABLE_NAME,'Table exists in both Financials 7 and Rice 7' FROM (
    SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    INTERSECT
    SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
        WHERE OWNER='RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
) ORDER BY TABLE_NAME;

--Table exists in KFS 3 but not in Rice 7 or Financials 7.
SELECT TABLE_NAME,'Table exists in KFS 3 but not in Rice 7 or Financials 7' FROM (
    SELECT TABLE_NAME FROM DBA_TABLES
        WHERE OWNER = 'KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
        MINUS
        (
            SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                WHERE OWNER = 'RICE'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
            UNION ALL
            SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                WHERE OWNER = 'KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
        )
) ORDER BY TABLE_NAME;

--Table exists in Rice 7 but not in KFS 3.
SELECT TABLE_NAME,'Table exists in Rice 7 but not in KFS 3' FROM (
    SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
        WHERE OWNER = 'RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    MINUS
    SELECT TABLE_NAME FROM DBA_TABLES
        WHERE OWNER = 'KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
) ORDER BY TABLE_NAME;

--Table exists in Financial 7 but not in KFS 3
SELECT TABLE_NAME,'Table exists in Financial 7 but not in KFS 3' FROM (
    SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
        WHERE OWNER = 'KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    MINUS
    SELECT TABLE_NAME FROM DBA_TABLES
        WHERE OWNER = 'KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
) ORDER BY TABLE_NAME;

--Table exists in Financials 7 or Rice 7 but not in KFS 3
SELECT TABLE_NAME, 'Tables in Rice/Financials 7 but not in 3' FROM (
    SELECT TABLE_NAME FROM (
        SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
            WHERE OWNER = 'RICE'
                AND TABLE_NAME NOT LIKE 'RUPD$%'
                AND TABLE_NAME NOT LIKE '%MLOG$%'
        MINUS
        SELECT TABLE_NAME FROM DBA_TABLES
            WHERE OWNER = 'KULOWNER'
                AND TABLE_NAME NOT LIKE 'RUPD$%'
                AND TABLE_NAME NOT LIKE '%MLOG$%'
    )
    UNION ALL
    SELECT TABLE_NAME FROM (
        SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
            WHERE OWNER = 'KULOWNER'
                AND TABLE_NAME NOT LIKE 'RUPD$%'
                AND TABLE_NAME NOT LIKE '%MLOG$%'
        MINUS
        SELECT TABLE_NAME FROM DBA_TABLES
            WHERE OWNER = 'KULOWNER'
                AND TABLE_NAME NOT LIKE 'RUPD$%'
                AND TABLE_NAME NOT LIKE '%MLOG$%'
    )
) ORDER BY TABLE_NAME;

--==================================================
--             Table/Field Comparisons
--==================================================

--Table/Field Exists in KFS 3 and Rice 7
SELECT TABLE_NAME,COLUMN_NAME,'Table field exists in KFS 3 and Rice 7' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    INTERSECT
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
) ORDER BY TABLE_NAME,COLUMN_NAME;

--Table/Field Exists in KFS 3 and Financials 7
SELECT TABLE_NAME,COLUMN_NAME,'Table field exists in KFS 3 and Financials 7' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    INTERSECT
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
) ORDER BY TABLE_NAME,COLUMN_NAME;

--Table/Field Exists in Rice 7 and Financials 7
SELECT TABLE_NAME,COLUMN_NAME,'Table field exists in Rice 7 and Financials 7' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    INTERSECT
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
) ORDER BY TABLE_NAME,COLUMN_NAME;

--For Tables that are in KFS 3 and Rice 7, which fields don't exist Rice 7?
SELECT TABLE_NAME,COLUMN_NAME,'Table field exists in KFS 3 but not in Rice 7' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
            AND (TABLE_NAME,COLUMN_NAME) NOT IN (
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
            AND TABLE_NAME IN (
                SELECT TABLE_NAME FROM DBA_TABLES
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                       AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
) ORDER BY TABLE_NAME,COLUMN_NAME;

--For Tables that are in KFS 3 and Financials 7, which fields don't exist in Financials 7?
SELECT TABLE_NAME,COLUMN_NAME,'Table field exists in KFS 3 but not in Financials 7' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
            AND (TABLE_NAME,COLUMN_NAME) NOT IN (
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
                WHERE OWNER='KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
            AND TABLE_NAME IN (
                SELECT TABLE_NAME FROM DBA_TABLES
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                       AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
) ORDER BY TABLE_NAME,COLUMN_NAME;

--For Tables that are in KFS 3 and Rice 7, which fields don't exist in KFS 3?
SELECT TABLE_NAME,COLUMN_NAME,'Table field exists in Rice 7 but not in KFS 3' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
            AND (TABLE_NAME,COLUMN_NAME) NOT IN (
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
                WHERE OWNER='KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
            AND TABLE_NAME IN (
                SELECT TABLE_NAME FROM DBA_TABLES
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                       AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
) ORDER BY TABLE_NAME,COLUMN_NAME;

--For Tables that are in KFS 3 and Financials 7, which fields don't exist in KFS 3?
SELECT TABLE_NAME,COLUMN_NAME,'Table field exists in Financials 7 but not in KFS 3' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
            AND (TABLE_NAME,COLUMN_NAME) NOT IN (
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
                WHERE OWNER='KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
            AND TABLE_NAME IN (
                SELECT TABLE_NAME FROM DBA_TABLES
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                       AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
) ORDER BY TABLE_NAME,COLUMN_NAME;

--For Tables that are in Rice 7 and Financials 7, which fields don't exist in Financials 7? (This should be Empty)
SELECT TABLE_NAME,COLUMN_NAME,'Table field exists in Rice 7 but not in Financials 7' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
            AND (TABLE_NAME,COLUMN_NAME) NOT IN (
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                WHERE OWNER='KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
            AND TABLE_NAME IN (
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                       AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
) ORDER BY TABLE_NAME,COLUMN_NAME;

--For Tables that are in Rice 7 and Financials 7, which fields don't exist in Rice 7? (This should be Empty)
SELECT TABLE_NAME,COLUMN_NAME,'Table field exists in Financials 7 but not in Rice 7' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
            AND (TABLE_NAME,COLUMN_NAME) NOT IN (
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                WHERE OWNER='KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
            AND TABLE_NAME IN (
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                       AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
) ORDER BY TABLE_NAME,COLUMN_NAME;

--==================================================
--         Table/Field Datatype Comparisons
--==================================================

--Table/Field Exists in KFS 3 and Rice 7, and the Datatype is the same.

--Table/Field Exists in KFS 3 and Rice 7, and the Datatype is different.

--Table/Field Exists in KFS 3 and Financials 7, and the Datatype is the same.

--List of Tables that cannot be compared by * due to invalid data types (BLOB, CLOB, BFILE, VARRAY, LONG)
SELECT DISTINCT(TABLE_NAME) FROM DBA_TAB_COLUMNS
    WHERE OWNER = 'KULOWNER'
        AND TABLE_NAME NOT LIKE 'RUPD$%'
        AND TABLE_NAME NOT LIKE '%MLOG$%'
        AND DATA_TYPE IN ('BLOB', 'CLOB', 'BFILE', 'VARRAY', 'LONG')
    ORDER BY TABLE_NAME;

--List of Tables in both KFS 3 and Financials 7, that have Schema differences.
SELECT DISTINCT(TABLE_NAME) FROM (
    (
        SELECT TABLE_NAME,COLUMN_NAME,DATA_TYPE FROM DBA_TAB_COLUMNS
            WHERE OWNER='KULOWNER'
                AND TABLE_NAME NOT LIKE 'RUPD$%'
                AND TABLE_NAME NOT LIKE '%MLOG$%'
        UNION
        SELECT TABLE_NAME,COLUMN_NAME,DATA_TYPE FROM DBA_TAB_COLUMNS@KFS7GOLD
            WHERE OWNER='KULOWNER'
                AND TABLE_NAME NOT LIKE 'RUPD$%'
                AND TABLE_NAME NOT LIKE '%MLOG$%'
    )
    MINUS 
    SELECT TABLE_NAME,COLUMN_NAME,DATA_TYPE FROM DBA_TAB_COLUMNS
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
) ORDER BY TABLE_NAME;

--List of Tables in both KFS 3 and Financials 7, that do not have Schema differences, and can be compared by *.
SELECT DISTINCT(TABLE_NAME) FROM (
    (
        SELECT TABLE_NAME FROM DBA_TABLES
            WHERE OWNER='KULOWNER'
                AND TABLE_NAME NOT LIKE 'RUPD$%'
                AND TABLE_NAME NOT LIKE '%MLOG$%'
        INTERSECT
        SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
            WHERE OWNER='KULOWNER'
                AND TABLE_NAME NOT LIKE 'RUPD$%'
                AND TABLE_NAME NOT LIKE '%MLOG$%'
    )
    MINUS
    SELECT DISTINCT(TABLE_NAME) FROM (
        (
            SELECT TABLE_NAME,COLUMN_NAME,DATA_TYPE FROM DBA_TAB_COLUMNS
                WHERE OWNER='KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
            UNION
            SELECT TABLE_NAME,COLUMN_NAME,DATA_TYPE FROM DBA_TAB_COLUMNS@KFS7GOLD
                WHERE OWNER='KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
        )
        MINUS 
        SELECT TABLE_NAME,COLUMN_NAME,DATA_TYPE FROM DBA_TAB_COLUMNS
            WHERE OWNER='KULOWNER'
                AND TABLE_NAME NOT LIKE 'RUPD$%'
                AND TABLE_NAME NOT LIKE '%MLOG$%'
    )
    MINUS
    SELECT DISTINCT(TABLE_NAME) FROM DBA_TAB_COLUMNS
        WHERE OWNER = 'KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
            AND DATA_TYPE IN ('BLOB', 'CLOB', 'BFILE', 'VARRAY', 'LONG')
) ORDER BY TABLE_NAME;




--Table/Field Exists in KFS 3 and Financials 7, and the Datatype is different.

--Table/Field Exists in Rice 7 and Financials 7, and the Datatype is the same. This should be the same as "Table/Field Exists in Rice 7 and Financials 7".

--Table/Field Exists in Rice 7 and Financials 7, and the Datatype is different. This should be empty.




--==================================================
--              Table Count summaries
--==================================================
SELECT COUNT(*), 'Tables that exist in KFS 3' FROM DBA_TABLES
    WHERE OWNER = 'KULOWNER'
        AND TABLE_NAME NOT LIKE 'RUPD$%'
        AND TABLE_NAME NOT LIKE '%MLOG$%';

SELECT COUNT(*), 'Tables that exist in Rice 7' FROM DBA_TABLES@KFS7GOLD
    WHERE OWNER = 'RICE'
        AND TABLE_NAME NOT LIKE 'RUPD$%'
        AND TABLE_NAME NOT LIKE '%MLOG$%';

SELECT COUNT(*), 'Tables that exist in Financials 7' FROM DBA_TABLES@KFS7GOLD
    WHERE OWNER = 'KULOWNER'
        AND TABLE_NAME NOT LIKE 'RUPD$%'
        AND TABLE_NAME NOT LIKE '%MLOG$%';

--Table exists in both KFS 3 and Rice 7
SELECT COUNT(*),'Tables that exist in both KFS 3 and Rice 7' FROM (
    SELECT TABLE_NAME FROM DBA_TABLES
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    INTERSECT
    SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
        WHERE OWNER='RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
);

--Table exists in both KFS 3 and Financials 7
SELECT COUNT(*),'Tables that exist in both KFS 3 and Financials 7' FROM (
    SELECT TABLE_NAME FROM DBA_TABLES
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    INTERSECT
    SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
);

--Table exists in both Financials 7 and Rice 7
SELECT COUNT(*),'Tables that exist in both KFS 3 and Rice 7' FROM (
    SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    INTERSECT
    SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
        WHERE OWNER='RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
);

--Table exists in KFS 3 but not in Rice 7 or Financials 7.
SELECT COUNT(*), 'Tables that exist in KFS 3, but not in Rice 7 or Financials 7' FROM (
    SELECT TABLE_NAME FROM DBA_TABLES
        WHERE OWNER = 'KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
        MINUS
        (
            SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                WHERE OWNER = 'RICE'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
            UNION ALL
            SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                WHERE OWNER = 'KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
        )
);

--Table exists in Rice 7 but not in KFS 3.
SELECT COUNT(*), 'Tables that exist in Rice 7, but not in KFS 3' FROM (
    SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
        WHERE OWNER = 'RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    MINUS
    SELECT TABLE_NAME FROM DBA_TABLES
        WHERE OWNER = 'KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
);

--Table exists in Financial 7 but not in KFS 3
SELECT COUNT(*), 'Tables that exist in Financial 7 but not in KFS 3' FROM (
    SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
        WHERE OWNER = 'KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    MINUS
    SELECT TABLE_NAME FROM DBA_TABLES
        WHERE OWNER = 'KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
);


--Table Field Comparison summaries

--Table/Fields exist in KFS 3 and Rice 7
SELECT COUNT(*),'Table/Fields exist in KFS 3 and Rice 7' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    INTERSECT
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
);

--Table/Fields exist in KFS 3 and Financials 7
SELECT COUNT(*),'Table/Fields exist in KFS 3 and Financials 7' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    INTERSECT
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
);

--Table/Fields exist in Rice 7 and Financials 7
SELECT COUNT(*),'Table/Fields exist in Rice 7 and Financials 7' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
    INTERSECT
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
);

--For Tables that are in KFS 3 and Rice 7, which fields don't exist Rice 7?
SELECT COUNT(*),'Table/Fields exist in KFS 3, but not in Rice 7' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
            AND (TABLE_NAME,COLUMN_NAME) NOT IN (
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
            AND TABLE_NAME IN (
                SELECT TABLE_NAME FROM DBA_TABLES
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                       AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
);

--For Tables that are in KFS 3 and Financials 7, which fields don't exist in Financials 7?
SELECT COUNT(*),'Table/Fields exist in KFS 3, but not in Financials 7' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
            AND (TABLE_NAME,COLUMN_NAME) NOT IN (
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
                WHERE OWNER='KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
            AND TABLE_NAME IN (
                SELECT TABLE_NAME FROM DBA_TABLES
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                       AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
);

--For Tables that are in KFS 3 and Rice 7, which fields don't exist in KFS 3?
SELECT COUNT(*),'Table/Fields exist in Rice 7, but not in KFS 3' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
            AND (TABLE_NAME,COLUMN_NAME) NOT IN (
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
                WHERE OWNER='KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
            AND TABLE_NAME IN (
                SELECT TABLE_NAME FROM DBA_TABLES
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                       AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
);

--For Tables that are in KFS 3 and Financials 7, which fields don't exist in KFS 3?
SELECT COUNT(*),'Table/Fields exist in Financials 7, but not in KFS 3' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
            AND (TABLE_NAME,COLUMN_NAME) NOT IN (
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS
                WHERE OWNER='KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
            AND TABLE_NAME IN (
                SELECT TABLE_NAME FROM DBA_TABLES
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                       AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
);

--For Tables that are in Rice 7 and Financials 7, which fields don't exist in Financials 7? (This should be 0)
SELECT COUNT(*),'Table/Fields exist in Rice 7, but not in Financials 7. This should be 0.' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='RICE'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
            AND (TABLE_NAME,COLUMN_NAME) NOT IN (
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                WHERE OWNER='KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
            AND TABLE_NAME IN (
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                       AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
);

--For Tables that are in Rice 7 and Financials 7, which fields don't exist in Rice 7? (This should be 0)
SELECT COUNT(*),'Table/Fields exist in Financials 7, but not in Rice 7. This should be 0.' FROM (
    SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
        WHERE OWNER='KULOWNER'
            AND TABLE_NAME NOT LIKE 'RUPD$%'
            AND TABLE_NAME NOT LIKE '%MLOG$%'
            AND (TABLE_NAME,COLUMN_NAME) NOT IN (
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                WHERE OWNER='KULOWNER'
                    AND TABLE_NAME NOT LIKE 'RUPD$%'
                    AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME,COLUMN_NAME FROM DBA_TAB_COLUMNS@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
            AND TABLE_NAME IN (
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='KULOWNER'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                        AND TABLE_NAME NOT LIKE '%MLOG$%'
                INTERSECT
                SELECT TABLE_NAME FROM DBA_TABLES@KFS7GOLD
                    WHERE OWNER='RICE'
                        AND TABLE_NAME NOT LIKE 'RUPD$%'
                       AND TABLE_NAME NOT LIKE '%MLOG$%'
            )
);


--These tables have column differences or have data types that cannot be tested as part of the whole and will cause errors if run as is. (242 tables)
SELECT * FROM AP_AUTO_APRV_EXCL_T                                                  MINUS SELECT * FROM AP_AUTO_APRV_EXCL_T                 @KFS7GOLD;
SELECT * FROM AP_CRDT_MEMO_ACCT_T                                                  MINUS SELECT * FROM AP_CRDT_MEMO_ACCT_T                 @KFS7GOLD;
SELECT * FROM AP_CRDT_MEMO_T                                                       MINUS SELECT * FROM AP_CRDT_MEMO_T                      @KFS7GOLD;
SELECT * FROM AP_ELCTRNC_INV_MAP_T                                                 MINUS SELECT * FROM AP_ELCTRNC_INV_MAP_T                @KFS7GOLD;
SELECT * FROM AP_ELCTRNC_INV_RJT_DOC_T                                             MINUS SELECT * FROM AP_ELCTRNC_INV_RJT_DOC_T            @KFS7GOLD;
SELECT * FROM AP_NEG_PMT_RQST_APRVL_LMT_T                                          MINUS SELECT * FROM AP_NEG_PMT_RQST_APRVL_LMT_T         @KFS7GOLD;
SELECT * FROM AP_PMT_RQST_ACCT_T                                                   MINUS SELECT * FROM AP_PMT_RQST_ACCT_T                  @KFS7GOLD;
SELECT * FROM AP_PMT_RQST_T                                                        MINUS SELECT * FROM AP_PMT_RQST_T                       @KFS7GOLD;
SELECT * FROM AR_APPLICATION_DOC_T                                                 MINUS SELECT * FROM AR_APPLICATION_DOC_T                @KFS7GOLD;
SELECT * FROM AR_CSH_CTRL_T                                                        MINUS SELECT * FROM AR_CSH_CTRL_T                       @KFS7GOLD;
SELECT * FROM AR_CUST_ADDR_T                                                       MINUS SELECT * FROM AR_CUST_ADDR_T                      @KFS7GOLD;
SELECT * FROM AR_CUST_ADDR_TYP_T                                                   MINUS SELECT * FROM AR_CUST_ADDR_TYP_T                  @KFS7GOLD;
SELECT * FROM AR_CUST_T                                                            MINUS SELECT * FROM AR_CUST_T                           @KFS7GOLD;
SELECT * FROM AR_CUST_TYP_T                                                        MINUS SELECT * FROM AR_CUST_TYP_T                       @KFS7GOLD;
SELECT * FROM AR_DOC_RCURRNC_T                                                     MINUS SELECT * FROM AR_DOC_RCURRNC_T                    @KFS7GOLD;
SELECT * FROM AR_INV_DOC_T                                                         MINUS SELECT * FROM AR_INV_DOC_T                        @KFS7GOLD;
SELECT * FROM AR_INV_ITM_CODE_T                                                    MINUS SELECT * FROM AR_INV_ITM_CODE_T                   @KFS7GOLD;
SELECT * FROM AR_ORG_ACCTGDFLT_T                                                   MINUS SELECT * FROM AR_ORG_ACCTGDFLT_T                  @KFS7GOLD;
SELECT * FROM AR_ORG_OPTION_T                                                      MINUS SELECT * FROM AR_ORG_OPTION_T                     @KFS7GOLD;
SELECT * FROM AR_PMT_MEDIUM_T                                                      MINUS SELECT * FROM AR_PMT_MEDIUM_T                     @KFS7GOLD;
SELECT * FROM AR_SYS_INFO_T                                                        MINUS SELECT * FROM AR_SYS_INFO_T                       @KFS7GOLD;
SELECT * FROM CA_ACCOUNT_T                                                         MINUS SELECT * FROM CA_ACCOUNT_T                        @KFS7GOLD;
SELECT * FROM CA_ACCOUNT_TYPE_T                                                    MINUS SELECT * FROM CA_ACCOUNT_TYPE_T                   @KFS7GOLD;
SELECT * FROM CA_ACCT_CHG_DOC_T                                                    MINUS SELECT * FROM CA_ACCT_CHG_DOC_T                   @KFS7GOLD;
SELECT * FROM CA_ACCT_DELEGATE_GBL_T                                               MINUS SELECT * FROM CA_ACCT_DELEGATE_GBL_T              @KFS7GOLD;
SELECT * FROM CA_ACCT_DELEGATE_T                                                   MINUS SELECT * FROM CA_ACCT_DELEGATE_T                  @KFS7GOLD;
SELECT * FROM CA_ACCT_SF_T                                                         MINUS SELECT * FROM CA_ACCT_SF_T                        @KFS7GOLD;
SELECT * FROM CA_ACCTG_CTGRY_T                                                     MINUS SELECT * FROM CA_ACCTG_CTGRY_T                    @KFS7GOLD;
SELECT * FROM CA_AICPA_FUNC_T                                                      MINUS SELECT * FROM CA_AICPA_FUNC_T                     @KFS7GOLD;
SELECT * FROM CA_BALANCE_TYPE_T                                                    MINUS SELECT * FROM CA_BALANCE_TYPE_T                   @KFS7GOLD;
SELECT * FROM CA_BDGT_AGGR_T                                                       MINUS SELECT * FROM CA_BDGT_AGGR_T                      @KFS7GOLD;
SELECT * FROM CA_BDGT_REC_LVL_T                                                    MINUS SELECT * FROM CA_BDGT_REC_LVL_T                   @KFS7GOLD;
SELECT * FROM CA_CHART_T                                                           MINUS SELECT * FROM CA_CHART_T                          @KFS7GOLD;
SELECT * FROM CA_FED_FND_T                                                         MINUS SELECT * FROM CA_FED_FND_T                        @KFS7GOLD;
SELECT * FROM CA_FEDERAL_FUNC_T                                                    MINUS SELECT * FROM CA_FEDERAL_FUNC_T                   @KFS7GOLD;
SELECT * FROM CA_FUND_GRP_T                                                        MINUS SELECT * FROM CA_FUND_GRP_T                       @KFS7GOLD;
SELECT * FROM CA_HIGHR_ED_FUNC_T                                                   MINUS SELECT * FROM CA_HIGHR_ED_FUNC_T                  @KFS7GOLD;
SELECT * FROM CA_ICR_EXCL_ACCT_T                                                   MINUS SELECT * FROM CA_ICR_EXCL_ACCT_T                  @KFS7GOLD;
SELECT * FROM CA_ICR_RATE_T                                                        MINUS SELECT * FROM CA_ICR_RATE_T                       @KFS7GOLD;
SELECT * FROM CA_ICR_TYPE_T                                                        MINUS SELECT * FROM CA_ICR_TYPE_T                       @KFS7GOLD;
SELECT * FROM CA_MNXFR_ELIM_T                                                      MINUS SELECT * FROM CA_MNXFR_ELIM_T                     @KFS7GOLD;
SELECT * FROM CA_OBJ_CD_CHG_DOC_T                                                  MINUS SELECT * FROM CA_OBJ_CD_CHG_DOC_T                 @KFS7GOLD;
SELECT * FROM CA_OBJ_CONSOLDTN_T                                                   MINUS SELECT * FROM CA_OBJ_CONSOLDTN_T                  @KFS7GOLD;
SELECT * FROM CA_OBJ_LEVEL_T                                                       MINUS SELECT * FROM CA_OBJ_LEVEL_T                      @KFS7GOLD;
SELECT * FROM CA_OBJ_SUB_TYPE_T                                                    MINUS SELECT * FROM CA_OBJ_SUB_TYPE_T                   @KFS7GOLD;
SELECT * FROM CA_OBJ_TYPE_T                                                        MINUS SELECT * FROM CA_OBJ_TYPE_T                       @KFS7GOLD;
SELECT * FROM CA_OBJECT_CODE_T                                                     MINUS SELECT * FROM CA_OBJECT_CODE_T                    @KFS7GOLD;
SELECT * FROM CA_ORG_REVERSION_T                                                   MINUS SELECT * FROM CA_ORG_REVERSION_T                  @KFS7GOLD;
SELECT * FROM CA_ORG_RTNG_MDL_NM_T                                                 MINUS SELECT * FROM CA_ORG_RTNG_MDL_NM_T                @KFS7GOLD;
SELECT * FROM CA_ORG_RVRSN_CHG_DOC_T                                               MINUS SELECT * FROM CA_ORG_RVRSN_CHG_DOC_T              @KFS7GOLD;
SELECT * FROM CA_ORG_RVRSN_CTGRY_T                                                 MINUS SELECT * FROM CA_ORG_RVRSN_CTGRY_T                @KFS7GOLD;
SELECT * FROM CA_ORG_T                                                             MINUS SELECT * FROM CA_ORG_T                            @KFS7GOLD;
SELECT * FROM CA_ORG_TYPE_T                                                        MINUS SELECT * FROM CA_ORG_TYPE_T                       @KFS7GOLD;
SELECT * FROM CA_PRIOR_YR_ACCT_T                                                   MINUS SELECT * FROM CA_PRIOR_YR_ACCT_T                  @KFS7GOLD;
SELECT * FROM CA_PRIOR_YR_ORG_T                                                    MINUS SELECT * FROM CA_PRIOR_YR_ORG_T                   @KFS7GOLD;
SELECT * FROM CA_PROJECT_T                                                         MINUS SELECT * FROM CA_PROJECT_T                        @KFS7GOLD;
SELECT * FROM CA_RC_T                                                              MINUS SELECT * FROM CA_RC_T                             @KFS7GOLD;
SELECT * FROM CA_RESTRICT_STAT_T                                                   MINUS SELECT * FROM CA_RESTRICT_STAT_T                  @KFS7GOLD;
SELECT * FROM CA_SOURCE_OF_FUNDS_T                                                 MINUS SELECT * FROM CA_SOURCE_OF_FUNDS_T                @KFS7GOLD;
SELECT * FROM CA_SUB_ACCT_T                                                        MINUS SELECT * FROM CA_SUB_ACCT_T                       @KFS7GOLD;
SELECT * FROM CA_SUB_FND_GRP_TYP_T                                                 MINUS SELECT * FROM CA_SUB_FND_GRP_TYP_T                @KFS7GOLD;
SELECT * FROM CA_SUB_FUND_GRP_T                                                    MINUS SELECT * FROM CA_SUB_FUND_GRP_T                   @KFS7GOLD;
SELECT * FROM CA_SUB_OBJ_CD_CHG_DOC_T                                              MINUS SELECT * FROM CA_SUB_OBJ_CD_CHG_DOC_T             @KFS7GOLD;
SELECT * FROM CA_SUB_OBJECT_CD_T                                                   MINUS SELECT * FROM CA_SUB_OBJECT_CD_T                  @KFS7GOLD;
SELECT * FROM CA_UBO_FUNC_T                                                        MINUS SELECT * FROM CA_UBO_FUNC_T                       @KFS7GOLD;
SELECT * FROM CB_AST_TRN_TYP_T                                                     MINUS SELECT * FROM CB_AST_TRN_TYP_T                    @KFS7GOLD;
SELECT * FROM CB_PRTG_T                                                            MINUS SELECT * FROM CB_PRTG_T                           @KFS7GOLD;
SELECT * FROM CG_AGENCY_T                                                          MINUS SELECT * FROM CG_AGENCY_T                         @KFS7GOLD;
SELECT * FROM CG_AGENCY_TYP_T                                                      MINUS SELECT * FROM CG_AGENCY_TYP_T                     @KFS7GOLD;
SELECT * FROM CG_AWD_ACCT_T                                                        MINUS SELECT * FROM CG_AWD_ACCT_T                       @KFS7GOLD;
SELECT * FROM CG_AWD_EXT_T                                                         MINUS SELECT * FROM CG_AWD_EXT_T                        @KFS7GOLD;
SELECT * FROM CG_AWD_ORG_T                                                         MINUS SELECT * FROM CG_AWD_ORG_T                        @KFS7GOLD;
SELECT * FROM CG_AWD_PRJDR_T                                                       MINUS SELECT * FROM CG_AWD_PRJDR_T                      @KFS7GOLD;
SELECT * FROM CG_AWD_STAT_T                                                        MINUS SELECT * FROM CG_AWD_STAT_T                       @KFS7GOLD;
SELECT * FROM CG_AWD_SUBCN_T                                                       MINUS SELECT * FROM CG_AWD_SUBCN_T                      @KFS7GOLD;
SELECT * FROM CG_AWD_T                                                             MINUS SELECT * FROM CG_AWD_T                            @KFS7GOLD;
SELECT * FROM CG_CFDA_REF_T                                                        MINUS SELECT * FROM CG_CFDA_REF_T                       @KFS7GOLD;
SELECT * FROM CG_GRANT_DESC_T                                                      MINUS SELECT * FROM CG_GRANT_DESC_T                     @KFS7GOLD;
SELECT * FROM CG_LTRCR_FNDGRP_T                                                    MINUS SELECT * FROM CG_LTRCR_FNDGRP_T                   @KFS7GOLD;
SELECT * FROM CG_PRPSL_AWD_TYP_T                                                   MINUS SELECT * FROM CG_PRPSL_AWD_TYP_T                  @KFS7GOLD;
SELECT * FROM CG_PRPSL_ORG_T                                                       MINUS SELECT * FROM CG_PRPSL_ORG_T                      @KFS7GOLD;
SELECT * FROM CG_PRPSL_PRJDR_T                                                     MINUS SELECT * FROM CG_PRPSL_PRJDR_T                    @KFS7GOLD;
SELECT * FROM CG_PRPSL_PURPOSE_T                                                   MINUS SELECT * FROM CG_PRPSL_PURPOSE_T                  @KFS7GOLD;
SELECT * FROM CG_PRPSL_RSRCH_RSK_T                                                 MINUS SELECT * FROM CG_PRPSL_RSRCH_RSK_T                @KFS7GOLD;
SELECT * FROM CG_PRPSL_STAT_T                                                      MINUS SELECT * FROM CG_PRPSL_STAT_T                     @KFS7GOLD;
SELECT * FROM CG_PRPSL_SUBCN_T                                                     MINUS SELECT * FROM CG_PRPSL_SUBCN_T                    @KFS7GOLD;
SELECT * FROM CG_PRPSL_T                                                           MINUS SELECT * FROM CG_PRPSL_T                          @KFS7GOLD;
SELECT * FROM CG_SUBCNR_T                                                          MINUS SELECT * FROM CG_SUBCNR_T                         @KFS7GOLD;
SELECT * FROM CM_ACQ_TYPE_T                                                        MINUS SELECT * FROM CM_ACQ_TYPE_T                       @KFS7GOLD;
SELECT * FROM CM_ASSET_TYPE_T                                                      MINUS SELECT * FROM CM_ASSET_TYPE_T                     @KFS7GOLD;
SELECT * FROM CM_AST_COMPONENT_T                                                   MINUS SELECT * FROM CM_AST_COMPONENT_T                  @KFS7GOLD;
SELECT * FROM CM_AST_CONDITION_T                                                   MINUS SELECT * FROM CM_AST_CONDITION_T                  @KFS7GOLD;
SELECT * FROM CM_AST_DEPR_CNVNTN_T                                                 MINUS SELECT * FROM CM_AST_DEPR_CNVNTN_T                @KFS7GOLD;
SELECT * FROM CM_AST_DEPR_MTHD_T                                                   MINUS SELECT * FROM CM_AST_DEPR_MTHD_T                  @KFS7GOLD;
SELECT * FROM CM_AST_LOC_DOC_T                                                     MINUS SELECT * FROM CM_AST_LOC_DOC_T                    @KFS7GOLD;
SELECT * FROM CM_AST_LOC_TYP_T                                                     MINUS SELECT * FROM CM_AST_LOC_TYP_T                    @KFS7GOLD;
SELECT * FROM CM_AST_PAYMENT_T                                                     MINUS SELECT * FROM CM_AST_PAYMENT_T                    @KFS7GOLD;
SELECT * FROM CM_AST_PMT_AST_DTL_T                                                 MINUS SELECT * FROM CM_AST_PMT_AST_DTL_T                @KFS7GOLD;
SELECT * FROM CM_AST_PMT_DOC_T                                                     MINUS SELECT * FROM CM_AST_PMT_DOC_T                    @KFS7GOLD;
SELECT * FROM CM_AST_RETIRE_DOC_T                                                  MINUS SELECT * FROM CM_AST_RETIRE_DOC_T                 @KFS7GOLD;
SELECT * FROM CM_AST_RPR_HIST_T                                                    MINUS SELECT * FROM CM_AST_RPR_HIST_T                   @KFS7GOLD;
SELECT * FROM CM_AST_STATUS_T                                                      MINUS SELECT * FROM CM_AST_STATUS_T                     @KFS7GOLD;
SELECT * FROM CM_AST_WRNTY_T                                                       MINUS SELECT * FROM CM_AST_WRNTY_T                      @KFS7GOLD;
SELECT * FROM CM_CPTLAST_DOC_T                                                     MINUS SELECT * FROM CM_CPTLAST_DOC_T                    @KFS7GOLD;
SELECT * FROM CM_CPTLAST_OBJ_T                                                     MINUS SELECT * FROM CM_CPTLAST_OBJ_T                    @KFS7GOLD;
SELECT * FROM CM_CPTLAST_T                                                         MINUS SELECT * FROM CM_CPTLAST_T                        @KFS7GOLD;
SELECT * FROM CM_RETIRE_REAS_T                                                     MINUS SELECT * FROM CM_RETIRE_REAS_T                    @KFS7GOLD;
SELECT * FROM DATABASECHANGELOG                                                    MINUS SELECT * FROM DATABASECHANGELOG                   @KFS7GOLD;
SELECT * FROM ER_BDGT_MOD_T                                                        MINUS SELECT * FROM ER_BDGT_MOD_T                       @KFS7GOLD;
SELECT * FROM ER_RSRCH_RSK_TYP_T                                                   MINUS SELECT * FROM ER_RSRCH_RSK_TYP_T                  @KFS7GOLD;
SELECT * FROM FP_BAL_BY_CONS_MT                                                    MINUS SELECT * FROM FP_BAL_BY_CONS_MT                   @KFS7GOLD;
SELECT * FROM FP_BAL_BY_LEVEL_MT                                                   MINUS SELECT * FROM FP_BAL_BY_LEVEL_MT                  @KFS7GOLD;
SELECT * FROM FP_BAL_BY_OBJ_MT                                                     MINUS SELECT * FROM FP_BAL_BY_OBJ_MT                    @KFS7GOLD;
SELECT * FROM FP_BANK_T                                                            MINUS SELECT * FROM FP_BANK_T                           @KFS7GOLD;
SELECT * FROM FP_BDGT_ADJ_DTL_T                                                    MINUS SELECT * FROM FP_BDGT_ADJ_DTL_T                   @KFS7GOLD;
SELECT * FROM FP_CASH_RCPT_DOC_T                                                   MINUS SELECT * FROM FP_CASH_RCPT_DOC_T                  @KFS7GOLD;
SELECT * FROM FP_CHECK_DTL_T                                                       MINUS SELECT * FROM FP_CHECK_DTL_T                      @KFS7GOLD;
SELECT * FROM FP_COIN_DTL_T                                                        MINUS SELECT * FROM FP_COIN_DTL_T                       @KFS7GOLD;
SELECT * FROM FP_CPTL_AST_INFO_DTL_T                                               MINUS SELECT * FROM FP_CPTL_AST_INFO_DTL_T              @KFS7GOLD;
SELECT * FROM FP_CPTL_AST_INFO_T                                                   MINUS SELECT * FROM FP_CPTL_AST_INFO_T                  @KFS7GOLD;
SELECT * FROM FP_CR_CARD_TYP_T                                                     MINUS SELECT * FROM FP_CR_CARD_TYP_T                    @KFS7GOLD;
SELECT * FROM FP_CR_CARD_VNDR_T                                                    MINUS SELECT * FROM FP_CR_CARD_VNDR_T                   @KFS7GOLD;
SELECT * FROM FP_CSH_DRWR_T                                                        MINUS SELECT * FROM FP_CSH_DRWR_T                       @KFS7GOLD;
SELECT * FROM FP_CURRENCY_DTL_T                                                    MINUS SELECT * FROM FP_CURRENCY_DTL_T                   @KFS7GOLD;
SELECT * FROM FP_DEPOSIT_HDR_T                                                     MINUS SELECT * FROM FP_DEPOSIT_HDR_T                    @KFS7GOLD;
SELECT * FROM FP_DISTRIB_DOC_T                                                     MINUS SELECT * FROM FP_DISTRIB_DOC_T                    @KFS7GOLD;
SELECT * FROM FP_DV_DIEM_T                                                         MINUS SELECT * FROM FP_DV_DIEM_T                        @KFS7GOLD;
SELECT * FROM FP_DV_DOC_T                                                          MINUS SELECT * FROM FP_DV_DOC_T                         @KFS7GOLD;
SELECT * FROM FP_DV_EXP_TYP_T                                                      MINUS SELECT * FROM FP_DV_EXP_TYP_T                     @KFS7GOLD;
SELECT * FROM FP_DV_MLG_T                                                          MINUS SELECT * FROM FP_DV_MLG_T                         @KFS7GOLD;
SELECT * FROM FP_DV_NRA_TAX_T                                                      MINUS SELECT * FROM FP_DV_NRA_TAX_T                     @KFS7GOLD;
SELECT * FROM FP_DV_PMT_REAS_T                                                     MINUS SELECT * FROM FP_DV_PMT_REAS_T                    @KFS7GOLD;
SELECT * FROM FP_DV_TRVL_CO_NM_T                                                   MINUS SELECT * FROM FP_DV_TRVL_CO_NM_T                  @KFS7GOLD;
SELECT * FROM FP_FSCL_YR_CTRL_T                                                    MINUS SELECT * FROM FP_FSCL_YR_CTRL_T                   @KFS7GOLD;
SELECT * FROM FP_FUNC_CTRL_CD_T                                                    MINUS SELECT * FROM FP_FUNC_CTRL_CD_T                   @KFS7GOLD;
SELECT * FROM FP_ICR_ADJ_DOC_T                                                     MINUS SELECT * FROM FP_ICR_ADJ_DOC_T                    @KFS7GOLD;
SELECT * FROM FP_INC_CLS_T                                                         MINUS SELECT * FROM FP_INC_CLS_T                        @KFS7GOLD;
SELECT * FROM FP_INT_BILL_DOC_T                                                    MINUS SELECT * FROM FP_INT_BILL_DOC_T                   @KFS7GOLD;
SELECT * FROM FP_INTERIM2_CONS_MT                                                  MINUS SELECT * FROM FP_INTERIM2_CONS_MT                 @KFS7GOLD;
SELECT * FROM FP_MOTD_T                                                            MINUS SELECT * FROM FP_MOTD_T                           @KFS7GOLD;
SELECT * FROM FP_NRA_TAX_PCT_T                                                     MINUS SELECT * FROM FP_NRA_TAX_PCT_T                    @KFS7GOLD;
SELECT * FROM FP_OFST_ACCT_T                                                       MINUS SELECT * FROM FP_OFST_ACCT_T                      @KFS7GOLD;
SELECT * FROM FP_PRCRMNT_DOC_T                                                     MINUS SELECT * FROM FP_PRCRMNT_DOC_T                    @KFS7GOLD;
SELECT * FROM FP_RPT_CD_T                                                          MINUS SELECT * FROM FP_RPT_CD_T                         @KFS7GOLD;
SELECT * FROM FS_DOC_HEADER_T                                                      MINUS SELECT * FROM FS_DOC_HEADER_T                     @KFS7GOLD;
SELECT * FROM FS_OPTION_T                                                          MINUS SELECT * FROM FS_OPTION_T                         @KFS7GOLD;
SELECT * FROM FS_ORIGIN_CODE_T                                                     MINUS SELECT * FROM FS_ORIGIN_CODE_T                    @KFS7GOLD;
SELECT * FROM FS_TAX_REGION_T                                                      MINUS SELECT * FROM FS_TAX_REGION_T                     @KFS7GOLD;
SELECT * FROM FS_TAX_REGION_TYPE_T                                                 MINUS SELECT * FROM FS_TAX_REGION_TYPE_T                @KFS7GOLD;
SELECT * FROM GL_COR_DOC_T                                                         MINUS SELECT * FROM GL_COR_DOC_T                        @KFS7GOLD;
SELECT * FROM GL_ENTRY_T                                                           MINUS SELECT * FROM GL_ENTRY_T                          @KFS7GOLD;
SELECT * FROM GL_OFFSET_DEFN_T                                                     MINUS SELECT * FROM GL_OFFSET_DEFN_T                    @KFS7GOLD;
SELECT * FROM KRNS_LOOKUP_RSLT_T                                                   MINUS SELECT * FROM KRNS_LOOKUP_RSLT_T                  @KFS7GOLD;
SELECT * FROM KRNS_LOOKUP_SEL_T                                                    MINUS SELECT * FROM KRNS_LOOKUP_SEL_T                   @KFS7GOLD;
SELECT * FROM KRNS_MAINT_DOC_ATT_T                                                 MINUS SELECT * FROM KRNS_MAINT_DOC_ATT_T                @KFS7GOLD;
SELECT * FROM KRNS_MAINT_DOC_T                                                     MINUS SELECT * FROM KRNS_MAINT_DOC_T                    @KFS7GOLD;
SELECT * FROM KRNS_SESN_DOC_T                                                      MINUS SELECT * FROM KRNS_SESN_DOC_T                     @KFS7GOLD;
SELECT * FROM KRSB_BAM_PARM_T                                                      MINUS SELECT * FROM KRSB_BAM_PARM_T                     @KFS7GOLD;
SELECT * FROM KRSB_BAM_T                                                           MINUS SELECT * FROM KRSB_BAM_T                          @KFS7GOLD;
SELECT * FROM KRSB_MSG_PYLD_T                                                      MINUS SELECT * FROM KRSB_MSG_PYLD_T                     @KFS7GOLD;
SELECT * FROM KRSB_QRTZ_BLOB_TRIGGERS                                              MINUS SELECT * FROM KRSB_QRTZ_BLOB_TRIGGERS             @KFS7GOLD;
SELECT * FROM KRSB_QRTZ_CALENDARS                                                  MINUS SELECT * FROM KRSB_QRTZ_CALENDARS                 @KFS7GOLD;
SELECT * FROM KRSB_QRTZ_JOB_DETAILS                                                MINUS SELECT * FROM KRSB_QRTZ_JOB_DETAILS               @KFS7GOLD;
SELECT * FROM KRSB_QRTZ_TRIGGERS                                                   MINUS SELECT * FROM KRSB_QRTZ_TRIGGERS                  @KFS7GOLD;
SELECT * FROM KRSB_SVC_DEF_T                                                       MINUS SELECT * FROM KRSB_SVC_DEF_T                      @KFS7GOLD;
SELECT * FROM LD_A21_PRD_STAT_T                                                    MINUS SELECT * FROM LD_A21_PRD_STAT_T                   @KFS7GOLD;
SELECT * FROM LD_A21_REPORT_T                                                      MINUS SELECT * FROM LD_A21_REPORT_T                     @KFS7GOLD;
SELECT * FROM LD_A21_RPT_EARN_PAY_T                                                MINUS SELECT * FROM LD_A21_RPT_EARN_PAY_T               @KFS7GOLD;
SELECT * FROM LD_A21_RPT_TYP_T                                                     MINUS SELECT * FROM LD_A21_RPT_TYP_T                    @KFS7GOLD;
SELECT * FROM LD_BENEFITS_CALC_T                                                   MINUS SELECT * FROM LD_BENEFITS_CALC_T                  @KFS7GOLD;
SELECT * FROM LD_BENEFITS_TYPE_T                                                   MINUS SELECT * FROM LD_BENEFITS_TYPE_T                  @KFS7GOLD;
SELECT * FROM LD_LABOR_OBJ_T                                                       MINUS SELECT * FROM LD_LABOR_OBJ_T                      @KFS7GOLD;
SELECT * FROM LD_LBR_OBJ_BENE_T                                                    MINUS SELECT * FROM LD_LBR_OBJ_BENE_T                   @KFS7GOLD;
SELECT * FROM LD_POS_OBJ_GRP_T                                                     MINUS SELECT * FROM LD_POS_OBJ_GRP_T                    @KFS7GOLD;
SELECT * FROM PDP_ACCTG_CHG_CD_T                                                   MINUS SELECT * FROM PDP_ACCTG_CHG_CD_T                  @KFS7GOLD;
SELECT * FROM PDP_ACH_BNK_T                                                        MINUS SELECT * FROM PDP_ACH_BNK_T                       @KFS7GOLD;
SELECT * FROM PDP_ACH_TRANS_CD_T                                                   MINUS SELECT * FROM PDP_ACH_TRANS_CD_T                  @KFS7GOLD;
SELECT * FROM PDP_ACH_TRANS_TYP_T                                                  MINUS SELECT * FROM PDP_ACH_TRANS_TYP_T                 @KFS7GOLD;
SELECT * FROM PDP_CUST_PRFL_T                                                      MINUS SELECT * FROM PDP_CUST_PRFL_T                     @KFS7GOLD;
SELECT * FROM PDP_DISB_NBR_RNG_T                                                   MINUS SELECT * FROM PDP_DISB_NBR_RNG_T                  @KFS7GOLD;
SELECT * FROM PDP_DISB_TYP_CD_T                                                    MINUS SELECT * FROM PDP_DISB_TYP_CD_T                   @KFS7GOLD;
SELECT * FROM PDP_PAYEE_ACH_ACCT_T                                                 MINUS SELECT * FROM PDP_PAYEE_ACH_ACCT_T                @KFS7GOLD;
SELECT * FROM PDP_PAYEE_TYP_T                                                      MINUS SELECT * FROM PDP_PAYEE_TYP_T                     @KFS7GOLD;
SELECT * FROM PDP_PMT_CHG_CD_T                                                     MINUS SELECT * FROM PDP_PMT_CHG_CD_T                    @KFS7GOLD;
SELECT * FROM PDP_PMT_DTL_T                                                        MINUS SELECT * FROM PDP_PMT_DTL_T                       @KFS7GOLD;
SELECT * FROM PDP_PMT_STAT_CD_T                                                    MINUS SELECT * FROM PDP_PMT_STAT_CD_T                   @KFS7GOLD;
SELECT * FROM PDP_PMT_TYP_T                                                        MINUS SELECT * FROM PDP_PMT_TYP_T                       @KFS7GOLD;
SELECT * FROM PUR_ADDR_TYP_T                                                       MINUS SELECT * FROM PUR_ADDR_TYP_T                      @KFS7GOLD;
SELECT * FROM PUR_AP_CMP_PARM_T                                                    MINUS SELECT * FROM PUR_AP_CMP_PARM_T                   @KFS7GOLD;
SELECT * FROM PUR_AP_ITM_TYP_T                                                     MINUS SELECT * FROM PUR_AP_ITM_TYP_T                    @KFS7GOLD;
SELECT * FROM PUR_AP_ORG_PARM_T                                                    MINUS SELECT * FROM PUR_AP_ORG_PARM_T                   @KFS7GOLD;
SELECT * FROM PUR_AP_RECUR_PMT_FREQ_T                                              MINUS SELECT * FROM PUR_AP_RECUR_PMT_FREQ_T             @KFS7GOLD;
SELECT * FROM PUR_AP_RECUR_PMT_TYP_T                                               MINUS SELECT * FROM PUR_AP_RECUR_PMT_TYP_T              @KFS7GOLD;
SELECT * FROM PUR_BILL_ADDR_T                                                      MINUS SELECT * FROM PUR_BILL_ADDR_T                     @KFS7GOLD;
SELECT * FROM PUR_CARI_T                                                           MINUS SELECT * FROM PUR_CARI_T                          @KFS7GOLD;
SELECT * FROM PUR_CNTCT_TYP_T                                                      MINUS SELECT * FROM PUR_CNTCT_TYP_T                     @KFS7GOLD;
SELECT * FROM PUR_COMM_CONTR_MGR_T                                                 MINUS SELECT * FROM PUR_COMM_CONTR_MGR_T                @KFS7GOLD;
SELECT * FROM PUR_COMM_T                                                           MINUS SELECT * FROM PUR_COMM_T                          @KFS7GOLD;
SELECT * FROM PUR_CONTR_MGR_T                                                      MINUS SELECT * FROM PUR_CONTR_MGR_T                     @KFS7GOLD;
SELECT * FROM PUR_CPTL_AST_SYS_ST_T                                                MINUS SELECT * FROM PUR_CPTL_AST_SYS_ST_T               @KFS7GOLD;
SELECT * FROM PUR_CPTL_AST_SYS_TYP_T                                               MINUS SELECT * FROM PUR_CPTL_AST_SYS_TYP_T              @KFS7GOLD;
SELECT * FROM PUR_DLVY_REQ_DT_REAS_T                                               MINUS SELECT * FROM PUR_DLVY_REQ_DT_REAS_T              @KFS7GOLD;
SELECT * FROM PUR_FND_SRC_T                                                        MINUS SELECT * FROM PUR_FND_SRC_T                       @KFS7GOLD;
SELECT * FROM PUR_ITM_REAS_ADD_T                                                   MINUS SELECT * FROM PUR_ITM_REAS_ADD_T                  @KFS7GOLD;
SELECT * FROM PUR_OWNR_CTGRY_T                                                     MINUS SELECT * FROM PUR_OWNR_CTGRY_T                    @KFS7GOLD;
SELECT * FROM PUR_OWNR_TYP_T                                                       MINUS SELECT * FROM PUR_OWNR_TYP_T                      @KFS7GOLD;
SELECT * FROM PUR_PHN_TYP_T                                                        MINUS SELECT * FROM PUR_PHN_TYP_T                       @KFS7GOLD;
SELECT * FROM PUR_PMT_TERM_TYP_T                                                   MINUS SELECT * FROM PUR_PMT_TERM_TYP_T                  @KFS7GOLD;
SELECT * FROM PUR_PO_ACCT_T                                                        MINUS SELECT * FROM PUR_PO_ACCT_T                       @KFS7GOLD;
SELECT * FROM PUR_PO_CONTR_LANG_T                                                  MINUS SELECT * FROM PUR_PO_CONTR_LANG_T                 @KFS7GOLD;
SELECT * FROM PUR_PO_CST_SRC_T                                                     MINUS SELECT * FROM PUR_PO_CST_SRC_T                    @KFS7GOLD;
SELECT * FROM PUR_PO_QT_LANG_T                                                     MINUS SELECT * FROM PUR_PO_QT_LANG_T                    @KFS7GOLD;
SELECT * FROM PUR_PO_QT_LST_T                                                      MINUS SELECT * FROM PUR_PO_QT_LST_T                     @KFS7GOLD;
SELECT * FROM PUR_PO_QT_LST_VNDR_T                                                 MINUS SELECT * FROM PUR_PO_QT_LST_VNDR_T                @KFS7GOLD;
SELECT * FROM PUR_PO_QT_STAT_T                                                     MINUS SELECT * FROM PUR_PO_QT_STAT_T                    @KFS7GOLD;
SELECT * FROM PUR_PO_T                                                             MINUS SELECT * FROM PUR_PO_T                            @KFS7GOLD;
SELECT * FROM PUR_PO_TRNS_MTHD_T                                                   MINUS SELECT * FROM PUR_PO_TRNS_MTHD_T                  @KFS7GOLD;
SELECT * FROM PUR_PO_VNDR_CHC_T                                                    MINUS SELECT * FROM PUR_PO_VNDR_CHC_T                   @KFS7GOLD;
SELECT * FROM PUR_RCVNG_ADDR_T                                                     MINUS SELECT * FROM PUR_RCVNG_ADDR_T                    @KFS7GOLD;
SELECT * FROM PUR_REQS_ACCT_T                                                      MINUS SELECT * FROM PUR_REQS_ACCT_T                     @KFS7GOLD;
SELECT * FROM PUR_REQS_SRC_T                                                       MINUS SELECT * FROM PUR_REQS_SRC_T                      @KFS7GOLD;
SELECT * FROM PUR_REQS_T                                                           MINUS SELECT * FROM PUR_REQS_T                          @KFS7GOLD;
SELECT * FROM PUR_SHP_PMT_TERM_T                                                   MINUS SELECT * FROM PUR_SHP_PMT_TERM_T                  @KFS7GOLD;
SELECT * FROM PUR_SHP_SPCL_COND_T                                                  MINUS SELECT * FROM PUR_SHP_SPCL_COND_T                 @KFS7GOLD;
SELECT * FROM PUR_SHP_TTL_T                                                        MINUS SELECT * FROM PUR_SHP_TTL_T                       @KFS7GOLD;
SELECT * FROM PUR_SNSTV_DTA_T                                                      MINUS SELECT * FROM PUR_SNSTV_DTA_T                     @KFS7GOLD;
SELECT * FROM PUR_SUPP_DVRST_T                                                     MINUS SELECT * FROM PUR_SUPP_DVRST_T                    @KFS7GOLD;
SELECT * FROM PUR_THRSHLD_T                                                        MINUS SELECT * FROM PUR_THRSHLD_T                       @KFS7GOLD;
SELECT * FROM PUR_VNDR_DTL_T                                                       MINUS SELECT * FROM PUR_VNDR_DTL_T                      @KFS7GOLD;
SELECT * FROM PUR_VNDR_HDR_T                                                       MINUS SELECT * FROM PUR_VNDR_HDR_T                      @KFS7GOLD;
SELECT * FROM PUR_VNDR_INACTV_REAS_T                                               MINUS SELECT * FROM PUR_VNDR_INACTV_REAS_T              @KFS7GOLD;
SELECT * FROM PUR_VNDR_STPLTN_T                                                    MINUS SELECT * FROM PUR_VNDR_STPLTN_T                   @KFS7GOLD;
SELECT * FROM PUR_VNDR_TYP_T                                                       MINUS SELECT * FROM PUR_VNDR_TYP_T                      @KFS7GOLD;
SELECT * FROM QRTZ_BLOB_TRIGGERS                                                   MINUS SELECT * FROM QRTZ_BLOB_TRIGGERS                  @KFS7GOLD;
SELECT * FROM QRTZ_CALENDARS                                                       MINUS SELECT * FROM QRTZ_CALENDARS                      @KFS7GOLD;
SELECT * FROM QRTZ_JOB_DETAILS                                                     MINUS SELECT * FROM QRTZ_JOB_DETAILS                    @KFS7GOLD;
SELECT * FROM QRTZ_TRIGGERS                                                        MINUS SELECT * FROM QRTZ_TRIGGERS                       @KFS7GOLD;
SELECT * FROM SH_ACCT_PERIOD_T                                                     MINUS SELECT * FROM SH_ACCT_PERIOD_T                    @KFS7GOLD;
SELECT * FROM SH_BUILDING_T                                                        MINUS SELECT * FROM SH_BUILDING_T                       @KFS7GOLD;
SELECT * FROM SH_ROOM_T                                                            MINUS SELECT * FROM SH_ROOM_T                           @KFS7GOLD;
SELECT * FROM SH_UNIV_DATE_T                                                       MINUS SELECT * FROM SH_UNIV_DATE_T                      @KFS7GOLD;
SELECT * FROM SH_UOM_T                                                             MINUS SELECT * FROM SH_UOM_T                            @KFS7GOLD;