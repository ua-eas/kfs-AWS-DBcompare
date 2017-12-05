SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/kfprd.xls

select * from kulowner.AP_CRDT_MEMO_STAT_T@KFS3IMP
order by CRDT_MEMO_STAT_CD, OBJ_ID asc;



spool off
