ELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/Feb_kfimp_GL_ENTRY_T.xls

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
FS_REF_ORIGIN_CD from kulowner.GL_ENTRY_T 
WHERE TRANSACTION_DT BETWEEN TO_DATE ('2016/02/01', 'yyyy/mm/dd')
AND TO_DATE ('2016/01/29', 'yyyy/mm/dd')
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


