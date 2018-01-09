set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/CM_AST_PMT_DTL_T_7.xls

select * from CM_AST_PMT_DTL_T;

spool off
