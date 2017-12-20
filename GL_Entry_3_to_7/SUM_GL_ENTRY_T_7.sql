set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off
set numwidth 20

spool ./data/sum_all7.xls

select sum(TRN_LDGR_ENTR_AMT)  from  GL_ENTRY_T;

spool off

