SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/kfprd.xls

select * from kulowner.FP_PRCRMNT_LVL3_ADD_T@uazkfprd
order by FDOC_NBR, OBJ_ID,VER_NBR,DEST_POSTAL  asc;



spool off

