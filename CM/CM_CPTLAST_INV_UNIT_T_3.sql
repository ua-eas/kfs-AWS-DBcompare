set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/CM_CPTLAST_INV_UNIT_T_3.xls

select * from CM_CPTLAST_INV_UNIT_T;

spool off