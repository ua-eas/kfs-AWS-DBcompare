-- Returns the number of records in DBA
 select count(table_name) from all_tables where table_name not like '%$%'and table_name not like '%SDO%';

-- Return list of all tables

select table_name from all_tables where table_name not like '%$%'and table_name not like '%SDO%' order by table_name;
