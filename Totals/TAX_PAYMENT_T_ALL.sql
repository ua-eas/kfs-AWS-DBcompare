set markup html on spool on
spool C:\tounou\data\kfdvu_TAX_PAYMENT_T.xls
select * from TAX_PAYMENT_T;
spool off
