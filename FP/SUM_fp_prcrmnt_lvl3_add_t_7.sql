set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off
set numwidth 20     


spool ./data/FP_PRCRMNT_LVL3_ADD_T_SUM_7.xls

select SUM(TAX_AMT), SUM(TAX_RATE), SUM(DISCOUNT_AMT), SUM(FREIGHT_AMT), SUM(DUTY_AMT) from FP_PRCRMNT_LVL3_ADD_T;

spool off

