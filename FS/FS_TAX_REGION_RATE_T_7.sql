set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/7.xls

select * from FS_TAX_REGION_RATE_T;

spool off
