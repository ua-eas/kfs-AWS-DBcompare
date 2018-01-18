set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/FP_PRCRMNT_TRN_DTL_T_3.csv

select count(*) from kulowner.FP_PRCRMNT_TRN_DTL_T;

spool off

spool ./data/FP_PRCRMNT_TRN_DTL_T_7.csv

select count(*) from kulowner.FP_PRCRMNT_TRN_DTL_T@DBLINK;

spool off