set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/FS_TAX_REGION_RATE_T_7.xls

select * from FS_TAX_REGION_RATE_T;

spool off
