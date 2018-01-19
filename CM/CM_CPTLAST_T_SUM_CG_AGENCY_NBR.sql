set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off
set numwidth 20


SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/CM_CPTLAST_T_AGENCY_NBR_3.csv

select SUM(CG_AGENCY_NBR) from kulowner.CM_CPTLAST_T;

spool off

spool ./data/CM_CPTLAST_T_CG_AGENCY_NBR_7.csv

select SUM(CG_AGENCY_NBR) from kulowner.CM_CPTLAST_T@DBLINK;

spool off
