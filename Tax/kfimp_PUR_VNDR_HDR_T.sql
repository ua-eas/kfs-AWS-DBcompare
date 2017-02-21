SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/kfimp.xls

select * from kulowner.PUR_VNDR_HDR_T
order by VNDR_TAX_NBR, VNDR_HDR_GNRTD_ID, OBJ_ID, VER_NBR ASC;


spool off
