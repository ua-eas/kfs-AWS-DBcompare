set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off
set numwidth 20    


spool ./data/GL_ENTRY_T_3.csv

select sum(TRN_LDGR_ENTR_AMT)  from  GL_ENTRY_T;

spool off

