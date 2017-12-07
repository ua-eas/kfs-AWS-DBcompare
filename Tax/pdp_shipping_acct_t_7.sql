SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 

spool ./data/pdp_7.xls

select * from kulowner.PDP_SHIPPING_ACCT_T@uazkfprd
order by SHIPPING_ACCOUNT_NBR, ACCOUNT_NBR, PRNCPL_ID asc;



spool off
