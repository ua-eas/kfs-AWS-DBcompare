et colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     
set numwidth 20

spool ./data/gl_balance_t_7.csv

select 
SUM(ACLN_ANNL_BAL_AMT), 
SUM(FIN_BEG_BAL_LN_AMT), 
SUM(CONTR_GR_BB_AC_AMT), 
SUM(MO1_ACCT_LN_AMT), 
SUM(MO2_ACCT_LN_AMT), 
SUM(MO3_ACCT_LN_AMT), 
SUM(MO4_ACCT_LN_AMT), 
SUM(MO5_ACCT_LN_AMT), 
SUM(MO6_ACCT_LN_AMT), 
SUM(MO7_ACCT_LN_AMT), 
SUM(MO8_ACCT_LN_AMT), 
SUM(MO9_ACCT_LN_AMT), 
SUM(MO10_ACCT_LN_AMT), 
SUM(MO11_ACCT_LN_AMT), 
SUM(MO12_ACCT_LN_AMT),
SUM(MO13_ACCT_LN_AMT)
from gl_balance_t;

spool off




