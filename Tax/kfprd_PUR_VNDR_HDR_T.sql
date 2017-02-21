SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/kfprd.xls

select * from kulowner.PUR_VNDR_HDR_T@uazkfprd
order by VNDR_HDR_GNRTD_ID, OBJ_ID, VER_NBR ASC;


spool off


