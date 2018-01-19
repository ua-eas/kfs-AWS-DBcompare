set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off
set numwidth 20    


spool ./data/FP_PRCRMNT_TRN_DTL_T_SUM_3.csv

select SUM(TRN_ORIG_CRNCY_AMT), SUM(TRN_STLMNT_AMT), SUM(TRN_SALES_TAX_AMT), SUM(TRN_TOT_AMT), SUM(TRN_EDITABLE_SALES_TAX_AMT) from FP_PRCRMNT_TRN_DTL_T;

spool off

spool ./data/FP_PRCRMNT_TRN_DTL_T_SUM_7.csv

select SUM(TRN_ORIG_CRNCY_AMT), SUM(TRN_STLMNT_AMT), SUM(TRN_SALES_TAX_AMT), SUM(TRN_TOT_AMT), SUM(TRN_EDITABLE_SALES_TAX_AMT) from FP_PRCRMNT_TRN_DTL_T@DBLINK;

spool off
