set colsep ','
set pagesize 0
set trimspool on
set headsep off
set numwidth 20

SELECT CURRENT_TIMESTAMP FROM DUAL;

--KIM_TYP_ID is not included here because it is modified during the KFS 3 -> KFS 7 process.

spool ./data/ALL_KRIM_GRP_T_3.csv
SELECT GRP_ID, OBJ_ID, VER_NBR, GRP_NM, NMSPC_CD, GRP_DESC, ACTV_IND, LAST_UPDT_DT FROM KRIM_GRP_T ORDER BY OBJ_ID;
spool off

spool ./data/ALL_KRIM_GRP_T_7.csv
SELECT GRP_ID, OBJ_ID, VER_NBR, GRP_NM, NMSPC_CD, GRP_DESC, ACTV_IND, LAST_UPDT_DT FROM rice.KRIM_GRP_T@DBLINK ORDER BY OBJ_ID;
spool off
