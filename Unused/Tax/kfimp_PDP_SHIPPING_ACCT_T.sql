set colsep ','     
set pagesize 0   
set trimspool on 
set headsep off     

SELECT CURRENT_TIMESTAMP FROM DUAL;


spool ./data/kfimp.xls

select * from kulowner.PDP_SHIPPING_ACCT_T
order by SHIPPING_ACCOUNT_NBR, ACCOUNT_NBR, PRNCPL_ID asc;



spool off
