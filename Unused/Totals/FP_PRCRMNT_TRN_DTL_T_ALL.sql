set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/kfdvu_FP_PRCRMNT_TRN_DTL_T.xls
select * from FP_PRCRMNT_TRN_DTL_T;
spool off
