set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/7.xls

select sum(DV_CHK_TOT_AMT) from FP_DV_DOC_T;

spool off
