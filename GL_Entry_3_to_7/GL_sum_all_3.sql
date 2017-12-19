set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     


spool ./data/sum_all3.csv

select sum(TRN_LDGR_ENTR_AMT)  from  GL_ENTRY_T;

spool off

