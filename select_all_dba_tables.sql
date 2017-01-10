-- Returns the number of records in DBA
select count(*) from dba_tables;

-- Return list of all tables
select table_name from dba_tables order by table_name;
