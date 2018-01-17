et colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     
set numwidth 20


spool ./data/CHECK_RECONCILIATION_T_3.csv

select count(*) CHECK_RECONCILIATION_T;

spool off




spool ./data/CHECK_RECONCILIATION_T_7.csv

select count(*) CHECK_RECONCILIATION_T@DBLINK;

spool off