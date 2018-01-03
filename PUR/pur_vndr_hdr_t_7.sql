set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/pur_vndr_7.xls

select 
VNDR_HDR_GNRTD_ID,
OBJ_ID,
VER_NBR,
VNDR_TYP_CD,
VNDR_TAX_TYP_CD,
VNDR_OWNR_CD,
VNDR_OWNR_CTGRY_CD,
VNDR_FWT_BEG_DT,
VNDR_FWT_END_DT,
VNDR_W9_RCVD_IND,
VNDR_W8_RCVD_IND,
VNDR_DEBRD_IND,
VNDR_FRGN_IND
from kulowner.PUR_VNDR_HDR_T
order by VNDR_HDR_GNRTD_ID, OBJ_ID, VER_NBR ASC;



spool off

