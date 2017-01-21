set markup html on spool on
spool C:\tounou\data\kfimp_AP_CRDT_MEMO_STAT_T.xls
select * from AP_CRDT_MEMO_STAT_T;
spool off
