set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/FP_CR_CARD_DTL_T_3.csv

select FDOC_NBR,FDOC_TYP_CD,FDOC_LINE_NBR,OBJ_ID,VER_NBR,FDOC_CCRD_TYP_CD,FDOC_CCRD_VNDR_NBR,FDOC_CCRD_DPST_DT,FDOC_CCRD_DREF_NBR,FDOC_CCRD_DPST_AMT from FP_CR_CARD_DTL_T;

spool off

spool ./data/FP_CR_CARD_DTL_T_7.csv

select FDOC_NBR,FDOC_TYP_CD,FDOC_LINE_NBR,OBJ_ID,VER_NBR,FDOC_CCRD_TYP_CD,FDOC_CCRD_VNDR_NBR,FDOC_CCRD_DPST_DT,FDOC_CCRD_DREF_NBR,FDOC_CCRD_DPST_AMT from FP_CR_CARD_DTL_T@DBLINK;

spool off