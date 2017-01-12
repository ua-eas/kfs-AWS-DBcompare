-- Returns the number of records in DBA 
2  select count(table_name) from dba_tables where table_name not like '%$%'; 
3 
4 -- Return list of all tables 
5  
6 select table_name from dba_tables where table_name not like '%$%' order by table_name; 
