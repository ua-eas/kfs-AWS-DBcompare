set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/AP_PMT_RQST_T_SUM_PO_3.xls

select SUM(PO_ID) from AP_PMT_RQST_T;


spool off
