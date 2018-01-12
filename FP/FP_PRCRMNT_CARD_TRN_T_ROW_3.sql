set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/FP_PRCRMNT_CARD_TRN_T_3.csv

select count(*) from FP_PRCRMNT_CARD_TRN_T;

spool off
