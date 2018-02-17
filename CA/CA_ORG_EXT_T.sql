set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/CA_ORG_EXT_T_3.csv

select * from CA_ORG_EXT_T order by 1 ASC;

spool off


spool ./data/CA_ORG_EXT_T_7.csv

select  * from CA_ORG_EXT_T@DBLINK order by 1 ASC;

spool off
