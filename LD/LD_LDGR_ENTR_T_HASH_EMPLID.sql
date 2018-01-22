set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off    
set numwidth 20


spool ./data/LD_LDGR_ENTR_T_HASH_EMPID_3.csv

SELECT EMPLID   FROM LD_LDGR_ENTR_T WHERE ORA_HASH(CONCAT(EMPLID, VER_NBR), 99, 5) = 0;

spool off


spool ./data/LD_LDGR_ENTR_T_HASH_EMPID_7.csv

SELECT EMPLID   FROM LD_LDGR_ENTR_T@DBLINK WHERE ORA_HASH(CONCAT(EMPLID, VER_NBR), 99, 5) = 0;

spool off

