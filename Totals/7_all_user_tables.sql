SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/kfs7.xls

select count(*) from user_tables;

spool off
