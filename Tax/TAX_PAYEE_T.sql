set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/TAX_PAYEE_T_3.csv


select count(1) from KULOWNER.TAX_PAYEE_T;
select PAYEE_ID
HDR_VNDR_TYP_CD,
HDR_VNDR_OWNR_CD,                   
HDR_VNDR_OWNR_CTGRY_CD,
DTL_VNDR_NM, 
VNDR_NUM,           
VNDR_FRGN_IND,
ADDR_VNDR_ADDR_TYP_CD,
ADDR_VNDR_LN1_ADDR,         
ADDR_VNDR_LN2_ADDR,             
ADDR_VNDR_CTY_NM,            
ADDR_VNDR_ST_CD,                
ADDR_VNDR_ZIP_CD,                
ADDR_VNDR_CNTRY_CD,
VNDR_FWT_BEG_DT,                       
VNDR_FWT_END_DT,                          
TAX_YEAR,            
CORRECTION_IND,
EXCLUDE_IND,            
VNDR_HDR_GNRTD_ID,
VNDR_DTL_ASND_ID,                  
OBJ_ID,         
VER_NBR 
from KULOWNER.tax_payee_t order by payee_id , VNDR_HDR_GNRTD_ID asc;

spool off


spool ./data/TAX_PAYEE_T_7.csv

select count(1) from KULOWNER.TAX_PAYEE_T@DBLINK;
select PAYEE_ID
HDR_VNDR_TYP_CD,
HDR_VNDR_OWNR_CD,                   
HDR_VNDR_OWNR_CTGRY_CD,
DTL_VNDR_NM, 
VNDR_NUM,           
VNDR_FRGN_IND,
ADDR_VNDR_ADDR_TYP_CD,
ADDR_VNDR_LN1_ADDR,         
ADDR_VNDR_LN2_ADDR,             
ADDR_VNDR_CTY_NM,            
ADDR_VNDR_ST_CD,                
ADDR_VNDR_ZIP_CD,                
ADDR_VNDR_CNTRY_CD,
VNDR_FWT_BEG_DT,                       
VNDR_FWT_END_DT,                          
TAX_YEAR,            
CORRECTION_IND,
EXCLUDE_IND,            
VNDR_HDR_GNRTD_ID,
VNDR_DTL_ASND_ID,                  
OBJ_ID,         
VER_NBR 
from KULOWNER.tax_payee_t@DBLINK order by payee_id , VNDR_HDR_GNRTD_ID asc;

spool off