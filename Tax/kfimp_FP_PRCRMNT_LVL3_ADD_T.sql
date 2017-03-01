SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/kfimp1.xls

select * from kulowner.FP_PRCRMNT_LVL3_ADD_T
WHERE ORDER_DT BETWEEN TO_DATE ('2001/01/01', 'yyyy/mm/dd')
AND TO_DATE ('2014/12/31', 'yyyy/mm/dd')
order by FDOC_NBR, OBJ_ID, VER_NBR,DEST_POSTAL asc;



spool off
