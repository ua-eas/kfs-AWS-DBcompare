select count(table_name) from all_dba_tables where table_name not like '%$%';
