SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/kfimp.xls

select * from kulowner.PDP_SHIPPING_ACCT_T
order by SHIPPING_ACCOUNT_NBR, ACCOUNT_NBR, PRNCPL_ID asc;



spool off
