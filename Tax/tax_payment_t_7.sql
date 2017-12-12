set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/tax_payment_t_7.xls

select * from kulowner.tax_payment_t
 WHERE DISB_DT  BETWEEN TO_DATE ('YEAR/04/01', 'yyyy/mm/dd')
AND TO_DATE ('YEAR/04/07', 'yyyy/mm/dd')
order by PAYMENT_ID,
PAYMENT_GRP_ID,
PMT_ACCT_DETAIL_ID,
ACCOUNT_NBR,
PAYEE_ID,
DISB_NBR  ASC;


spool off
