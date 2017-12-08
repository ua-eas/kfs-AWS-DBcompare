set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/kfprd.xls

select * from kulowner.FP_PRCRMNT_TRN_DTL_T@uazkfprd
WHERE TRANSACTION_DT BETWEEN TO_DATE ('YEAR/01/01', 'yyyy/mm/dd')
AND TO_DATE ('YEAR/02/28', 'yyyy/mm/dd')
order by FDOC_NBR,OBJ_ID,VER_NBR,TRN_REF_NBR,TRN_ORIG_CRNCY_AMT asc;




spool off

