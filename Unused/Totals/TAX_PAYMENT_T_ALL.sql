set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/kfdvu_TAX_PAYMENT_T.xls
select * from TAX_PAYMENT_T;
spool off
