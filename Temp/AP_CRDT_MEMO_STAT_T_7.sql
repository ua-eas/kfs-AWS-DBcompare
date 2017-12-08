SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/DEPR_AP_CRDT_MEMO_STAT_T.xls

select * from kulowner.DEPR_AP_CRDT_MEMO_STAT_T
order by CRDT_MEMO_STAT_CD, OBJ_ID asc;



spool off
