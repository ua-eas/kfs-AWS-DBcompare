
SELECT CURRENT_TIMESTAMP FROM DUAL;

set markup html on spool on 
spool ./data/kfprd.xls
select * from KULOWNER.tax_payee_t@uazkfprd  order by payee_id , VNDR_HDR_GNRTD_ID asc;
