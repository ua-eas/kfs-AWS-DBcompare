set colsep ','
set pagesize 0
set trimspool on
set headsep off
set numwidth 20

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/ALL_FP_CHECK_DTL_T_3.csv
SELECT * FROM FP_CHECK_DTL_T ORDER BY OBJ_ID;
spool off

spool ./data/ALL_FP_CHECK_DTL_T_7.csv
SELECT * FROM FP_CHECK_DTL_T@DBLINK ORDER BY OBJ_ID;
spool off





