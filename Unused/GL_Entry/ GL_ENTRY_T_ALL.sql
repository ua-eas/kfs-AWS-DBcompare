set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/kfdvu_GL_ENTRY_T.xls
select * from GL_ENTRY_T;
spool off
