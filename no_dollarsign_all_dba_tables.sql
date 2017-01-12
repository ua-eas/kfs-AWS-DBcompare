-- Returns the number of records in DBA 
select count(table_name) from dba_tables where table_name not like '%$%'; 
 
-- Return list of all tables 
  
select table_name from dba_tables where table_name not like '%$%' order by table_name; 
