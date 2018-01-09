set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/AP_PMT_RQST_T_SUM_7.xls

select SUM(VNDR_INV_AMT), SUM(SPCL_W4_INC_AMT) from AP_PMT_RQST_T;

spool off
