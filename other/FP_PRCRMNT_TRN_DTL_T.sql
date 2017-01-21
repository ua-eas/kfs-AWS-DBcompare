set markup html on spool on
spool C:\tounou\data\kfdvu_FP_PRCRMNT_TRN_DTL_T.xls
select * from FP_PRCRMNT_TRN_DTL_T;
spool off
