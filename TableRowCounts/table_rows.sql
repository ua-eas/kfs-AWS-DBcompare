set colsep ','    
set pagesize 0   
set trimspool on 
set headsep off 

spool /home/mhirst/DB_Validation/query_results/simple.xls

select table_name, num_rows from all_tables; 

spool off