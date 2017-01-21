set markup html on spool on
spool C:\tounou\data\kfimp_TAX_PAYEE_T.xls
select * from TAX_PAYEE_T;
spool off
