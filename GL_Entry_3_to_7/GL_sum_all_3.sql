set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     
set numformat 99999999999 


spool ./data/sum_all3.xls

select sum(TRN_LDGR_ENTR_AMT)  from  GL_ENTRY_T;

spool off

