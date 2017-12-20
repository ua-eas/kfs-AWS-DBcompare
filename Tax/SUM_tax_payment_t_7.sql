et colsep ','     
set pagesize 0   
set trimspool on 
set headsep off
set numwidth 20     


spool ./data/sum_all7.xls

select SUM(ACCT_NET_AMT) from tax_payment_t;

spool off




