set markup html on spool on
spool C:\tounou\data\kfimp_PDP_SHIPPING_ACCT_T.xls
select * from PDP_SHIPPING_ACCT_T;
spool off
