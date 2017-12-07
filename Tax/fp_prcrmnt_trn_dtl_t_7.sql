SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/fp_proc_7.xls

select * from kulowner.FP_PRCRMNT_TRN_DTL_T
WHERE TRANSACTION_DT BETWEEN TO_DATE ('YEAR/01/01', 'yyyy/mm/dd')
AND TO_DATE ('YEAR/02/28', 'yyyy/mm/dd')
order by FDOC_NBR,OBJ_ID,VER_NBR,TRN_REF_NBR,TRN_ORIG_CRNCY_AMT asc;




spool off

