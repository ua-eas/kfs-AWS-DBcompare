et colsep ','     
set pagesize 0   
set trimspool on 
set headsep off
set numwidth 20    


spool ./data/TAX_PAYMENT_T_SUM_3.csv

select SUM(ACCT_NET_AMT) from TAX_PAYMENT_T;

spool off




spool ./data/TAX_PAYMENT_T_SUM_7.csv

select SUM(ACCT_NET_AMT) from tax_payment_t@DBLINK;

spool off