set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;

spool ./data/kfprd.xls

select UNIV_FISCAL_YR,
TRN_LDGR_ENTR_AMT,
FIN_BALANCE_TYP_CD,
FDOC_REF_NBR,
ACCOUNT_NBR,
FIN_OBJECT_CD,
TRN_ENTR_SEQ_NBR,
UNIV_FISCAL_PRD_CD,
FIN_COA_CD,
SUB_ACCT_NBR,
FIN_SUB_OBJ_CD,
FIN_OBJ_TYP_CD,
FDOC_TYP_CD,
FS_ORIGIN_CD,
FDOC_NBR,
TRN_LDGR_ENTR_DESC,
TRN_DEBIT_CRDT_CD,
TRANSACTION_DT,
ORG_DOC_NBR,
PROJECT_CD,
ORG_REFERENCE_ID,
FDOC_REF_TYP_CD,
FS_REF_ORIGIN_CD 
from kulowner.GL_ENTRY_T@uazkfprd 
WHERE TRANSACTION_DT BETWEEN TO_DATE ('YEAR/04/01', 'yyyy/mm/dd')
AND TO_DATE ('YEAR/04/30', 'yyyy/mm/dd')
order by UNIV_FISCAL_YR,
TRN_LDGR_ENTR_AMT,
FIN_BALANCE_TYP_CD,
FDOC_REF_NBR,
ACCOUNT_NBR,
FIN_OBJECT_CD,
TRN_ENTR_SEQ_NBR,
UNIV_FISCAL_PRD_CD,
FIN_COA_CD,
SUB_ACCT_NBR,
FIN_SUB_OBJ_CD,
FIN_OBJ_TYP_CD,
FDOC_TYP_CD,
FS_ORIGIN_CD,
FDOC_NBR,
TRN_LDGR_ENTR_DESC,
TRN_DEBIT_CRDT_CD,
TRANSACTION_DT,
ORG_DOC_NBR,
PROJECT_CD,
ORG_REFERENCE_ID,
FDOC_REF_TYP_CD,
FS_REF_ORIGIN_CD ASC;
spool off

