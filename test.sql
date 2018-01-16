set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/3.csv

select * from FP_PRCRMNT_CARD_HLDR_DTL_T;

spool off


spool ./data/7.csv

select * from FP_PRCRMNT_CARD_HLDR_DTL_T@KFS7GOLD;

spool off