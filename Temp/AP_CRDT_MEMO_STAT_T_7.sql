SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/kf7.xls

select * from kulowner.AP_CRDT_MEMO_STAT_T
order by CRDT_MEMO_STAT_CD, OBJ_ID asc;



spool off
