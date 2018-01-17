set colsep ','
set pagesize 0
set trimspool on
set headsep off
set numwidth 20

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/ALL_KRNS_MAINT_DOC_T_3.csv
SELECT * FROM KRNS_MAINT_DOC_T ORDER BY OBJ_ID;
spool off

spool ./data/ALL_KRNS_MAINT_DOC_T_7.csv
SELECT * FROM KRNS_MAINT_DOC_T@DBLINK ORDER BY OBJ_ID;
spool off



spool ./data/ROW_COUNT_KRNS_MAINT_DOC_T_3.csv
SELECT COUNT(*) FROM KRNS_MAINT_DOC_T;
spool off

spool ./data/ROW_COUNT_KRNS_MAINT_DOC_T_7.csv
SELECT COUNT(*) FROM KRNS_MAINT_DOC_T@DBLINK;
spool off


