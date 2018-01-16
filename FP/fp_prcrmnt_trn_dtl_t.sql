set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/FP_PRCRMNT_TRN_DTL_T_3.csv

select * from kulowner.FP_PRCRMNT_TRN_DTL_T
WHERE TRANSACTION_DT BETWEEN TO_DATE ('2017/01/01', 'yyyy/mm/dd')
AND TO_DATE ('2017/02/07', 'yyyy/mm/dd')
order by FDOC_NBR,OBJ_ID,VER_NBR,TRN_REF_NBR,TRN_ORIG_CRNCY_AMT asc;




spool off

spool ./data/FP_PRCRMNT_TRN_DTL_T_7.csv

select * from kulowner.FP_PRCRMNT_TRN_DTL_T@DBLINK
WHERE TRANSACTION_DT BETWEEN TO_DATE ('2017/01/01', 'yyyy/mm/dd')
AND TO_DATE ('2017/02/07', 'yyyy/mm/dd')
order by FDOC_NBR,OBJ_ID,VER_NBR,TRN_REF_NBR,TRN_ORIG_CRNCY_AMT asc;




spool off
