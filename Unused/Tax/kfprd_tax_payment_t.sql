set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/kfprd.xls

select * from kulowner.tax_payment_t@uazkfprd
order by PAYMENT_ID,
PAYMENT_GRP_ID,
PMT_ACCT_DETAIL_ID,
ACCOUNT_NBR,
PAYEE_ID,
DISB_NBR  ASC;


spool off

