set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/PUR_PO_T_ROWS_7.xls

select count(*) from PUR_PO_T;


spool off

