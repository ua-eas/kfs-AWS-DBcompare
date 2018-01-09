set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off
set numwidth 20

spool ./data/GL_ENTRY_T_7.xls

select sum(TRN_LDGR_ENTR_AMT)  from  GL_ENTRY_T;

spool off

