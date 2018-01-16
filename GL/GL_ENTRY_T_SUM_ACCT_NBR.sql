set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off
set numwidth 20    


spool ./data/GL_ENTRY_T_3.csv

select SUM(ACCOUNT_NBR) from GL_ENTRY_T;

spool off

spool ./data/GL_ENTRY_T_7.csv

select SUM(ACCOUNT_NBR) from GL_ENTRY_T@DBLINK;

spool off