set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/kfprd.xls

select * from kulowner.PUR_VNDR_HDR_T@uazkfprd
order by VNDR_TAX_NBR, VNDR_HDR_GNRTD_ID, OBJ_ID, VER_NBR ASC;


spool off


