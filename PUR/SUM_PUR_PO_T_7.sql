set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/PUR_PO_T_SUM_7.csv

select SUM(RECUR_PMT_AMT), SUM(INIT_PMT_AMT), SUM(FNL_PMT_AMT) from PUR_PO_T;


spool off

