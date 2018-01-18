set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/FP_PRCRMNT_CARD_TRN_T_3.csv

select * from kulowner.FP_PRCRMNT_CARD_TRN_T where  TRANSACTION_DT >= sysdate-90   order by 1 ASC;

spool off

spool ./data/FP_PRCRMNT_CARD_TRN_T_7.csv

select * from kulowner.FP_PRCRMNT_CARD_TRN_MT@DBLINK where  TRANSACTION_DT >= sysdate-90   order by 1 ASC;

spool off