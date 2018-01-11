set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/CM_CPTLAST_AWARD_HIST_T_3.csv

select * from CM_CPTLAST_AWARD_HIST_T;

spool off
