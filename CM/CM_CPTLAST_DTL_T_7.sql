set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/CM_CPTLAST_DTL_T_7.csv

select * from CM_CPTLAST_DTL_T;

spool off
