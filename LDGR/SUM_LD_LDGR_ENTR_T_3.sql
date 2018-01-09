set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off    
set numwidth 20


spool ./data/LD_LDGR_ENTR_T_3.xls

select SUM(TRN_LDGR_ENTR_AMT) from LD_LDGR_ENTR_T;

spool off


