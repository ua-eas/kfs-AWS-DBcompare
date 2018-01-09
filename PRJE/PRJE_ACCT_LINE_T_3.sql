set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/PRJE_ACCT_LINE_T_3.xls

select * from PRJE_ACCT_LINE_T;

spool off
