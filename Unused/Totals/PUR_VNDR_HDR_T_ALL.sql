set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/pur_vndr_7.xls

select * from PUR_VNDR_HDR_T;
order by VNDR_TAX_NBR, VNDR_HDR_GNRTD_ID, OBJ_ID, VER_NBR ASC;

spool off
