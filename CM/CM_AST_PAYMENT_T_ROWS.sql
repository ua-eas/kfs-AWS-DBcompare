set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/CM_AST_PAYMENT_T_3.csv

select count(*) from CM_AST_PAYMENT_T;

spool off


spool ./data/CM_AST_PAYMENT_T_7.csv

select count(*) from CM_AST_PAYMENT_T@DBLINK;

spool off
