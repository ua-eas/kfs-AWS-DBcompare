set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/7.xls

select * from FP_PRCRMNT_CARD_HLDR_DTL_T;

spool off
