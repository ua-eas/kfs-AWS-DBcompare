set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     


spool ./data/sum_all7.xls

select SUM(TRN_ORIG_CRNCY_AMT), SUM(TRN_STLMNT_AMT), SUM(TRN_SALES_TAX_AMT), SUM(TRN_TOT_AMT), SUM(TRN_EDITABLE_SALES_TAX_AMT) from FP_PRCRMNT_TRN_DTL_T;

spool off

