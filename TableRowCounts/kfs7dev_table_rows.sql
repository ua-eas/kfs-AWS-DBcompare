set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/kfs7dev.xls

select table_name, num_rows from all_tables; 

spool off
