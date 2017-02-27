SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/kfimp.xls

select * from kulowner.FP_PRCRMNT_LVL3_ADD_T
WHERE TRANSACTION_DT BETWEEN TO_DATE ('2017/01/01', 'yyyy/mm/dd')
AND TO_DATE ('2017/03/01', 'yyyy/mm/dd')
order by FDOC_NBR, OBJ_ID, VER_NBR,DEST_POSTAL asc;



spool off
