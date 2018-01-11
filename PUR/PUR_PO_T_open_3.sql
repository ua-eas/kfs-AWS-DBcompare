set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/3.csv

select count(*) from PUR_PO_T where PO_STAT_CD = 'OPEN';


spool off

