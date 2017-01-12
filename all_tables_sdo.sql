-- Returns the number of records in All_tables
 select count(table_name) from all_tables where table_name like '%sdo%';

-- Return list of all tables

select table_name from all_tables where table_name like '%sdo%' order by table_name;
