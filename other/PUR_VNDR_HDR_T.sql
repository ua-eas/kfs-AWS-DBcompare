set markup html on spool on
spool C:\tounou\data\kfimp_PUR_VNDR_HDR_T.xls
select * from PUR_VNDR_HDR_T;
spool off
