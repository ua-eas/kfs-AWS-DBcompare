set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/kfimp1.xls

select * from kulowner.FP_PRCRMNT_LVL3_ADD_T
WHERE ORDER_DT BETWEEN TO_DATE ('2001/01/01', 'yyyy/mm/dd')
AND TO_DATE ('2013/12/31', 'yyyy/mm/dd')
order by FDOC_NBR, OBJ_ID, VER_NBR,DEST_POSTAL asc;



spool off
