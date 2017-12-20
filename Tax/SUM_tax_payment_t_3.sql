et colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     


spool ./data/sum_all3.xls

select SUM(ACCT_NET_AMT) from tax_payment_t;

spool off




