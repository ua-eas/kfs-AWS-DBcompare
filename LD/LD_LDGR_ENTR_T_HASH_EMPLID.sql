set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off    
set numwidth 20


spool /home/mhirst/DB_Validation/query_results/3.csv

SELECT EMPLID   FROM LD_LDGR_ENTR_T WHERE ORA_HASH(CONCAT(EMPLID, VER_NBR), 99, 5) = 0;

spool off


spool /home/mhirst/DB_Validation/query_results/7.csv

SELECT EMPLID   FROM LD_LDGR_ENTR_T@KFS7VAL WHERE ORA_HASH(CONCAT(EMPLID, VER_NBR), 99, 5) = 0;

spool off

