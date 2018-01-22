set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/LD_LDGR_ENTR_T_ROW_3.csv


select count(*) from LD_LDGR_ENTR_T order by 1 ASC;

spool off

spool ./data/LD_LDGR_ENTR_T_ROW_7.csv


select count(*) from LD_LDGR_ENTR_T@DBLINK order by 1 ASC;

spool off