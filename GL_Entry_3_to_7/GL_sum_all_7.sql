set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     


spool /home/mhirst/DB_Validation/query_results/sum_all7.csv

select sum(TRN_LDGR_ENTR_AMT)  from  GL_ENTRY_T;

spool off

