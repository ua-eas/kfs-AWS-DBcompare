set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off    
set numwidth 20

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/CM_AAST_PAYMENT_T_3.csv

select SUM(CPTLAST_NBR),
SUM(ACCT_CHARGE_AMT),
SUM(AST_DEPR1_BASE_AMT),
SUM(AST_ACUM_DEPR1_AMT),
SUM(AST_PRVYRDEPR1_AMT),
SUM(AST_PRD1_DEPR1_AMT),
SUM(AST_PRD2_DEPR1_AMT),
SUM(AST_PRD3_DEPR1_AMT),
SUM(AST_PRD4_DEPR1_AMT),
SUM(AST_PRD5_DEPR1_AMT),
SUM(AST_PRD6_DEPR1_AMT),
SUM(AST_PRD7_DEPR1_AMT),
SUM(AST_PRD8_DEPR1_AMT),
SUM(AST_PRD9_DEPR1_AMT),
SUM(AST_PRD10DEPR1_AMT),
SUM(AST_PRD11DEPR1_AMT),
SUM(AST_PRD12DEPR1_AMT)
from CM_AST_PAYMENT_T;

spool off


spool ./data/CM_AAST_PAYMENT_T_7.csv

select SUM(CPTLAST_NBR),
SUM(ACCT_CHARGE_AMT),
SUM(AST_DEPR1_BASE_AMT),
SUM(AST_ACUM_DEPR1_AMT),
SUM(AST_PRVYRDEPR1_AMT),
SUM(AST_PRD1_DEPR1_AMT),
SUM(AST_PRD2_DEPR1_AMT),
SUM(AST_PRD3_DEPR1_AMT),
SUM(AST_PRD4_DEPR1_AMT),
SUM(AST_PRD5_DEPR1_AMT),
SUM(AST_PRD6_DEPR1_AMT),
SUM(AST_PRD7_DEPR1_AMT),
SUM(AST_PRD8_DEPR1_AMT),
SUM(AST_PRD9_DEPR1_AMT),
SUM(AST_PRD10DEPR1_AMT),
SUM(AST_PRD11DEPR1_AMT),
SUM(AST_PRD12DEPR1_AMT)
from CM_AST_PAYMENT_T@DBLINK;

spool off
