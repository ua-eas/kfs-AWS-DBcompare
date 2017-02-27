SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/kfprd.xls

select * from kulowner.FP_PRCRMNT_LVL3_ADD_T@uazkfprd
WHERE TRANSACTION_DT BETWEEN TO_DATE ('2017/01/01', 'yyyy/mm/dd')
AND TO_DATE ('2017/02/27', 'yyyy/mm/dd')
order by FDOC_NBR, OBJ_ID,VER_NBR,DEST_POSTAL  asc;



spool off

