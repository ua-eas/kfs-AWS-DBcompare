set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/PUR_PO_T_90_DAY_3.csv

select * from PUR_PO_T where PO_CRTE_DT >= sysdate-90 order by 1 ASC;


spool off

