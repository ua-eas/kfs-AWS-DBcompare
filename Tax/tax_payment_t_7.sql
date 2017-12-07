SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on

spool ./data/tax_payment_t_7.xls

select * from kulowner.tax_payment_t
order by PAYMENT_ID,
PAYMENT_GRP_ID,
PMT_ACCT_DETAIL_ID,
ACCOUNT_NBR,
PAYEE_ID,
DISB_NBR  ASC;


spool off

