set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/kfimp.xls

select * from kulowner.AP_CRDT_MEMO_STAT_T
order by CRDT_MEMO_STAT_CD, OBJ_ID asc;



spool off
