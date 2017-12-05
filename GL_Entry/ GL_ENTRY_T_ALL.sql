set markup html on spool on
spool ./data/kfdvu_GL_ENTRY_T.xls
select * from GL_ENTRY_T;
spool off
