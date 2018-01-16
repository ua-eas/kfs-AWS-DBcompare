set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off
set numwidth 20

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/AP_PMT_RQST_T_SUM_PO_3.csv

select SUM(PO_ID) from AP_PMT_RQST_T;


spool off

spool ./data/AP_PMT_RQST_T_SUM_PO_7.csv

select SUM(PO_ID) from AP_PMT_RQST_T@DBLINK;


spool off
