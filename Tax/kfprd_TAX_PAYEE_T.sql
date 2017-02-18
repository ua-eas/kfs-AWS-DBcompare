SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 
spool ./data/kfprd.xls
select count(1) from KULOWNER.tax_payee_t@uazkfprd
select * from KULOWNER.tax_payee_t@uazkfprd  order by payee_id , VNDR_HDR_GNRTD_ID asc;
