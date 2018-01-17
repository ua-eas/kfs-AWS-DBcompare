set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/PRJE_BASE_ACCOUNT_T_3.csv

select * from PRJE_BASE_ACCOUNT_T;

spool off

spool ./data/PRJE_BASE_ACCOUNT_T_7.csv

select * from PRJE_BASE_ACCOUNT_T@DBLINK;

spool off