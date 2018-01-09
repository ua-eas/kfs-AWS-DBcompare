set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/CA_ACCOUNT_T_7.xls

select * from CA_ACCOUNT_T;

spool off
