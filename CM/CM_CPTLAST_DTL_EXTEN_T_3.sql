set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/3.xls

select count(*) from CM_CPTLAST_DTL_EXTEN_T

spool off
