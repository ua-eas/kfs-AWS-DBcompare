set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/PRJE_ACCT_LINE_T_3.csv

select * from PRJE_ACCT_LINE_T;

spool off

spool ./data/PRJE_ACCT_LINE_T_7.csv

select * from PRJE_ACCT_LINE_T@DBLINK;

spool off